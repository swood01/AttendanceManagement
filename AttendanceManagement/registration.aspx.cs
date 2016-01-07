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
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            if (Request.QueryString["event"] != null && Request.QueryString["room"] != null)
            {

                //String eventid = Request.QueryString["event"];                               
                String room = Request.QueryString["room"];

                SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceManagement"].ConnectionString);

                SqlCommand sqlCommand = default(SqlCommand);

                //sqlCommand = new SqlCommand("uolsp_insert_student_qr_registration", sqlConnection);
                sqlCommand = new SqlCommand("uolsp_insert_student_registration", sqlConnection);

                sqlCommand.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter myDataAdapter = new SqlDataAdapter(sqlCommand);
                DataSet myDataSet = new DataSet();

                //SqlParameter p1 = new SqlParameter("@sSlot", eventid);
                //SqlParameter p2 = new SqlParameter("@sITAccountName", txtName.Text);

                SqlParameter p1 = new SqlParameter("@sITAccountName", txtName.Text);
                SqlParameter p2 = new SqlParameter("@sRoom", room);
                
                sqlCommand.Parameters.Add(p1);
                sqlCommand.Parameters.Add(p2);

                using (sqlConnection)
                {
                    sqlConnection.Open();
                    sqlCommand.ExecuteNonQuery();
                    sqlConnection.Close();

                    lblResult.Text = "Congratulations " + txtName.Text + " you've registered successfully for the event!";
                    panelRegister.Visible = false;
                }   
                               

            }


        }
    }
}