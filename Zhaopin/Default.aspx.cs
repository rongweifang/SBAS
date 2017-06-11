using Busines;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.DataBindGrid();
                this.DataBindGrid2();
                this.DataBindGrid3();
            }
        }
        private void DataBindGrid()
        {
            //StringBuilder strSql = new StringBuilder();
            //strSql.Append("SELECT TOP 4 [newsID],[newsTypeID],[title],[pubdate]  FROM [News] WHERE [newsTypeID]=1");
            //DataTable dt= DataFactory.SqlDataBase().GetDataTableBySQL(strSql, null);
            //ControlBindHelper.BindRepeaterList(dt, this.rp_Notice);
        }
        private void DataBindGrid2()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TOP 4 [newsID],[newsTypeID],[title],[pubdate]  FROM [News] WHERE [newsTypeID]=2");
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, null);
            ControlBindHelper.BindRepeaterList(dt, this.rp_News);
        }
        private void DataBindGrid3()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TOP 4 *  FROM Company WHERE DeleteMark=0 ORDER BY CreateDate ASC ");
            // StringBuilder strSql = new StringBuilder();
            // strSql.Append("SELECT TOP 4 [newsID],[newsTypeID],[title],[pubdate]  FROM [News] WHERE [newsTypeID]=3");
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, null);
            ControlBindHelper.BindRepeaterList(dt, this.rp_CNews);
        }

    }
}