using Busines;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.User
{
    public partial class User_Finger : System.Web.UI.Page
    {
        private string Card_ID;
        private string _key = string.Empty;
         public StringBuilder FingerList = new StringBuilder();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["Card_ID"]))
            {
                return;
            }
            this.Card_ID = base.Request["Card_ID"];
            _key = DataFactory.SqlDataBase().IsExist("User_Finger", "Card_ID", this.Card_ID) > 0 ? Card_ID : "";

            if (!base.IsPostBack)
            {
                this.InitData();
            }
        }

        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("User_Finger", "Card_ID", this.Card_ID);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
                if (!string.IsNullOrEmpty(ht["R1"].ToString()))
                {
                    FingerList.Append("R1");
                }
                if (!string.IsNullOrEmpty(ht["R2"].ToString()))
                {
                    FingerList.Append("R2");
                }
                if (!string.IsNullOrEmpty(ht["R3"].ToString()))
                {
                    FingerList.Append("R3");
                }
                if (!string.IsNullOrEmpty(ht["R4"].ToString()))
                {
                    FingerList.Append("R4");
                }
                if (!string.IsNullOrEmpty(ht["R5"].ToString()))
                {
                    FingerList.Append("R5");
                }
                if (!string.IsNullOrEmpty(ht["L1"].ToString()))
                {
                    FingerList.Append("L1");
                }
                if (!string.IsNullOrEmpty(ht["L2"].ToString()))
                {
                    FingerList.Append("L2");
                }
                if (!string.IsNullOrEmpty(ht["L3"].ToString()))
                {
                    FingerList.Append("L3");
                }
                if (!string.IsNullOrEmpty(ht["L4"].ToString()))
                {
                    FingerList.Append("L4");
                }
                if (!string.IsNullOrEmpty(ht["L5"].ToString()))
                {
                    FingerList.Append("L5");
                }
                
                // FingerData = ht["U_FINGERDATA"].ToString();
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht = ControlBindHelper.GetWebControls(this.Page);

            if (string.IsNullOrEmpty(this.U_FingerData.Value.Trim()) || string.IsNullOrEmpty(this.Card_ID) || string.IsNullOrEmpty(this.U_FingerOCX.Value.Trim()))
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
                ht["CreateUser"] = RequestSession.GetSessionUser().UserName.ToString();
            }
            string FingerOcx = this.U_FingerOCX.Value.Trim();
            string[] FingerOcxs = FingerOcx.Split('#');

            int count = int.Parse(FingerOcxs[0]);
            for (int i = 1; i < count + 1; i++)
            {
                //string FingerData = FingerOcxs[i].Substring(2, FingerOcxs[i].Length - 2);
               // string[] Finger = FingerData.Split(';');
               // ht[Finger[0]] = Finger[1];

                string[] Fingers = FingerOcxs[i].Split(';');
                switch (Fingers[0])
                {
                    case "1":
                    case "3":
                        ht[Fingers[1]] = Fingers[2];
                        break;
                    case "2":
                        ht[Fingers[1]] = "";
                        break;
                }
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("User_Finger", "Card_ID", this._key, ht);
            if (IsOk)
            {
                string Url = PageHelper.UrlEncrypt(this.Card_ID);
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','2000');</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
        //拆分后的指纹信息数据格式为：手指数#操作类型;指位一;指纹数据一#操作类型; 指位二;指纹数据二#  
        //指位信息参考指位编码表，操作类型：1 表示增加指纹，2 表示删除指纹，3 表示 修改指纹； 
       
        //3
        //#1;R1;46413241343130310F982A188215008700A0110B0860C00C06E4642006096F8C4009080DBC200D0823E800170489F9C0100D7004410B1197096114031418E10D0C5F62210910226E610F0B2EF6A10B5245FA210B654BFE810A46C81502000B492C42030C35F00210083DFDE20D074421630C0AB42C03040E013DFD610B0F11C474A18ACC0BC0C36DA3ABCCDEDCC0C369A3CCCDDFEC21C0C265A3ACEDDDFE1921C0C15562A4CCFDEFDFBF27C0C1576064687077060EA1EEBE28C0C1565E61656D760710A1FDDB28C0C1555C5F626A760915A1EDBB29C07E4DA1EDBA65750D1BA1EABA2BC07E4CA1CD8A5E721722A1D89A2DC07E4BA1BA8853442BA28A7799C07E49A59976610375782DC07E4581A477654465482DC07E42A57889766354592FC07E3EA5799B9744434C32C07E39A577EDC642326EC0C1332F3844A2E5222129C0C224274CA2A22020E00100B33739B6363DB9BCB635BC362CBDA525A06A6B6C194433372E2839261F2F1E15180101032D2123212430
        //#1;R2;46413241343130310F9E2268821D0093016012051D78401503949D801403EECD4004081DEC60120461F460000C850CE10B0B9735411502793CA105060D3C2108071B51410C0B8D80610C0898B1410F061FD8A10B0925EC01100385280209109D34C2100219542208117468A2051224B462150552C482000957DB42020C9AF4220E02CF0F03000A802203081B2A5EC3065D33624306633C72030640418FA3020F01376163060F11C374A2BDCACB17C0C271A3ACDCBDBD1CC0C1616FA4CCDDDDCBAEC0C1676FA4BDDEDECA9D23C0C16AA5EBEDEEEAA8C8C0C16DA5DCCDDFDBAAB8C07E636CA5ECDDDFDBB99AC07E63A5FFDEDDFDDA8A24C07E6268707505A3FEDDC98923C07E60666F75050EA3FDDA9799C07E5D636D75050F18A2DB987A24C07E5B5F687205121BA2DA887B27C07E565B626F05141DA2D9888CC07E51555D69031620A2A9988CC07E4C4F5560011922A2A8987DC07E48494C4F3B24A2A888872BC07E45A178502FA248877732C0C141A47532378888E00100A934AE3A34BFB2B0B2322DAEA92C31B1AF2BB448B8B8BF30C642BD91A2766E68525C514D5B4444464040353C2837221F3F1E17211B0A0100020F
        //#1;L2;46413241343130310F971B8882170072008007051429E0100B1461400D0B6BA0C0030A86C8800E0A0628810906E33081020870544106060980E109061F9821140494ACC1150C87B9C10D0C72CC41081012DE210B0B5F1F420610202A820C0A29580216064BBAC2074D44BA62086A2FBE02094D47E802000C35A8A30D093BC1830B06013DBDA2080F11C374A29CAAA8C0C274A389ABCABB0FC0C271A39ABCCCCC16C0C15D6FA3ABADDEDB1821C0C15E6AA3CCCDDEDB1821C0C15E69A4CDDDCEDCBF28C0C15E68A4CEDDDEDCBF27C07E585D666A7101A3DEDEBBEDC07E575C63666E76070FA2EDBADCC07E56595F636B760813A2EBC9DAC07E53A1BEAF740B19A2E9B9CAC07E505356575F701220A2C989CAC07E4CA1AA9B4928A29A777C2DC07E47A19A764036A236666C2FC07E43A589765346556B31C07E40A589886634347EC0C13FA4999763433532C0C240A39A86242128E00100B83631B7B33838B43840BEBAB937BC3746AABE49A3686C57584D464232372D273A3E261E1D161836030101222322#


    }
}