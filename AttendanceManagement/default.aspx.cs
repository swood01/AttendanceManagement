using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using MessagingToolkit.QRCode.Codec;
using System.Drawing;
using System.Drawing.Imaging;

namespace AttendanceManagement
{
    public partial class LecturerView : System.Web.UI.Page
    {                

        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceManagement"].ConnectionString);

            SqlCommand sqlCommand = default(SqlCommand);

            sqlCommand = new SqlCommand("uolsp_select_events", sqlConnection);

            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter myDataAdapter = new SqlDataAdapter(sqlCommand);
            DataSet myDataSet = new DataSet();

            try
            {
                myDataAdapter.Fill(myDataSet, "events");

                lvEvents.DataSource = myDataSet;
                lvEvents.DataBind();                                

            }
            catch (Exception ex)
            {
                
            }
            
        }               

        protected void lvEvents_OnItemCommand(object sender, ListViewCommandEventArgs e)
        {

            switch (e.CommandName)
            {
                    case "cnLoadEvent":

                    Response.Redirect("event.aspx?id=" + e.CommandArgument, false);
                        Context.ApplicationInstance.CompleteRequest();

                        break;

            }                   
            
        }

        protected void lbCalendarMode_Click(object sender, EventArgs e)
        {
            lvEvents.Visible = false;
            lbListMode.Visible = true;
            lbCalendarMode.Visible = false;
            panelCalendar.Visible = true;
        }

        protected void lbListMode_Click(object sender, EventArgs e)
        {
            lvEvents.Visible = true;
            lbListMode.Visible = false;
            lbCalendarMode.Visible = true;
            panelCalendar.Visible = false;
        }            
  

    }
}