using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using YesHJ.Rest;
using DataBase.Dal;
namespace OpWeb.Handler
{
    /// <summary>
    /// BlackUserHandler 的摘要说明
    /// </summary>
    public class BlackUserHandler : RestHandler
    {
       
        public int deleteBlackUser(string id) {
            BlackUserService blackService = new BlackUserService();
            var retData = 0;
            if (string.IsNullOrWhiteSpace(id)) {
                return retData;
            }
            return blackService.deleteBlackUser(id);
        }

        public int deleteClientType(int id) {
            CustomTypeService typeService = new CustomTypeService();
            return typeService.RemoveCustomType(id);
        }
    }
}