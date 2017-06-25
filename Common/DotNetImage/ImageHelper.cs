using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
namespace Common.DotNetImage
{
    public class ImageHelper
    {
        public static byte[] GetImgByte(HttpPostedFileBase imgFileBase)
        {
            if (imgFileBase != null && !string.IsNullOrEmpty(imgFileBase.FileName))
            {
                var len = imgFileBase.ContentLength;
                byte[] bytes = null;
                using (var obj = new BinaryReader(imgFileBase.InputStream))
                {
                    bytes = obj.ReadBytes(len);
                }

                if (bytes.Length > 2)
                {
                    string fileclass = string.Empty;
                    try
                    {
                        fileclass = bytes[0].ToString(CultureInfo.InvariantCulture);
                        fileclass += bytes[1].ToString(CultureInfo.InvariantCulture);
                    }
                    catch
                    {
                    }

                    String[] fileType = { "7173", //gif 
                                          "255216", //jpg 
                                          "6677", //bmp 
                                          "7790"//png
                                        };

                    var flag = fileType.Any(t => fileclass == t);
                    if (flag)
                    {
                        return bytes;
                    }
                }
            }

            return null;
        }

        public static string Base64ImgToSrc(byte[] imgBytes)
        {
            if (imgBytes == null)
            {
                return string.Empty;
            }

            using (var stream = new MemoryStream(imgBytes))
            {
                using (var image = System.Drawing.Image.FromStream(stream))
                {
                    return string.Format(
                        "data:image/{0};base64,{1}",
                        GetImageExtension(image),
                        Convert.ToBase64String(imgBytes));
                }
            }
        }

        private static string GetImageExtension(System.Drawing.Image image)
        {
            var imgFormatList = typeof(ImageFormat).GetProperties(BindingFlags.Static | BindingFlags.Public);

            foreach (var item in imgFormatList)
            {
                var imgFormat = (ImageFormat)item.GetValue(null, null);
                if (imgFormat.Guid.Equals(image.RawFormat.Guid))
                {
                    return item.Name.ToLower();
                }
            }

            return "gif";
        }
    }
}