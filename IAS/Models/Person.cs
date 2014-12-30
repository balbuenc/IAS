//«Copyright 2014 Balcazz HT, http://www.balcazzht.com»

//This file is part of IAS | Insurance Advanced Services.

//IAS is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.

//IAS is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with Foobar.  If not, see <http://www.gnu.org/licenses/>.


using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace IAS.Models
{
    public partial class Person
    {

        public Person()
        {
            ApplicationUsers = new HashSet<ApplicationUser>();
        }

        [ScaffoldColumn( false )]        
        public long PersonID { get; set; }

        public long DocumentTypeID { get; private set; }
        public virtual DocumentType DocumentType { get; private set; }
        [StringLength(30)]
        public string DocumentNumber { get; private set; }
        [StringLength(100)]
        public string FirstName { get; private set; }
        [StringLength(100)]
        public string LastName { get; private set; }
        [StringLength(100)]
        public string LastName1 { get; private set; }
        [StringLength(200)]
        public string CorporateName { get; private set; } //Razón social
        public DateTime? BirthDate { get; set; }
        public string Gender { get; private set; }
        [StringLength(100)]
        public string HomeAddress { get; private set; }
        [StringLength(30)]
        public string HomePhone { get; private set; }
        [StringLength(30)]
        public string HomePhone1 { get; private set; }
        [StringLength(30)]
        public string MobilePhone { get; private set; }
        [StringLength(100)]
        public string Email { get; private set; }
        [StringLength(100)]
        public string BusinessAddress { get; private set; }
        [StringLength(30)]
        public string BusinessPhone { get; private set; }
        [StringLength(100)]
        public string BusinessEmail { get; private set; }
        [StringLength(1)]
        public string PersonType { get; private set; }
        public string Comments { get; private set; }

        public int? DocumentType2ID { get; private set; }
        public string DocumentNumber2 { get; private set; }
        public int? NationalityID { get; private set; }
        public int? MaritalStatusID { get; private set; }
        [StringLength(100)]
        public string HomeAddress2 { get; private set; }
        [StringLength(100)]
        public string HomeAddress3 { get; private set; }
        [StringLength(10)]
        public string HomeAddressNumber { get; private set; }
        [StringLength(10)]
        public string FloorNumber { get; private set; }
        [StringLength(10)]
        public string ApartmentHomeAddressNumber { get; private set; }
        public int? CountryHomeAddressID { get; private set; }
        public int? DeparmentHomeAddressID { get; private set; }
        public int? CityHomeAddressID { get; private set; }
        public int? NeighborhoodHomeAddressID { get; private set; }
        [StringLength(100)]
        public string BusinessAddress2 { get; private set; }
        [StringLength(100)]
        public string BusinessAddress3 { get; private set; }        
        [StringLength(10)]
        public string BusinessAddressNumber { get; private set; }
        [StringLength(10)]
        public string BusinessFloorNumber { get; private set; }
        [StringLength(10)]
        public string ApartmentBusinessAddressNumber { get; private set; }
        public int? CityBusinessAddressID { get; private set; }
        public int? NeighborhoodBusinessAddressID { get; private set; }
        public int? CountryBusinessAddressID { get; private set; }
        public int? DeparmentBusinessAddressID { get; private set; }
        [StringLength(30)]
        public string BusinessPhone2 { get; private set; }
        public int? ProfessionID { get; private set; }
        public int? ProfessionActivityID { get; private set; }

        public int? LoadedByBusinessID { get; private set; }
        public int? LoadedByBusinessBranchID { get; private set; }
        [StringLength(20)]
        public string LoadedByUserID { get; private set; }
        public DateTime? LoadedDate { get; private set; }
        public int? OfficceID { get; private set; }
        [StringLength(20)]
        public string ProduccionID { get; private set; }
        [StringLength(20)]
        public string Produccion1ID { get; private set; }
        public int? ModifiedByBusinessID { get; private set; }
        public int? ModifiedByBusinessBranchID { get; private set; }
        [StringLength(20)]
        public string ModifiedByUserID { get; private set; }
        public DateTime? ModifiedDate { get; private set; }
        public string PersonPhoto { get; private set; }

        public virtual ICollection<ApplicationUser> ApplicationUsers { get; set; }

        [NotMapped]
        public virtual string FullName { 
            get {
                return string.Format("{0} {1} {2}",FirstName, LastName, LastName1);
            }
        }

        [NotMapped]
        public virtual string UserAssigment
        {
            get
            {
                var user = this.ApplicationUsers.FirstOrDefault();
                if (null != user)
                    return ApplicationUsers.FirstOrDefault().FullName;
                else
                    return "No asignado";
            }
        }

        public override string ToString()
        {
            return string.Format("{0} {1} {2}", FirstName , LastName , LastName1);
        }


    }
}
