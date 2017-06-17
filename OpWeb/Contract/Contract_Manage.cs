using Aspose.Words;
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
using System.Web;

namespace OpWeb.Contract
{
    public class Contract_Manage
    {
        private static string _Path = System.AppDomain.CurrentDomain.BaseDirectory + "FileTemplate\\";

        public static void CreateMortgageFile(string UID, string documentType)
        {
        //    Document_Template
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
                //sb.Clear();

                //DataTable dtc = DataFactory.SqlDataBase().GetDataTableBySQL(sb);

                //DataTable dtp = DataFactory.SqlDataBase().GetDataTableBySQL(sb);

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

                #region
                
                #endregion
                if (!Directory.Exists(_Upath))
                    Directory.CreateDirectory(_Upath);

                doc.Save(_Upath + _UserFileName);
               // OpenDoc(_documentName);
            }

        }

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




    }
}