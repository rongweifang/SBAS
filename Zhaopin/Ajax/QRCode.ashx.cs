using Busines.DAL;
using Busines.IDAO;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;

namespace Zhaopin.Ajax
{
    /// <summary>
    /// QRCode 的摘要说明
    /// </summary>
    public class QRCode : IHttpHandler
    {
        private SR_Tickets_IDal systemidao = new SR_Tickets_Dal();
        public void ProcessRequest(HttpContext context)
        {
            string QRCodeID = context.Request["QRCodeID"];
            Bitmap bmp = this.systemidao.ToQRCode(QRCodeID);
            MemoryStream ms = new MemoryStream();
            try
            {
                bmp.Save(ms, ImageFormat.Png);
                context.Response.ClearContent();
                context.Response.ContentType = "image/Png";
                context.Response.BinaryWrite(ms.ToArray());
                context.Response.End();
            }
            finally
            {
                bmp.Dispose();
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}