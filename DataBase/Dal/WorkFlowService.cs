﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using TestAndroid.DAL;
using DataBase.Model;
using DataBase.Enums;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetData;
using Common.DotNetUI;
using Common.DotNetConfig;
using PDA_Service.DataBase.DataBase.SqlServer;

namespace DataBase.Dal
{
    public class WorkFlowService : BaseDAL
    {
        public string CreateWorkFlow(string contractId)
        {
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            double loan = GetLoan(contractId);

            return CreateWorkFlow(contractId, UserId, loan);
        }
        public double GetLoan(string ContractID)
        {
            double loan = 0d;
            StringBuilder sb = new StringBuilder();
            sb.Append(@"SELECT M_Loan  FROM View_Contract  WHERE [UID]=@ContractID");

            DataTable dt = SqlDataBase().GetDataTableBySQL(sb, new SqlParam[] { new SqlParam("@ContractID", ContractID) });
            if (DataTableHelper.IsExistRows(dt))
            {
                if (double.TryParse(dt.Rows[0][0].ToString(), out loan))
                {

                }
            }
            return loan;
        }

        public IDbHelper SqlDataBase()
        {
            return new SqlServerHelper(ConfigHelper.GetAppSettings("SqlServer_RM_DB"));
        }

        /// <summary>
        /// 创建工作流
        /// </summary>
        /// <param name="contractId">合同ID</param>
        /// <param name="contractAmount">合同金额</param>
        /// <returns></returns>
        public string CreateWorkFlow(string contractId, string currentUserId, double contractAmount)
        {
            string retMsg = "true";
            if (string.IsNullOrWhiteSpace(contractId) || contractAmount <= 0)
            {
                retMsg = "合同不存在或合同金额错误";
                return retMsg;
            }
            var workFlowInfo = GetWorkFlowInfoByAmount(contractAmount);
            if (workFlowInfo == null)
            {
                retMsg = "流程不存在";
                return retMsg;
            }
            var activities = GetWorkActivity(workFlowInfo.ID);
            var wfId = Guid.NewGuid().ToString();
            var workFlow = new WF_WorkFlow()
            {
                ContractId = contractId,
                Creater = currentUserId,
                CreateTime = DateTime.Now,
                CurrentActivityId = "",
                NextActivityId = "",
                Id = Guid.NewGuid().ToString(),
                Requester = currentUserId,
                StatusDescrip = "",
                WFStatus = (int)WorkFlowStatus.Approving,
                WorkInfoId = workFlowInfo.ID
            };

            using (var context = WDbContext())
            {
                context.Insert("WF_WorkFlow")
                    .Column("Id", workFlow.Id)
                    .Column("WorkInfoId", workFlow.WorkInfoId)
                    .Column("ContractId", workFlow.ContractId)
                    .Column("WFStatus", (int)WorkFlowStatus.Approving)
                    .Column("CurrentActivityId", workFlow.CurrentActivityId)
                    .Column("NextActivityId", workFlow.NextActivityId)
                    .Column("Requester", workFlow.Requester)
                    .Column("Creater", workFlow.Creater)
                    .Column("CreateTime", workFlow.CreateTime)
                    .Column("IsFinish", "0")
                    .Execute();

            }
            foreach (var itm in activities)
            {
                if (itm.Step == 1)
                {
                    AddProcess(itm, workFlow);
                }
                //if (itm.ApproveType != (int)ApproveType.Skip) {
                //    break;
                //}
            }
            return retMsg;
        }

        /// <summary>
        /// 添加过程
        /// </summary>
        /// <param name="activity"></param>
        /// <returns></returns>
        public int AddProcess(WF_Activity activity, WF_WorkFlow workFlow)
        {
            var execResult = 0;
            if (activity == null || workFlow == null)
            {
                return execResult;
            }
            int? operate = null;
            DateTime? operateTime = null;
            string remark = "";
            bool isFinish = false;
           // List<UserInfo> userList = new List<UserInfo>();
            //switch (activity.ApproveType)
            //{
            //    //case (int)ApproveType.Department:
            //    //    userList = GetUserByDepartId(activity.Department);
            //    //    break;
            //    //case (int)ApproveType.Group:
            //    //    userList = GetUserByGroupId(activity.GroupId);
            //    //    break;
            //    case (int)ApproveType.Role:
            //        userList = GetUserByRole(activity.RoleId);
            //        break;
            //    //case (int)ApproveType.Skip:
            //    //    userList.Add(new UserInfo()
            //    //    {
            //    //        User_ID = workFlow.Requester
            //    //    });
            //    //    operate = (int)OperateEnum.Submit;
            //    //    operateTime = DateTime.Now;
            //    //    remark = "合同提交";
            //    //    isFinish = true;
            //    //    break;
            //    //case (int)ApproveType.Submitter:
            //    //    userList.Add(new UserInfo()
            //    //    {
            //    //        User_ID = workFlow.Requester
            //    //    });
            //    //    break;
            //    default:
            //        break;
            //}

            using (var context = WDbContext())
            {
                //foreach (var itm in userList)
                //{
                    execResult += context.Insert("WF_Process")
                        .Column("WorFlowId", workFlow.Id)
                        .Column("ActivityId", activity.Id)
                        .Column("Step", activity.Step)
                        .Column("ApproverID", RequestSession.GetSessionUser().UserId.ToString())
                        .Column("Operate", operate)
                        .Column("operateTime", operateTime)
                        .Column("Remark", remark)
                        .Column("IsFinish", isFinish)
                        .Column("CreateTime", DateTime.Now)
                        .Execute();
              //  }

                //更新流程状态
                context.Update("WF_WorkFlow")
                    .Column("CurrentActivityId", activity.Id)
                    .Where("Id", workFlow.Id)
                    .Execute();
            }

            return execResult;
        }

