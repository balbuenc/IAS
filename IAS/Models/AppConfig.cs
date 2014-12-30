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


using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IAS.Models
{
    public partial class AppConfig
    {

        public AppConfig()
        {
        }

        [ScaffoldColumn( false )]
        public int AppConfigID { get; set; }

        public long CollectionWorkflowID { get; set; }
        [ForeignKey( "CollectionWorkflowID" )]
        public Workflow CollectionWorkflow { get; set; }

        public int DefaultCasePriorityID { get; set; }
        [ForeignKey( "DefaultCasePriorityID" )]
        public CasePriority DefaultCasePriority { get; set; }

        public long CollectionInitialStateID { get; set; }
        [ForeignKey( "CollectionInitialStateID" )]
        public State CollectionInitialState { get; set; }

        public long CollectionFinalStateID { get; set; }
        [ForeignKey( "CollectionFinalStateID" )]
        public State CollectionFinalState { get; set; }

        public string DefaultUserID { get; set; }
        [ForeignKey( "DefaultUserID" )]
        public ApplicationUser DefaultUser { get; set; }

        public int EffectiveDaysThreshold { get; set; }

    }
}
