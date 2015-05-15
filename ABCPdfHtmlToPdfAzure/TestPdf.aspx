<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPdf.aspx.cs" Inherits="ABCPdfHtmlToPdfAzure.TestPdf" %>

<%@ Import Namespace="WebSupergoo.ABCpdf10" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">
public void Page_Load(Object sender, EventArgs E) {
  if (String.Equals("123", Request.ServerVariables["QUERY_STRING"])) 
  {
    XSettings.InstallLicense(ConfigurationManager.AppSettings["AbcPdfLicenseKey"]);
    string thePath = Path.GetTempFileName();
    using(Doc theDoc = new Doc()) {
      theDoc.HtmlOptions.Engine = EngineType.Gecko;
      theDoc.AddImageUrl("http://www.example.com/");
      theDoc.Save(thePath);
    }
    FileInfo fi = new FileInfo(thePath);
    Response.ClearHeaders();
    Response.Clear();
    Response.ContentType = "application/pdf";
    Response.AddHeader("content-disposition", "attachment; filename=example.PDF");
    Response.AddHeader("content-length", fi.Length.ToString());
    Response.WriteFile(thePath);
    Response.End();

  }
  if (String.Equals("456", Request.ServerVariables["QUERY_STRING"]))
  {
    XSettings.InstallLicense(ConfigurationManager.AppSettings["AbcPdfLicenseKey"]);
    string thePath = Path.GetTempFileName();
    using (Doc theDoc = new Doc())
    {
      theDoc.HtmlOptions.Engine = EngineType.Gecko;
      theDoc.AddImageUrl("http://www.yahoo.com/");
      theDoc.Save(thePath);
    }
    FileInfo fi = new FileInfo(thePath);
    Response.ClearHeaders();
    Response.Clear();
    Response.ContentType = "application/pdf";
    Response.AddHeader("content-disposition", "attachment; filename=example.PDF");
    Response.AddHeader("content-length", fi.Length.ToString());
    Response.WriteFile(thePath);
    Response.End();

  }
  if (String.Equals("789", Request.ServerVariables["QUERY_STRING"]))
  {
    XSettings.InstallLicense(ConfigurationManager.AppSettings["AbcPdfLicenseKey"]);
    string thePath = Path.GetTempFileName();
    using (Doc theDoc = new Doc())
    {
      theDoc.HtmlOptions.Engine = EngineType.Gecko;
      theDoc.AddImageUrl("http://www.msn.com/");
      theDoc.Save(thePath);
    }
    FileInfo fi = new FileInfo(thePath);
    Response.ClearHeaders();
    Response.Clear();
    Response.ContentType = "application/pdf";
    Response.AddHeader("content-disposition", "attachment; filename=example.PDF");
    Response.AddHeader("content-length", fi.Length.ToString());
    Response.WriteFile(thePath);
    Response.End();

  }
  
}
</script>
<html>
<head><title></title></head>
<body>
<p><a href="?123">Get web page (www.example.com) as PDF...</a></p>
<p><a href="?456">Get web page (www.yahoo.com) as PDF...</a></p>
<p><a href="?789">Get web page (www.msn.com) as PDF...</a></p>
</body>
</html>