        /// <summary>
        /// 根据部门ID获取对应的用户
        /// </summary>
        /// <param name="departId"></param>
        /// <returns></returns>
        public List<UserInfo> GetUserByDepartId(string departId)
        {
            List<UserInfo> retList = new List<UserInfo>();
            if (string.IsNullOrWhiteSpace(departId))
            {
                return retList;
            }
            using (var context = WDbContext())
            {
                retList = context.Sql(@"select u.User_ID,u.User_Code,u.User_Name
                                from Base_Organization o with(nolock)
                                join Base_StaffOrganize bs on o.Organization_ID = bs.Organization_ID
                                     join Base_UserInfo u on bs.User_ID = u.User_ID
                                where u.DeleteMark = 1 and o.Organization_ID = @oid")
                                .Parameter("oid", departId)
                                .QueryMany<UserInfo>();
                return retList;
            }
        }

        /// <summary>
        /// 根据用户组获取用户列表
        /// </summary>
        /// <param name="groupId"></param>
        /// <returns></returns>
        public List<UserInfo> GetUserByGroupId(string groupId)
        {
            List<UserInfo> retList = new List<UserInfo>();
            if (string.IsNullOrWhiteSpace(groupId))
            {
                return retList;
            }
            using (var context = WDbContext())
            {
                retList = context.Sql(@"select u.User_ID,u.User_Name,u.User_Code
                                    from Base_UserInfo u join Base_UserInfoUserGroup ug on u.User_ID=ug.User_ID
                                    join Base_UserGroup g on g.UserGroup_ID=ug.UserGroup_ID
                                    where u.DeleteMark=1 and ug.UserGroup_ID=@gid")
                                    .Parameter("gid", groupId)
                                    .QueryMany<UserInfo>();
                return retList;
            }
        }

        /// <summary>
        /// 根据用户角色获取用户列表
        /// </summary>
        /// <param name="roleId">用户角色</param>
        /// <returns></returns>
        public List<UserInfo> GetUserByRole(string roleId)
        {
            List<UserInfo> retList = new List<UserInfo>();
            if (string.IsNullOrWhiteSpace(roleId))
            {
                return retList;
            }
            using (var context = WDbContext())
            {
                retList = context.Sql(@"select u.User_ID,u.User_Name,u.User_Code 
                                        from Base_UserInfo u join Base_UserRole ur on u.User_ID=ur.User_ID
                                        join Base_Roles r on r.Roles_ID=ur.Roles_ID
                                        where u.DeleteMark=1 and r.Roles_ID=@roleId")
                                    .Parameter("roleId", roleId)
                                    .QueryMany<UserInfo>();
                return retList;
            }
        }


        /// <summary>
        /// 根据金额获取工作流信息
        /// </summary>
        /// <param name="amount"></param>
        /// <returns></returns>0
        public WF_WorkFlowInfo GetWorkFlowInfoByAmount(double amount)
        {
            using (var context = WDbContext())
            {
                var workFlowInfo = context.Select<WF_WorkFlowInfo>("ID,WFName,Descript,AmountFrom,AmountTo,CreateTime")
                                          .From("WF_WorkFlowInfo")
                                          .Where("AmountFrom<@amFrom and (AmountTo>@amFrom or AmountTo=0)")
                                          .Parameter("amFrom", amount)
                                          .QuerySingle();
                return workFlowInfo;
            }
        }

        /// <summary>
        /// 根据工作流ID获取对应的步骤
        /// </summary>
        /// <param name="flowInfoId">工作流ID</param>
        /// <returns></returns>
        public List<WF_Activity> GetWorkActivity(string flowInfoId)
        {
            List<WF_Activity> retList = null;
            if (string.IsNullOrWhiteSpace(flowInfoId))
            {
                return retList;
            }
            using (var context = WDbContext())
            {
                retList = context.Select<WF_Activity>("Id,FlowInfoId,ActName,Step,RoleId,GroupId,ApproverCount,ApproveType,ActType,CreateTime")
                                               .From("WF_Activity")
                                               .Where("FlowInfoId=@followId")
                                               .OrderBy("step asc")
                                               .Parameter("followId", flowInfoId)
                                               .QueryMany();
            }
            return retList;

        }

        /// <summary>
        /// 根据ID获取流程信息
        /// </summary>
        /// <param name="flowInfoId"></param>
        /// <returns></returns>
        public WF_WorkFlow GetWorkFlow(string flowInfoId)
        {
            WF_WorkFlow retData = null;
            if (string.IsNullOrEmpty(flowInfoId))
            {
                return retData;
            }
            using (var context = WDbContext())
            {
                retData = context.Sql(@"select id,WorkInfoId,ContractId,CurrentActivityId,NextActivityId,StatusDescrip,WFStatus,IsFinish,Requester,Creater,CreateTime
                            from WF_WorkFlow
                            where id=@id")
                            .Parameter("id", flowInfoId)
                            .QuerySingle<WF_WorkFlow>();
                return retData;
            }
        }

        public List<WF_Process> GetProcessByWorkFlowId(string flowId, int isFinish)
        {
            List<WF_Process> retList = null;
            if (string.IsNullOrWhiteSpace(flowId))
            {
                return retList;
            }
            using (var context = WDbContext())
            {
                retList = context.Sql(@"select id,WorFlowId,ActivityId,Step,ApproverID,Operate,OperateTime,Remark,IsFinish,CreateTime
                                     from WF_Process
                                    where WorFlowId = @wfid and IsFinish = @isFinish")
                                    .Parameter("wfid", flowId)
                                    .Parameter("isFinish", isFinish)
                                    .QueryMany<WF_Process>();
                return retList;
            }
        }


    }
}
