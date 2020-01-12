using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SqlDataTypesApp.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            this.AddDataTable();
            return View();
        }

        public void AddDataTable()
        {
            DataTable dtInsert = new DataTable();
            dtInsert.Columns.Add("ShiftTypeId", typeof(int));
            dtInsert.Columns.Add("EmpSapId", typeof(int));
            dtInsert.Columns.Add("ShiftDate", typeof(DateTime));
            dtInsert.Columns.Add("StartTime", typeof(string));
            dtInsert.Columns.Add("EndTime", typeof(string));
            dtInsert.Columns.Add("CreatedBy", typeof(int));

            for(int i = 1; i < 20; i ++)
            {
                DataRow dr = dtInsert.NewRow();

                dr["ShiftTypeId"] = i;
                dr["EmpSapId"] = i;
                dr["ShiftDate"] = new DateTime();
                dr["StartTime"] = new DateTime().Hour;
                dr["EndTime"] = new DateTime().Hour;
                dr["CreatedBy"] = i * 100;

                dtInsert.Rows.Add(dr);
            }

            this.SaveToDatabase(dtInsert);
        }

        public void SaveToDatabase(DataTable dt)
        {
            string connStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SP_NZShiftRoaster_Bulk_Insert", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@DTNZShiftRoaster", dt);

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);

                if (ds.Tables.Count > 0)
                {
                    DataTable dtResult = ds.Tables[0];

                    if (dtResult.Rows.Count > 0)
                    {
                        //Your success code
                    }
                }
            }
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}