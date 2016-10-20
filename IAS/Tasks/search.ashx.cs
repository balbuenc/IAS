using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace IAS.Tasks
{
    /// <summary>
    /// Summary description for search
    /// </summary>
    [WebService(Namespace = "IAS/http-handlers/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    public class search : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string json = string.Empty;
            List<string> tasks = new List<string>();
            // note the httpcontext.Request contains the search term
            if (!string.IsNullOrEmpty(context.Request["term"]))
            {
                string searchTerm = context.Request["term"];

                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = System.Configuration.ConfigurationManager.AppSettings["IASDBContext"];
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.CommandText = "[task].[sp_search_task]";
                        cmd.Parameters.AddWithValue("@find", searchTerm);
                        cmd.Connection = conn;
                        conn.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            while (sdr.Read())
                            {
                                tasks.Add(sdr["task"].ToString());
                            }
                        }
                        conn.Close();
                    }
                }

                if (tasks.Count != 0)
                {
                    var transformList = new List<ResponseData>();

                    for (int index = 0; index < tasks.Count; index++)
                    {
                        transformList.Add(new ResponseData
                        {
                            Task = tasks[index].ToString()
                        });
                    }

                    // call Newtonsoft.Json function to serialize list into JSON
                    json = JsonConvert.SerializeObject(transformList);
                }

            }

            // write the JSON (or nothing) to the response
            context.Response.Write(json);
        }
        
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
    [Serializable]
    public class ResponseData
    {
        public string Task;
    }
}