using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSupergoo.ABCpdf10;

namespace ABCPdfHtmlToPdfAzure.Controllers
{
  public class HomeController : Controller
  {
    public ActionResult Index()
    {
      return View();
    }

    public ActionResult CreateHtmlPdf(string url)
    {
      if (url == null)
      {
        url = "http://www.google.com";
      }

      Doc report = new Doc();

      report.HtmlOptions.Engine = EngineType.Gecko;

      try
      {
        report.AddImageUrl(url);
      }
      catch (Exception ex)
      {
        throw ex;
      }
      return File(report.GetData(), "application/pdf", "CreateHtmlPdf.pdf");
    }
  }
}