﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using System.Web.Services;
using System.Data.SqlClient;

namespace IAS.Claims
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
            List<string> customers = new List<string>();
            // note the httpcontext.Request contains the search term
            if (!string.IsNullOrEmpty(context.Request["term"]))
            {
                string searchTerm = context.Request["term"];

                using (SqlConnection conn = new SqlConnection())
                {
                    conn.ConnectionString = @"Data Source = aibsql.cloudapp.net,1500; Initial Catalog = ias_developer; Persist Security Info = True; User ID = ias_desarrollo; Password = Passw0rd";
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.CommandText = "[claim].[sp_search_claim]";
                        cmd.Parameters.AddWithValue("@find", searchTerm);
                        cmd.Connection = conn;
                        conn.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            while (sdr.Read())
                            {
                                customers.Add(sdr["client"].ToString());
                            }
                        }
                        conn.Close();
                    }
                }
                
                if (customers.Count != 0)
                {
                    var transformList = new List<ResponseData>();

                    for (int index = 0; index < customers.Count; index++)
                    {
                        transformList.Add(new ResponseData
                        {
                            Client = customers[index].ToString()
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
        public string Client;
    }
}