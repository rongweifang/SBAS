using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using Common.DotNetBean;
using Common.DotNetData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Busines.DAL;
using Busines.IDAO;
using Busines.MODEL;

namespace OpWeb.Approve
{
    public partial class Approve_Issue : System.Web.UI.Page
    {
        private string UID;
        public string Card_ID;
        public string Card_Name;
        public string M_Loan;
        public string M_Loan_Months;
        public string M_Replay_Type;
        private Contract_IDAO ciday = new Contract_Dal();
        private bool isExist = true;
        private string _M_Rate_Year;
        private string _M_Rate_Month;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UID = base.Request["ID"];
            if (!string.IsNullOrEmpty(this.UID))
            {
                this.InitData();

            }
        }
        private void InitData()
        {
            DataTable dt = ciday.GetContractInfoByID(UID);
            if (DataTableHelper.IsExistRows(dt))
            {
                DataRow dr = dt.Rows[0];

                Card_ID = dr["Card_ID"].ToString();
                Card_Name = dr["Card_Name"].ToString();
                M_Loan = dr["M_Loan"].ToString();
                M_Loan_Months = dr["M_Loan_Months"].ToString();
                M_Replay_Type = dr["M_Replay_Type"].ToString();
                //this.Loan_StartDate.Value = DateTime.Now.ToString("yyyy-MM-dd");

                _M_Rate_Year= dr["M_Rate_Year"].ToString();
                _M_Rate_Month = dr["M_Rate_Month"].ToString();
                isExist = ciday.Contract_Loan_Exists(UID);
                this.Save.Visible = !isExist;
            }
            //GetContractInfoByID
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.UID))
            {
                if (!isExist)
                {
                    SaveData();
                }
            }

        }
        private void SaveData()
        {
            decimal _Loan = 0m;
            if (decimal.TryParse(M_Loan, out _Loan))
            {
                Contract_Loan_Model CLM = new Contract_Loan_Model();
                CLM.ContractID = UID;
                CLM.Card_ID = Card_ID;
                CLM.Card_Name = Card_Name;
                CLM.M_Loan = _Loan;
                CLM.Loan_Balance = _Loan;
                CLM.M_Loan_Months = int.Parse(M_Loan_Months);
                CLM.M_Replay_Type = M_Replay_Type;
                CLM.Current_Month = 1;
                CLM.M_Rate_Month = _M_Rate_Month;
                CLM.M_Rate_Year = _M_Rate_Year;
                CLM.UserID = RequestSession.GetSessionUser().UserId.ToString();

                DateTime StartDate;
                if (DateTime.TryParse(Loan_StartDate.Value,out StartDate))
                {
                    CLM.Loan_StartDate = StartDate;

                    string _SettleDate = "";
                    int _day =int.Parse(StartDate.ToString("dd"));
                    if (_day<20)//当月20号是第一期
                    {
                        _SettleDate = string.Format("{0}-{1}-20", StartDate.Year, StartDate.Month);
                    }
                    else
                    {
                        _SettleDate = string.Format("{0}-{1}-20", StartDate.Year, StartDate.AddMonths(1).Month);
                    }
                    CLM.Loan_SettleDate = DateTime.Parse(_SettleDate);
                }

                bool reslt = ciday.Contract_Loan_Add(CLM);
                if (reslt)
                {
                    this.Save.Visible = false;
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('操作成功！');setTimeout('OpenClose()','2000');</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('操作失败！');</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('贷款金额不合法！');</script>");
            }


        }
    }
}