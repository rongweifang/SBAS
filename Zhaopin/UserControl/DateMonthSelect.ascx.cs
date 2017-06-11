using Common.DotNetUI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserControl
{
    public partial class DateMonthSelect : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.BindSelectYear();
            this.BindSelectMonth();

        }
        public int selectedYear
        {
            get;
            set;
        }

        public int selectedMonth
        {
            get;
            set;
        }

        private void BindSelectYear()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("year", typeof(int));
            int maxyear = int.Parse(DateTime.Now.Year.ToString()) + 1;
            for (int i = maxyear; i > 1984; i--)
            {
                DataRow dr = dt.NewRow();
                dr["year"] = i;
                dt.Rows.Add(dr);
            }
            this.slYear.DataSource = dt;
            this.slYear.DataTextField = "year";
            this.slYear.DataBind();
           // slYear.SelectedIndex = 0;
            slYear.SelectedValue = selectedYear.ToString();
        }

        private void BindSelectMonth()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("month", typeof(int));
            for (int i = 1; i < 13; i++)
            {
                DataRow dr = dt.NewRow();
                dr["month"] = i;
                dt.Rows.Add(dr);
            }

            this.slMonth.DataSource = dt;
            this.slMonth.DataTextField = "month";
            this.slMonth.DataBind();
          //  slMonth.SelectedIndex = 0;
            slMonth.SelectedValue = selectedMonth.ToString();
        }

        protected void slYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.selectedYear = int.Parse(slYear.SelectedValue);
        }

        protected void slMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.selectedMonth = int.Parse(slMonth.SelectedValue);
        }

        public void DateSelectSet(int year, int month)
        {
            this.selectedYear = year;
            this.selectedMonth = month;
        }
    }
}