﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using FluentData;
namespace TestAndroid.DAL
{
    public class BaseDAL
    {
        public static IDbContext WDbContext()
        {
            string strConn = ConfigurationManager.AppSettings["SqlServer_RM_DB"];
            return new DbContext().ConnectionString(strConn, new SqlServerProvider());
        }
    }
}