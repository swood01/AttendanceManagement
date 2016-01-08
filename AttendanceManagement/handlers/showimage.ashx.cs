using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AttendanceManagement.handlers
{
    /// <summary>
    /// Summary description for showimage
    /// </summary>
    public class ShowImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            String strEvent, strShowImage;

            strEvent = context.Request["Event"];
            strShowImage = context.Request["ShowImage"];

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceManagement"].ConnectionString);

            SqlCommand sqlCommand = default(SqlCommand);

            sqlCommand = new SqlCommand("uolsp_update_event", sqlConnection);

            sqlCommand.CommandType = CommandType.StoredProcedure;                        

            SqlParameter p1 = new SqlParameter("@sSlotId", strEvent);
            SqlParameter p2 = new SqlParameter("@bShowImage", strShowImage);

            sqlCommand.Parameters.Add(p1);
            sqlCommand.Parameters.Add(p2);

            using (sqlConnection)
            {
                sqlConnection.Open();
                sqlCommand.ExecuteNonQuery();
                sqlConnection.Close();
                                
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