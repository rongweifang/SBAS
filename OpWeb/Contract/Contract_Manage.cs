﻿using Aspose.Words;
using Aspose.Words.Drawing;
using Busines;
using Common.DotNetData;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace OpWeb.Contract
{
    public class Contract_Manage
    {
        private static string _Path = System.AppDomain.CurrentDomain.BaseDirectory + "FileTemplate\\";

        private static Regex MortageRegexAll = new Regex(@"{Mortage+\w{0,6}:+[\w]+}");//所有标签
        private static Regex MortageRegex = new Regex(@"{Mortage:+[\w]+}");//文字信息
        private static Regex MortageFRegex = new Regex(@"{MortageF:+[\w]+}");//指纹签名
        private static Regex MortageMRegex = new Regex(@"{MortageM:+[\w]+}");//婚姻状况声明
        private static Regex MortageUNMRegex = new Regex(@"{MortageUNM:+[\w]+}");//单身声明
        private static Regex MortageMFRegex = new Regex(@"{MortageMF:+[\w]+}");//婚姻状况声明指纹
        private static Regex MortageUNMFRegex = new Regex(@"{MortageUNMF:+[\w]+}");//单身声明指纹
        private static Regex MortageSRegex = new Regex(@"{MortageS:+[\w]+}");//值输出
        private static Regex MortageReportRegex = new Regex(@"{MortageR:+[\w]+}");//复选框输出
        private static Regex MortageLeaderRegex = new Regex(@"{MortageL:+[\w]+}");//领导签名

        private static string Card_ID = string.Empty;
        private static string Marry = string.Empty;

        private static Hashtable hu = new Hashtable();//用户基本信息

        //生成文件
        public static void CreateMortgageFile(string UID, string documentType)
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Document_Template", "documentType", documentType);

            string _documentName = "";
            if (ht.Contains("DOCUMENTNAME"))
            {
                _documentName = ht["DOCUMENTNAME"].ToString();
            }

            Hashtable hm = DataFactory.SqlDataBase().GetHashtableById("Contract_Mortgage", "UID", UID);

            string _FilePath = _Path + _documentName + ".docx";

            if (File.Exists(_FilePath))
            {
                string _Upath = System.AppDomain.CurrentDomain.BaseDirectory + "UserInfo\\" + hm["CARD_ID"].ToString() + "\\";
                string _UserFileName = string.Format("{0}_{1}.docx", _documentName, hm["CARD_NAME"].ToString());

                Aspose.Words.License li = new Aspose.Words.License();
                li.SetLicense("License.lic");

                Document doc = new Document(_FilePath);
                DocumentBuilder builder = new DocumentBuilder(doc);

                StringBuilder sb = new StringBuilder();
                sb.AppendFormat("SELECT * FROM Contract_Mortgage WHERE UID='{0}'", UID);
                DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);

                if (DataTableHelper.IsExistRows(dt))
                {
                    DataRow dr = dt.Rows[0];
                    //DataRow drc = dtc.Rows[0];
                    //DataRow drp = dtp.Rows[0];
                    //mark命名规则：TCard_Name003--T/P：文字/图片；Card_Name：字段名；003：序号
                    int markCount = doc.Range.Bookmarks.Count;
                    for (int i = 0; i < markCount; i++)
                    {
                        Bookmark bookmark = doc.Range.Bookmarks[i];
                        string markName = bookmark.Name;
                        string mType = markName.Substring(0, 1);
                        string FieldName = markName.Substring(1, markName.Length - 4);
                        switch (mType)
                        {
                            case "T":
                                if (dr.Table.Columns.Contains(FieldName))
                                {
                                    bookmark.Text = dr[FieldName].ToString();
                                    break;
                                }
                                //if (drc.Table.Columns.Contains(FieldName))
                                //{
                                //    bookmark.Text = drc[FieldName].ToString();
                                //    break;
                                //}
                                //if (drp.Table.Columns.Contains(FieldName))
                                //{
                                //    bookmark.Text = drp[FieldName].ToString();
                                //    break;
                                //}
                                break;
                            default:

                                break;
                        }
                    }
                    try
                    {
                        int m = doc.MailMerge.GetFieldNames().Length;
                        string[] MMNames = doc.MailMerge.GetFieldNames();
                        for (int i = 0; i < m; i++)
                        {
                            string MName = string.Empty;

                            if (MMNames[i].Split(':').Length > 0)
                            {
                                MName = MMNames[i].Split(':')[1];
                            }

                            string MType = MName.Substring(0, 1);
                            string MFieldName = MName.Substring(1, MName.Length - 4);
                            if (MType.Equals("P"))
                            {
                                if (File.Exists(_Upath + MFieldName + ".png"))
                                {
                                    builder.MoveToMergeField(MName);
                                    Shape shape = builder.InsertImage(_Upath + MFieldName + ".png");
                                    // shape.WrapType = WrapType.Through;//可以使图片浮于文字上方，但是位置信息丢失，不能在书签位置出现。
                                    int _width = 0;
                                    int _height = 0;
                                    GetSize(MFieldName, out _width, out _height);
                                    shape.Width = _width;
                                    shape.Height = _height;
                                    doc.MailMerge.Execute(new string[] { MName }, new object[] { shape });
                                }
                            }
                            else
                            {

                            }
                        }
                    }
                    catch (Exception ex)
                    {


                    }

                }
                doc.MailMerge.DeleteFields();

                if (!Directory.Exists(_Upath))
                    Directory.CreateDirectory(_Upath);

                doc.Save(_Upath + _UserFileName);
            }

        }
        //获取图片大小
        private static void GetSize(string MName, out int _width, out int _height)
        {
            int w = 0;
            int h = 0;
            if (!string.IsNullOrEmpty(MName))
            {
                string _Head = MName.Substring(0, 1).ToUpper();
                switch (_Head)
                {
                    case "F":
                        w = 55;
                        h = 60;
                        break;
                    case "S":
                        w = 75;
                        h = 34;
                        break;
                    case "I":
                        w = 320;
                        h = 210;
                        break;
                    case "H":
                        w = 80;
                        h = 100;
                        break;
                }
            }

            _width = w;
            _height = h;
        }

        public static string GetHtmlContent(string UID, string documentType)
        {
            return GetHtmlContent(UID, documentType, "A4");
        }

        public static string GetHtmlContent(string UID, string documentType, string PrintType)
        {
            return GetHtmlContent(UID, documentType, PrintType, true);
        }

        public static string GetHtmlContent(string UID, string documentType, string PrintType, bool ClearMark)
        {

            StringBuilder sb = new StringBuilder();
            int PageNum = 0;

            string sTable = string.Format("SELECT CTContent,CTPage FROM Contract_Template WHERE ContractType='{0}' ", documentType);
            string sqlwhere = string.Empty;
            if (PrintType.ToUpper().Equals("A3"))
            {
                //StringBuilder sbsql = new StringBuilder();
                //sbsql.AppendFormat("SELECT COUNT(1) FROM Contract_Template WHERE ContractType='{0}'", documentType);
                //PageNum = int.Parse(DataFactory.SqlDataBase().GetDataTableBySQL(sbsql).Rows[0][0].ToString());
                PageNum = GetPageNum(documentType);
                if (PageNum > 0)
                {
                    StringBuilder pglist = new StringBuilder();
                    for (int i = 0; i < PageNum / 4; i++)
                    {
                        pglist.AppendFormat("{0},{1},{2},{3},", PageNum - 2 * i, 1 + 2 * i, 1 + 2 * i + 1, PageNum - 2 * i - 1);
                    }

                    sqlwhere = string.Format(" AND CTPage IN ({0}) ORDER BY CHARINDEX(',' + CONVERT(VARCHAR, CTPage) + ',' , '{1}') ", pglist.ToString().TrimEnd(','), pglist.ToString().Trim());
                }
            }
            else
            {
                sqlwhere = " ORDER BY CTPage ASC";
            }

            StringBuilder sbsqlstr = new StringBuilder();
            sbsqlstr.Append(sTable + sqlwhere);
            // DataTable dt = DataFactory.SqlDataBase().GetDataTable(sTable, "CTPage", "ASC");
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sbsqlstr);

            if (DataTableHelper.IsExistRows(dt))
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    sb.Append("<div class=\"PageBody\">");
                    sb.Append(GetPage(dt.Rows[i]["CTContent"].ToString(), dt.Rows[i]["CTPage"].ToString()));
                    sb.AppendFormat("<div class=\"PageNum\">{0}/{1}</div>", dt.Rows[i]["CTPage"].ToString(), dt.Rows.Count);
                    sb.Append("</div>");
                    if (i != dt.Rows.Count - 1)
                    {
                        sb.Append("<div class=\"PageNext\"></div>");
                    }
                }
            }
            //替换基本信息
            string ResultCotent = GetHtmlExchange(UID, sb.ToString(), documentType);
            //替换指纹签名
            ResultCotent = GetFingerExchange(UID, ResultCotent);
            //替换审查报告
            ResultCotent = GetLeaderExchange(UID, ResultCotent);
            //替换领导签名
            ResultCotent = GetReportExchange(UID, ResultCotent);
            if (ClearMark)
            {
                ResultCotent = ClearHtmlExchange(ResultCotent);//清除标记
            }
            return ResultCotent;
        }

        public static int GetPageNum(string documentType)
        {
            StringBuilder sbsql = new StringBuilder();
            sbsql.AppendFormat("SELECT COUNT(1) FROM Contract_Template WHERE ContractType='{0}'", documentType);
            return int.Parse(DataFactory.SqlDataBase().GetDataTableBySQL(sbsql).Rows[0][0].ToString());
        }

        //替换领导签名
        //{MortageL:}
        public static string GetLeaderExchange(string UID, string HtmlContent)
        {
            StringBuilder strsql = new StringBuilder();

            // strsql.AppendFormat("SELECT ContractId AS UID,BU.User_Code,SignBase,Step FROM WF_Process WP,WF_WorkFlow WWF,Base_UserInfo BU WHERE WP.WorFlowId=WWF.Id AND WP.ApproverID=BU.User_ID AND ContractId='{0}' order by wp.CreateTime desc", UID);
            strsql.AppendFormat("SELECT UID,User_Code,SignBase,Step,OperateTime FROM View_Process WHERE UID='{0}' order by OperateTime desc", UID);

            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strsql);
            if (DataTableHelper.IsExistRows(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    MatchCollection FMatchColl = MortageLeaderRegex.Matches(HtmlContent);
                    if (FMatchColl.Count > 0)
                    {
                        foreach (Match matchItem in FMatchColl)
                        {
                            string ContentDeal = matchItem.Value.Trim();
                            string FieldDeal = ContentDeal.Replace("{MortageL:", "").Replace("}", "");

                            if (dr["User_Code"].ToString().Equals(FieldDeal))
                            {
                                string result = string.Format("<span style=\"display: inline\"><img src=\"data:image/png;base64,{0}\"  width=\"{1}\" height=\"{2}\" /></span>", dr["SignBase"].ToString(), 120, 40);

                                HtmlContent = HtmlContent.Replace(ContentDeal, result);
                            }
                        }
                    }
                }
            }
            return HtmlContent;
        }


        //替换审批报告
        public static string GetReportExchange(string UID, string HtmlContent)
        {
            StringBuilder strsql = new StringBuilder();

            strsql.AppendFormat("SELECT SL_Code,SL_Desc,SL_SubTitle,SL_Sub_Order,SL_Checked,SL_IsBreak,SL_Width,SL_MarginLeft,Checked FROM View_ContractSelect WHERE UID='{0}' ", UID);
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strsql);
            if (DataTableHelper.IsExistRows(dt))
            {
                DataView dv = new DataView(dt);


                MatchCollection FMatchColl = MortageReportRegex.Matches(HtmlContent);
                if (FMatchColl.Count > 0)
                {
                    foreach (Match matchItem in FMatchColl)
                    {
                        string ContentDeal = matchItem.Value.Trim();
                        string Code = ContentDeal.Replace("{MortageR:", "").Replace("}", "");

                        dv.RowFilter = "SL_Code like '%" + Code + "%'";
                        dv.Sort = "SL_Sub_Order ASC";
                        StringBuilder sb = new StringBuilder();
                        foreach (DataRow dr in dv.ToTable().Rows)
                        {
                            sb.AppendFormat("<span style=\"padding-left:{0};display:{1};width:{2}\">{3} {4}</span>", dr["SL_MarginLeft"].ToString(), dr["SL_IsBreak"].ToString().Equals("True") ? "block" : "inline", dr["SL_Width"].ToString(), dr["Checked"].ToString().Equals("True") ? "■" : dr["Checked"].ToString().Equals("False") ? "□" : dr["SL_Checked"].ToString().Equals("True") ? "■" : "□", dr["SL_SubTitle"].ToString());
                        }

                        HtmlContent = HtmlContent.Replace(ContentDeal, sb.ToString());
                        //SL_CODE:CM_P7_001---{MortageR:CM_P7_001}



                        // HtmlContent = HtmlContent.Replace(ContentDeal, ImageData);
                    }
                }
            }

            //  sb.AppendFormat("<div style=\"padding-left:{5};display:{6};width:{7}\"><label><input type =\"checkbox\" name=\"{0}\" value=\"{1}\" id=\"{2}\" {3} runat=\"server\" />{4}</label></div>", dr["SL_PageID"].ToString(), 1, dr["SL_PageID"].ToString(), dr["Checked"].ToString().Equals("True") ? "checked=\"checked\"" : dr["Checked"].ToString().Equals("False") ? "" : dr["SL_Checked"].ToString().Equals("True") ? "checked=\"checked\"" : "", dr["SL_SubTitle"].ToString(), dr["SL_MarginLeft"].ToString(), dr["SL_IsBreak"].ToString().Equals("True")?"block":"inline", dr["SL_Width"].ToString());



            return HtmlContent;
        }

        public static string GetHtmlExchange(string UID, string HtmlContent, string documentType)
        {
            //{Mortage:Card_Id}{Mortage:+[\w]+}//{Mortage:+[a-zA-Z0-9_-]+}
            string htmls = HtmlContent;
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("V_" + documentType, "cast(UID as varchar(36))", UID);
            if (ht.Count > 0 && ht != null)
            {
                Card_ID = ht.Contains("CARD_ID") ? ht["CARD_ID"].ToString() : "";
                Marry = ht.Contains("U_MARRY") ? ht["U_MARRY"].ToString() : "";
                MatchCollection userMatchColl = MortageRegex.Matches(htmls);
                if (userMatchColl.Count > 0)
                {
                    foreach (Match matchItem in userMatchColl)
                    {
                        string ContentDeal = matchItem.Value.Trim();
                        string FieldDeal = ContentDeal.Replace("{Mortage:", "").Replace("}", "");
                        if (ht.Contains(FieldDeal.ToUpper()))
                        {
                            string _deal = string.IsNullOrEmpty(ht[FieldDeal.ToUpper()].ToString()) ? "&nbsp;" : ht[FieldDeal.ToUpper()].ToString();
                            htmls = htmls.Replace(ContentDeal, "<span style=\"font-family: 'xinwei','华文新魏'\">" + _deal + "</span>");
                        }
                    }
                }
                if (Marry.Equals("已婚") && documentType.Equals("Contract_Mortgage"))
                {
                    htmls = GetMarryExchange(ht, htmls);
                    htmls = GetMarryFingerExchange(UID, htmls);
                }
                else
                {
                    htmls = GetUnmarriedExchange(ht, htmls);
                    htmls = GetUnmarriedFingerExchange(UID, htmls);
                }

                //值输出，替换身份证，及其它拍照图片
                htmls = GetSingleExchange(ht, htmls);
            }
            return htmls;
        }

        public static string ClearHtmlExchange(string HtmlContent)
        {
            MatchCollection userMatchColl = MortageRegexAll.Matches(HtmlContent);
            if (userMatchColl.Count > 0)
            {
                foreach (Match matchItem in userMatchColl)
                {
                    string ContentDeal = matchItem.Value.Trim();
                    string FieldDeal = ContentDeal.Replace("{Mortage", "").Replace("}", "");

                    HtmlContent = HtmlContent.Replace(ContentDeal, "");
                }
            }
            return HtmlContent;
        }

        private static string GetPage(string CTContent, string CTPage)
        {

            //Microsoft.JScript.GlobalObject.escape("");
            //Microsoft.JScript.GlobalObject.unescape("");
            StringBuilder sb = new StringBuilder();
            sb.Append(Microsoft.JScript.GlobalObject.unescape(CTContent));


            return sb.ToString();
        }

        public static string GetFingerExchange(string UID, string HtmlContent)
        {
            // string result = string.Empty;
            //  MortageFRegex--{MortageF:F_M_S_3}-{MortageF:F2_M_S_3}F2--Size

            MatchCollection FMatchColl = MortageFRegex.Matches(HtmlContent);
            if (FMatchColl.Count > 0)
            {
                foreach (Match matchItem in FMatchColl)
                {
                    string ContentDeal = matchItem.Value.Trim();
                    string PictureCode = ContentDeal.Replace("{MortageF:", "").Replace("}", "");
                    string PictureType = PictureCode.Substring(0, 1);
                    string PictureSize = PictureType;

                    string ImageData = GetFinger(UID, PictureType, PictureCode, PictureSize);

                    HtmlContent = HtmlContent.Replace(ContentDeal, ImageData);
                }
            }
            return HtmlContent;
        }

        public static string GetFinger(string UID, string PictureType, string PictureCode, string PictureSize)
        {
            string result = string.Empty;
            string Sign = PictureType.Equals("F") ? "FingerImage" : PictureType.Equals("S") ? "SignBase" : "";
            string PictureTypes = PictureType.Equals("F") ? "FingerCode" : PictureType.Equals("S") ? "SignCode" : "";
            string SignData = "";

            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT {0} FROM Contract_Finger WHERE [UID]='{1}' AND {2}='{3}'", Sign, UID, PictureTypes, PictureCode);
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            if (DataTableHelper.IsExistRows(dt))
            {
                SignData = dt.Rows[0][0].ToString();
            }
            if (!string.IsNullOrEmpty(SignData))
            {
                Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_PictureSize", "PSize", PictureSize);
                string PWidth = "100";
                string PHeight = "100";
                if (ht.Count > 0 && ht != null)
                {
                    if (ht.Contains("PWIDTH"))
                    {
                        PWidth = ht["PWIDTH"].ToString();
                    }
                    if (ht.Contains("PHEIGHT"))
                    {
                        PHeight = ht["PHEIGHT"].ToString();
                    }
                }
                try
                {
                    // <img src="data:image/png;base64,。。。。。"  width="100" height="40" />
                    result = string.Format("<span style=\"display: inline\"><img src=\"data:image/png;base64,{0}\"  width=\"{1}\" height=\"{2}\" /></span>", SignData, PWidth, PHeight);
                }
                catch (Exception ex)
                {

                }
            }
            return result;
        }

        public static string GetMarryExchange(Hashtable hm, string htmls)
        {
            MatchCollection MarryMatchColl = MortageMRegex.Matches(htmls);
            if (MarryMatchColl.Count > 0)
            {
                foreach (Match matchItem in MarryMatchColl)
                {
                    string ContentDeal = matchItem.Value.Trim();
                    string FieldDeal = ContentDeal.Replace("{MortageM:", "").Replace("}", "");
                    if (hm.Contains(FieldDeal.ToUpper()))
                    {
                        htmls = htmls.Replace(ContentDeal, "<span style=\"font-family: 'xinwei','华文新魏'\">" + hm[FieldDeal.ToUpper()].ToString() + "</span>");
                    }
                }
            }

            return htmls;
        }
        //单身
        public static string GetUnmarriedExchange(Hashtable hm, string htmls)
        {
            MatchCollection MarryMatchColl = MortageUNMRegex.Matches(htmls);
            if (MarryMatchColl.Count > 0)
            {
                foreach (Match matchItem in MarryMatchColl)
                {
                    string ContentDeal = matchItem.Value.Trim();
                    string FieldDeal = ContentDeal.Replace("{MortageUNM:", "").Replace("}", "");
                    if (hm.Contains(FieldDeal.ToUpper()))
                    {
                        htmls = htmls.Replace(ContentDeal, "<span style=\"font-family: 'xinwei','华文新魏'\">" + hm[FieldDeal.ToUpper()].ToString() + "</span>");
                    }
                }
            }

            return htmls;
        }

        public static string GetMarryFingerExchange(string UID, string HtmlContent)
        {
            //  MortageMFRegex--{MortageMF:F_M_S_3}-{MortageMF:F2_M_S_3}F2--Size

            MatchCollection MFMatchColl = MortageMFRegex.Matches(HtmlContent);
            if (MFMatchColl.Count > 0)
            {
                foreach (Match matchItem in MFMatchColl)
                {
                    string ContentDeal = matchItem.Value.Trim();
                    string PictureCode = ContentDeal.Replace("{MortageMF:", "").Replace("}", "");
                    string PictureType = PictureCode.Substring(0, 1);
                    string PictureSize = PictureType;

                    string ImageData = GetFinger(UID, PictureType, PictureCode, PictureSize);

                    HtmlContent = HtmlContent.Replace(ContentDeal, ImageData);
                }
            }
            return HtmlContent;
        }
        //单身
        public static string GetUnmarriedFingerExchange(string UID, string HtmlContent)
        {
            //  MortageMFRegex--{MortageMF:F_M_S_3}-{MortageMF:F2_M_S_3}F2--Size

            MatchCollection MFMatchColl = MortageUNMFRegex.Matches(HtmlContent);
            if (MFMatchColl.Count > 0)
            {
                foreach (Match matchItem in MFMatchColl)
                {
                    string ContentDeal = matchItem.Value.Trim();
                    string PictureCode = ContentDeal.Replace("{MortageUNMF:", "").Replace("}", "");
                    string PictureType = PictureCode.Substring(0, 1);
                    string PictureSize = PictureType;

                    string ImageData = GetFinger(UID, PictureType, PictureCode, PictureSize);

                    HtmlContent = HtmlContent.Replace(ContentDeal, ImageData);
                }
            }
            return HtmlContent;
        }

        //值输出
        public static string GetSingleExchange(Hashtable hm, string htmls)
        {
            MatchCollection MarryMatchColl = MortageSRegex.Matches(htmls);
            if (MarryMatchColl.Count > 0)
            {
                foreach (Match matchItem in MarryMatchColl)
                {
                    string ContentDeal = matchItem.Value.Trim();
                    string FieldDeal = ContentDeal.Replace("{MortageS:", "").Replace("}", "");
                    if (hm.Contains(FieldDeal.ToUpper()))
                    {
                        htmls = htmls.Replace(ContentDeal, hm[FieldDeal.ToUpper()].ToString());
                    }
                }
            }

            return htmls;
        }

    }
}