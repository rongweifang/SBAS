using DataBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TestAndroid.DAL;
namespace DataBase.Dal
{
    public class BlackUserService : BaseDAL
    {
        /// <summary>
        /// 获取黑名单列表
        /// </summary>
        /// <param name="cardId"></param>
        /// <param name="userName"></param>
        /// <param name="pageIndex"></param>
        /// <param name="pageSize"></param>
        /// <param name="recordCount"></param>
        /// <returns></returns>
        public List<BlackUser> getBlackUsers(string cardId, string userName, int pageIndex, int pageSize, out int recordCount) {
            recordCount = 0;
            List<BlackUser> retList = null;
            if (pageIndex <= 0 || pageSize <= 0) {
                return retList;
            }
            using (var context = WDbContext())
            {
                var selectBuilder = context.Select<BlackUser>("BlackID,Card_Id,Card_Name,U_Tel,User_ID,User_Name,STATE,AddDate,MEMO,FLAG,CreateDate")
                    .From("Base_User_BlackList")
                    .Paging(pageIndex, pageSize)
                    .OrderBy("AddDate desc");
                var selectBuilderCount = context.Select<int>("count(1)")
                   .From("Base_User_BlackList");
                if (!string.IsNullOrWhiteSpace(cardId)) {
                    selectBuilder.OrWhere("Card_Id=@cardId").Parameter("cardId", cardId);
                    selectBuilderCount.OrWhere("Card_Id=@cardId").Parameter("cardId", cardId);
                }
                if (!string.IsNullOrWhiteSpace(userName)) {
                    selectBuilder.OrWhere(string.Format(" Card_Name like '%{0}%'", userName));
                    selectBuilderCount.OrWhere(string.Format(" Card_Name like '%{0}%'", userName));
                }
                recordCount = selectBuilderCount.QuerySingle();
                if (recordCount > 0) {
                    retList = selectBuilder.QueryMany();
                }
            }

            return retList;
        }

        public int addBlackUser(BlackUser user) {
            var retData = 0;
            if (user == null || string.IsNullOrWhiteSpace(user.Card_Id) || string.IsNullOrWhiteSpace(user.Card_Name)) {
                return retData;
            }
            using (var context = WDbContext()) {
                return context.Insert("Base_User_BlackList")
                    .Column("BlackID", Guid.NewGuid())
                    .Column("Card_Id",user.Card_Id)
                    .Column("Card_Name",user.Card_Name)
                    .Column("U_Tel",user.U_Tel)
                    .Column("User_ID", user.User_ID)
                    .Column("User_Name",user.User_Name)
                    .Column("STATE",user.STATE)
                    .Column("AddDate",user.AddDate)
                    .Column("MEMO",user.MEMO)
                    .Column("FLAG",user.FLAG)
                    .Column("CreateDate",user.CreateDate)
                    .Execute();
            }
        }

        public int editBlackUser(BlackUser user) {
            var retData = 0;
            if (user == null || string.IsNullOrWhiteSpace(user.Card_Id) || string.IsNullOrWhiteSpace(user.Card_Name)) {
                return retData;
            }
            using (var context = WDbContext())
            {
                return context.Update("Base_User_BlackList")
                     .Column("Card_Id", user.Card_Id)
                     .Column("Card_Name", user.Card_Name)
                     .Column("U_Tel", user.U_Tel)
                     .Column("User_ID", user.User_ID)
                     .Column("User_Name", user.User_Name)
                     .Column("STATE", user.STATE)
                     .Column("MEMO", user.MEMO)
                     .Column("FLAG", user.FLAG)
                     .Where("BlackID", user.BlackID)
                     .Execute();
            }
        }

        public BlackUser getUserById(string userId) {
            BlackUser blackUser = null;
            if (String.IsNullOrWhiteSpace(userId))
            {
                return blackUser;
            }
            using (var context = WDbContext()) {
                string strSql = @"select BlackID,Card_Id,Card_Name,U_Tel,User_ID,User_Name,STATE,AddDate,MEMO,FLAG,CreateDate
                                from Base_User_BlackList where BlackID='{0}'";
                strSql = string.Format(strSql, userId);
                blackUser = context.Sql(strSql)
                    .QuerySingle<BlackUser>();
            }
            return blackUser;
        }

        public int deleteBlackUser(string blackUserId) {
            if (string.IsNullOrWhiteSpace(blackUserId)) {
                return 0;
            }
            using (var context = WDbContext()) {
                return context.Delete("Base_User_BlackList")
                    .Where("BlackID", blackUserId)
                    .Execute();
            }
        }

        /// <summary>
        /// 判断用户信息是否已存在
        /// </summary>
        /// <param name="cardId"></param>
        /// <returns></returns>
        public bool checkUserExists(string cardId,string uncludeId)
        {
            if (string.IsNullOrWhiteSpace(cardId))
            {
                return true;
            }

            using (var context = WDbContext())
            {
                string strSql = string.Format("select count(1)from Base_User_BlackList where Card_Id='{0}'", cardId);
                if (!string.IsNullOrWhiteSpace(uncludeId)) {
                    strSql += string.Format(" and BlackID<>'{0}'",uncludeId);
                }
                return context.Sql(strSql).QuerySingle<int>() > 0;
            }
        }
    }
}
