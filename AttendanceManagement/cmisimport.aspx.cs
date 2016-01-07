using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttendanceManagement
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGetEvents_Click(object sender, EventArgs e)
        {
            
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CMISManagement"].ConnectionString);

            SqlCommand sqlCommand = default(SqlCommand);

            sqlCommand = new SqlCommand("[uols_interfaces].[uolsp_CMIS_attendance_monitoring_event_data]", sqlConnection);                    

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
                lblResults.Text = ex.Message;                
            }
        }
               

        protected void btnUploadEvents_Click(object sender, EventArgs e)
        {
            foreach (ListViewDataItem item in lvEvents.Items)
            {

                Label start = (Label)item.FindControl("lblStartTime");
                Label end = (Label)item.FindControl("lblFinishTime");
                Label name = (Label)item.FindControl("lblModName");
                Label type = (Label)item.FindControl("lblModType");
                Label site = (Label)item.FindControl("lblSiteName");
                Label slot = (Label)item.FindControl("lblSlotID");
                Label roomid = (Label)item.FindControl("lblRoomID");

                SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceManagement"].ConnectionString);

                SqlCommand sqlCommand = default(SqlCommand);

                sqlCommand = new SqlCommand("uolsp_insert_events", sqlConnection);

                sqlCommand.CommandType = CommandType.StoredProcedure;

                SqlParameter p1 = new SqlParameter("@sTitle", name.Text);
                SqlParameter p2 = new SqlParameter("@sRoom", roomid.Text);
                SqlParameter p3 = new SqlParameter("@sLocation", site.Text);
                SqlParameter p4 = new SqlParameter("@sSlotTime", slot.Text);
                SqlParameter p5 = new SqlParameter("@sStart", start.Text);
                SqlParameter p6 = new SqlParameter("@sEnd", end.Text);
                SqlParameter p7 = new SqlParameter("@sType", type.Text);

                sqlCommand.Parameters.Add(p1);
                sqlCommand.Parameters.Add(p2);
                sqlCommand.Parameters.Add(p3);
                sqlCommand.Parameters.Add(p4);
                sqlCommand.Parameters.Add(p5);
                sqlCommand.Parameters.Add(p6);
                sqlCommand.Parameters.Add(p7);

                try
                {
                    sqlConnection.Open();
                    sqlCommand.ExecuteScalar();
                    sqlConnection.Close();
                }
                catch(Exception ex)
                {
                    lblResults.Text = ex.Message;
                }

            }
        }

        protected void btnGetStudents_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["CMISManagement"].ConnectionString);

            SqlCommand sqlCommand = default(SqlCommand);

            sqlCommand = new SqlCommand("[uols_interfaces].[uolsp_CMIS_attendance_monitoring_student_data]", sqlConnection);

            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter myDataAdapter = new SqlDataAdapter(sqlCommand);
            DataSet myDataSet = new DataSet();

            try
            {
                myDataAdapter.Fill(myDataSet, "events");

                lvStudents.DataSource = myDataSet;
                lvStudents.DataBind();

            }
            catch (Exception ex)
            {
                lblResults.Text = ex.Message;
            }
        }

        protected void btnUploadStudents_Click(object sender, EventArgs e)
        {

            foreach (ListViewDataItem item in lvStudents.Items)
            {

                Label slot = (Label)item.FindControl("lblSlotID");
                Label student = (Label)item.FindControl("lblStudentID");

                SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceManagement"].ConnectionString);

                SqlCommand sqlCommand = default(SqlCommand);

                sqlCommand = new SqlCommand("uolsp_insert_students", sqlConnection);

                sqlCommand.CommandType = CommandType.StoredProcedure;

                SqlParameter p1 = new SqlParameter("@sSlot", slot.Text);
                SqlParameter p2 = new SqlParameter("@sStudent", student.Text);
              

                sqlCommand.Parameters.Add(p1);
                sqlCommand.Parameters.Add(p2);
               

                try
                {
                    sqlConnection.Open();
                    sqlCommand.ExecuteScalar();
                    sqlConnection.Close();
                }
                catch (Exception ex)
                {
                    lblResults.Text = ex.Message;
                }


            }

        }
    }
}