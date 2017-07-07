using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TestAndroid.DAL;
using DataBase.Model;
namespace DataBase.Dal
{
    public class CustomTypeService:BaseDAL
    {
        public List<CustomType> GetCustomTypeList(string name) {
            List<CustomType> retList = null;
            using (var context = WDbContext()) {
                var selectBuilder = context.Select<CustomType>("Id,TypeNo,Name,CreateTime")
                                    .From("Base_ClientType");
                if (!string.IsNullOrWhiteSpace(name)) {
                    selectBuilder.AndWhere("name like'%"+name+"%'");
                }
                retList = selectBuilder.QueryMany();
                return retList;
            }
        }

        public int AddCustomeType(CustomType cType) {
            if (cType == null) {
                return 0;
            }
            using (var context = WDbContext()) {
                return context.Insert("Base_ClientType")
                       .Column("TypeNo", cType.TypeNo)
                       .Column("Name", cType.Name)
                       .Column("CreateTime", DateTime.Now)
                       .Execute();
            }
        }

        public CustomType GetCustomTypeById(int id) {
            CustomType retData = null;
            if (id <= 0) {
                return retData;
            }
            using (var context = WDbContext()) {
                retData=context.Sql(@"select Id, TypeNo, Name, CreateTime from Base_ClientType
                        where id = @id")
                        .Parameter("id", id)
                        .QuerySingle<CustomType>();
                return retData;
            }
        }

        public int ModifyCustomType(CustomType cType) {
            if (cType == null||cType.Id<=0) {
                return 0;
            }
            using (var context = WDbContext()) {
                var updateBuilder = context.Update("Base_ClientType")
                    .Column("TypeNo",cType.TypeNo)
                    .Column("Name",cType.Name)
                    .Where("Id", cType.Id);
                return updateBuilder.Execute();
            }
        }

        public int RemoveCustomType(int id) {
            if (id <= 0) {
                return 0;
            }
            using (var context = WDbContext()) {
                return context.Delete("Base_ClientType").Where("Id", id).Execute();
            }
        }
    }
}
