using Busines;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.User
{
    public partial class User_Photo : System.Web.UI.Page
    {
        private string Card_ID;
        private string _key;
        public string ID01Data = string.Empty;
        public string ID02Data = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["Card_ID"]))
            {
                return;
            }
            this.Card_ID = base.Request["Card_ID"];

            _key = DataFactory.SqlDataBase().IsExist("User_Photo", "Card_ID", this.Card_ID) > 0 ? Card_ID : "";

            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this._key))
                {
                    this.InitData();
                }
            }
        }

        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("User_Photo", "Card_ID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                string _d1 = "/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAAeAAD/4QMraHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzYgKFdpbmRvd3MpIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjkzOUM0QkU4NUIyMDExRTdBRjk1OTIwNUI5Q0FDQzhEIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOjkzOUM0QkU5NUIyMDExRTdBRjk1OTIwNUI5Q0FDQzhEIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6OTM5QzRCRTY1QjIwMTFFN0FGOTU5MjA1QjlDQUNDOEQiIHN0UmVmOmRvY3VtZW50SUQ9InhtcC5kaWQ6OTM5QzRCRTc1QjIwMTFFN0FGOTU5MjA1QjlDQUNDOEQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAQCwsLDAsQDAwQFw8NDxcbFBAQFBsfFxcXFxcfHhcaGhoaFx4eIyUnJSMeLy8zMy8vQEBAQEBAQEBAQEBAQEBAAREPDxETERUSEhUUERQRFBoUFhYUGiYaGhwaGiYwIx4eHh4jMCsuJycnLis1NTAwNTVAQD9AQEBAQEBAQEBAQED/wAARCAB4AKADASIAAhEBAxEB/8QAaQABAAMBAQEAAAAAAAAAAAAAAAIDBAEFBwEBAAAAAAAAAAAAAAAAAAAAABAAAgIBAgUBBwUBAAAAAAAAAAERAgMhBDFBURITcWGBsdFSMxSRoSIyI1MRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/APoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAEXaqcNpPoBIAAADjtVcWl6gdBw6AAIq9G3VWTa4qQJAja9K/2slPVwdTTUrVAdAAAAAAAAI2fbV24wmyRXmyPHjdkpYGX83L0r+/zKb3d7Oz4ss89f+VP0KrPus3CU8lwAuW8ypJRXT1+Zq2+V5aOzUNONDGs1UkvHRxzg0bXN3t07VVLXQDSefu/vv0R6B5+7++/d8ANW1a8FZfX4lspnmVxZLKa1bXVIv2uLLXLLq6qNZA1Zb+PHa3Th6mGtnjoslf7NtOz1jQs3t27KnJakKvIsVfFOs90KdZ+QEMmS+Rp3ctEqbjLSqrV6LhoVt2tbXWzLVfcpQu6F7ANeC9r4la3EtKNrbK6vyTx0kvAAAAAABG9qVq3eO3nJIqz4nlp2pw05QGPNkpdxSirVc4SbK2mnDUM24dpWj7r/wArclyKNxju81oq3PDT2AVUt47y6p9a2RvwZMV1/mlV81EHL7emSq7tLJcUQptXjreHNrVaXIDRK6mDdfffu+BH8fN9DH4+b6GBs2rXgrr1+JbK6nnfj5voZ2u3zdy/i1rxA17mlXitZqWlozNs2/K4+lmvOm8V0tXBl2dbeVuNEgK3jqnDyJXXHjE+pGzvVw7T6OTTl2bbdqPjrDM18d6OLVaA37fu8Ne5y+OpaQxOzx1dtLRqTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//Z";
                if (ht.Contains("ID01"))
                {
                    ID01Data = string.Format("data:image/jpg;base64,{0}", string.IsNullOrEmpty(ht["ID01"].ToString()) ? _d1 : ht["ID01"].ToString());
                }
                if (ht.Contains("ID02"))
                {
                    ID02Data = string.Format("data:image/jpg;base64,{0}", string.IsNullOrEmpty(ht["ID02"].ToString()) ? _d1 : ht["ID02"].ToString());
                }
                ControlBindHelper.SetWebControls(this.Page, ht);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (string.IsNullOrEmpty(this.ID01.Value.Trim()) || string.IsNullOrEmpty(this.Card_ID) || string.IsNullOrEmpty(this.ID02.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }
            if (!string.IsNullOrEmpty(this._key))
            {
                ht["ModifyDate"] = DateTime.Now.ToString();
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
            }
            else
            {
                ht["Card_Id"] = this.Card_ID;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("User_Photo", "Card_ID", this._key, ht);
            if (IsOk)
            {
                string Url = PageHelper.UrlEncrypt(this.Card_ID);
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout(self.location='User_Photo2.aspx?Card_ID=" + Card_ID + "','1000');</script>");

            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }

           // ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>self.location='User_Photo2.aspx?Card_ID=';</script>");
        }

    }
}