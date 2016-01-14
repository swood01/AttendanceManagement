using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using System.IO;
using System.Runtime.Serialization.Json;
using AttendanceManagement.App_Code;

namespace AttendanceManagement.handlers
{
    /// <summary>
    /// Summary description for StudentDetails
    /// </summary>
    public class StudentDetails : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
            String strId;

            strId = context.Request["AccountName"];
            //strImagesOn = context.Request["ImageOn"];
            
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceManagement"].ConnectionString);

            SqlCommand sqlCommand = default(SqlCommand);

            sqlCommand = new SqlCommand("uolsp_select_students_by_account_name", sqlConnection);

            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter myDataAdapter = new SqlDataAdapter(sqlCommand);
            DataSet myDataSet = new DataSet();

            SqlParameter p1 = new SqlParameter("@sAccountName", strId);

            sqlCommand.Parameters.Add(p1);

            StudentData details = new StudentData();

            try
            {
                myDataAdapter.Fill(myDataSet, "students");

                DataTable dt = myDataSet.Tables[0];

                DataRow dataRow = myDataSet.Tables[0].Rows[0];
                
                details.firstName = dataRow.Field<string>("vcFirstname");
                details.lastName = dataRow.Field<string>("vcSurname");
                details.email = dataRow.Field<string>("vcEmail");
                details.studentNo = dataRow.Field<string>("vcStudentNo");
                details.imagePath = dataRow.Field<string>("ImagePath");

            }
            catch
            {

            }

            MemoryStream stream = new MemoryStream();
            DataContractJsonSerializer s = new DataContractJsonSerializer(typeof(StudentData));
            s.WriteObject(stream, details);
            stream.Position = 0;
            StreamReader sr = new StreamReader(stream);

            context.Response.ContentType = "application/json";
            context.Response.Write(sr.ReadToEnd());
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