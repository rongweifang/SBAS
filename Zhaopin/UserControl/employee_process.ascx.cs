using Busines.DAL;
using Busines.IDAO;
using System;
using System.Collections;
using System.Text;

namespace Zhaopin.UserControl
{
    public partial class employee_process : System.Web.UI.UserControl
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        public StringBuilder sb = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                if (peridal.IsUserCheck())
                {
                    Response.Redirect("/UserCenter/");
                }
            }

        }

        public void showHtml(int thisstep)
        {
            int overstep = peridal.overstep();
            Hashtable ht = peridal.allstep();
            sb.Append("<div class=\"process\">");
            sb.Append("<ul class=\"gray\">");

            sb.Append("<li style=\"width:104px; margin-left:2px;\">");
            if (thisstep == 1)
            {
                sb.Append("<div id=\"step_1\" class=\"current\">");
            }
            else
            {
                sb.Append(" <div id=\"step_4\" class=\"current_on\">");
            }
            if (ht["STEP1"].ToString() == "1")
            {
                sb.Append("<div id=\"0\" class=\"icon_fill\"></div>");
            }
            else
            {
                sb.Append("<div id=\"0\" class=\"icon_fill_on\"></div>");
            }
            sb.Append("<div id=\"a_0\" class=\"process_text\"><a href=\"/UserCenter/profile.aspx\">个人信息</a></div>");
            sb.Append("</div>");
            sb.Append("</li>");

            sb.Append("<li style=\"width:104px;\">");
            if (thisstep == 2)
            {
                sb.Append(" <div id=\"step_2\" class=\"current\">");
            }
            else
            {
                sb.Append(" <div id=\"step_2\" class=\"current_on\">");
            }
            if (ht["STEP2"].ToString() == "1")
            {
                sb.Append("    <div id=\"1\" class=\"icon_fill\"></div>");
            }
            else
            {
                sb.Append("    <div id=\"1\" class=\"icon_fill_on\"></div>");
            }
            if (overstep >= 1)
            {
                sb.Append("	 <div id=\"a_1\" class=\"process_text\"><a href=\"/UserCenter/education.aspx\">学习经历</a></div>");
            }
            else
            {
                sb.Append("	 <div id=\"a_1\" class=\"process_text\">学习经历</div>");
            }
            sb.Append("  </div>");
            sb.Append("  </li>");


            sb.Append("   <li style=\"width:212px;\">");
            if (thisstep == 3)
            {
                sb.Append("  <div id=\"step_3\" class=\"current\">");
            }
            else
            {
                sb.Append("  <div id=\"step_3\" class=\"current_on\">");
            }
            if (ht["STEP3"].ToString() == "1")
            {
                sb.Append("     <div id=\"2\" class=\"icon_fill\"></div>");
            }
            else
            {
                sb.Append("     <div id=\"2\" class=\"icon_fill_on\"></div>");
            }
            if (overstep >= 2)
            {
                sb.Append("	 <div id=\"a_2\" class=\"process_text\"><a href=\"/UserCenter/language.aspx\">语言能力、计算机能力及其他</a></div>");
            }
            else
            {
                sb.Append("	 <div id=\"a_2\" class=\"process_text\">语言能力、计算机能力及其他</div>");
            }
            sb.Append("  </div>");
            sb.Append(" </li>");

            sb.Append(" <li style=\"width:126px;\"> ");
            if (thisstep == 4)
            {
                sb.Append("   <div id=\"step_4\" class=\"current\"> ");
            }
            else
            {
                sb.Append("   <div id=\"step_4\" class=\"current_on\"> ");
            }
            if (ht["STEP4"].ToString() == "1")
            {
                sb.Append("		     <div id=\"3\" class=\"icon_fill\"></div> ");
            }
            else
            {
                sb.Append("		     <div id=\"3\" class=\"icon_fill_on\"></div> ");
            }
            if (overstep < 3)
            {
                sb.Append(" <div id=\"a_3\" class=\"process_text\">主要家庭成员</div> ");
            }
            else
            {
                sb.Append(" <div id=\"a_3\" class=\"process_text\"><a href=\"/UserCenter/family.aspx\">主要家庭成员</a></div> ");

            }
            sb.Append("	  </div> ");
            sb.Append("   </li> ");

            sb.Append("   <li style=\"width:190px;\"> ");
            if (thisstep == 5)
            {
                sb.Append("      <div id=\"step_5\" class=\"current\"> ");
            }
            else
            {
                sb.Append("      <div id=\"step_5\" class=\"current_on\"> ");
            }
            if (ht["STEP5"].ToString() == "1")
            {
                sb.Append("	     <div id=\"4\" class=\"icon_fill\"></div> ");
            }
            else
            {
                sb.Append("	     <div id=\"4\" class=\"icon_fill_on\"></div> ");
            }
            if (overstep < 3)
            {
                sb.Append("		 <div id=\"a_4\" class=\"process_text\">主要社会实践或工作经历</div> ");
            }
            else
            {
                sb.Append("		 <div id=\"a_4\" class=\"process_text\"><a href=\"/UserCenter/practice.aspx\">主要社会实践或工作经历</a></div> ");
            }

            sb.Append("	  </div> ");
            sb.Append("  </li> ");
            sb.Append("   <li style=\"width:104px; margin-left:2px;\"> ");
            if (thisstep == 6)
            {
                sb.Append("     <div id=\"step_6\" class=\"current\"> ");
            }
            else
            {
                sb.Append("     <div id=\"step_6\" class=\"current_on\"> ");
            }
            if (ht["STEP6"].ToString() == "1")
            {
                sb.Append("	     <div id=\"5\" class=\"icon_fill\"></div> ");
            }
            else
            {
                sb.Append("	     <div id=\"5\" class=\"icon_fill_on\"></div> ");
            }
            if (overstep < 3)
            {
                sb.Append("		 <div id=\"a_5\" class=\"process_text\">学术成果</div> ");
            }
            else
            {
                sb.Append("		 <div id=\"a_5\" class=\"process_text\"><a href=\"/UserCenter/academy.aspx\">学术成果</a></div> ");
            }
            sb.Append("	  </div> ");
            sb.Append("	   </li> ");
            sb.Append("	   <li style=\"width:102px; margin:0 1px 0 1px;\"> ");
            if (thisstep == 7)
            {
                sb.Append("	      <div id=\"step_7\" class=\"current\"> ");
            }
            else
            {
                sb.Append("	      <div id=\"step_7\" class=\"current_on\"> ");
            }
            if (ht["STEP7"].ToString() == "1")
            {
                sb.Append("		     <div id=\"6\" class=\"icon_fill\"></div> ");
            }
            else
            {
                sb.Append("		     <div id=\"6\" class=\"icon_fill_on\"></div> ");
            }
            if (overstep < 3)
            {
                sb.Append("			 <div id=\"a_6\" class=\"process_text\">获奖情况</div> ");
            }
            else
            {

                sb.Append("			 <div id=\"a_6\" class=\"process_text\"><a href=\"/UserCenter/award.aspx\">获奖情况</a></div> ");
            }
            sb.Append("		  </div> ");
            sb.Append("   </li> ");
            //sb.Append("   <li style=\"width:126px;\"> ");
            //if (thisstep == 8)
            //{
            //    sb.Append("	      <div id=\"step_8\" class=\"current\"> ");
            //}
            //else
            //{
            //    sb.Append("	      <div id=\"step_8\" class=\"current_on\"> ");
            //}
            //if (ht["STEP8"].ToString() == "1")
            //{
            //    sb.Append("	     <div id=\"7\" class=\"icon_fill\"></div> ");
            //}
            //else
            //{
            //    sb.Append("	     <div id=\"7\" class=\"icon_fill_on\"></div> ");
            //}

            //if (overstep < 3)
            //{

            //    sb.Append("		 <div id=\"a_7\" class=\"process_text\">上传电子附件</div> ");
            //}
            //else
            //{
            //    sb.Append("		 <div id=\"a_7\" class=\"process_text\"><a href=\"/UserCenter/attachment.aspx\">上传电子附件</a></div> ");
            //}
            //sb.Append("	  </div> ");
            //sb.Append("	   </li> ");
            sb.Append("   <li style=\"width:128px;\"> ");
            if (thisstep == 9)
            {
                sb.Append("      <div id=\"step_9\" class=\"current\"> ");
            }
            else
            {
                sb.Append("      <div id=\"step_9\" class=\"current_on\"> ");
            }
            if (ht["STEP9"].ToString() == "1")
            {
                sb.Append("	     <div id=\"8\" class=\"icon_fill\"></div> ");
            }
            else
            {
                sb.Append("	     <div id=\"8\" class=\"icon_fill_on\"></div> ");
            }
            if (overstep < 3)
            {
                sb.Append("		 <div id=\"a_8\" class=\"process_text\">其他情况说明</div> ");
            }
            else
            {

                sb.Append("		 <div id=\"a_8\" class=\"process_text\"><a href=\"/UserCenter/othercase.aspx\">其他情况说明</a></div> ");
            }

            sb.Append("	  </div> ");
            sb.Append("   </li> ");

            sb.Append("</ul>");
            sb.Append(" </div>");

        }


    }
}