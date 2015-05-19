using System;
using System.Collections.Generic;

namespace IAS.Models
{
    public partial class v_alarmas_activas
    {
        public long AlarmID { get; set; }
        public long StateID { get; set; }
        public int Interval { get; set; }
        public string ApplicationUser_Id { get; set; }
        public long CaseID { get; set; }
        public string PriorityName { get; set; }
        public string Description { get; set; }
        public string CreationDate { get; set; }
        public string EffectiveDate { get; set; }
        public Nullable<int> OverTimed { get; set; }
        public string Message { get; set; }
        public string Editar { get; set; }
        public string UserName { get; set; }
    }
}
