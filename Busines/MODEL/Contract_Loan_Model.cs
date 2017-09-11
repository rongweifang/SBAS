using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Busines.MODEL
{
    /// <summary>
	/// Contract_Loan:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
  public partial class Contract_Loan_Model
    {
        public Contract_Loan_Model()
        { }
        #region Model
        private Guid _loanid;
        private string _contractid;
        private string _card_id;
        private string _card_name;
        private decimal? _m_loan;
        private decimal? _loan_balance;
        private int? _m_loan_months;
        private string _m_replay_type;
        private string _m_rate_year;
        private string _m_rate_month;
        private int? _current_month;
        private DateTime? _loan_startdate;
        private DateTime? _loan_settledate;
        private DateTime? _createdate;
        private string _userid;
        /// <summary>
        /// 
        /// </summary>
        public Guid LoanID
        {
            set { _loanid = value; }
            get { return _loanid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ContractID
        {
            set { _contractid = value; }
            get { return _contractid; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Card_ID
        {
            set { _card_id = value; }
            get { return _card_id; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string Card_Name
        {
            set { _card_name = value; }
            get { return _card_name; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal? M_Loan
        {
            set { _m_loan = value; }
            get { return _m_loan; }
        }
        /// <summary>
        /// 
        /// </summary>
        public decimal? Loan_Balance
        {
            set { _loan_balance = value; }
            get { return _loan_balance; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? M_Loan_Months
        {
            set { _m_loan_months = value; }
            get { return _m_loan_months; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string M_Replay_Type
        {
            set { _m_replay_type = value; }
            get { return _m_replay_type; }
        }
        public string M_Rate_Year
        {
            set { _m_rate_year = value; }
            get { return _m_rate_year; }
        }
        public string M_Rate_Month
        {
            set { _m_rate_month = value; }
            get { return _m_rate_month; }
        }
        /// <summary>
        /// 
        /// </summary>
        public int? Current_Month
        {
            set { _current_month = value; }
            get { return _current_month; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? Loan_StartDate
        {
            set { _loan_startdate = value; }
            get { return _loan_startdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? Loan_SettleDate
        {
            set { _loan_settledate = value; }
            get { return _loan_settledate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime? CreateDate
        {
            set { _createdate = value; }
            get { return _createdate; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string UserID
        {
            set { _userid = value; }
            get { return _userid; }
        }
        #endregion Model
    }
}
