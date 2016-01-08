using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace AttendanceManagement.handlers
{
    /// <summary>
    /// EventHandler returns a list of all expected and actual attendees to an event
    /// </summary>
    public class EventHandler : IHttpHandler      
    {

        public void ProcessRequest(HttpContext context)
        {                        

            JavaScriptSerializer jsonSerializer = new JavaScriptSerializer();
            String strEvent, strImagesOn;

            strEvent = context.Request["Event"];
            strImagesOn = context.Request["ImageOn"];

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceManagement"].ConnectionString);

                SqlCommand sqlCommand = default(SqlCommand);

                sqlCommand = new SqlCommand("uolsp_select_students_by_event", sqlConnection);

                sqlCommand.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter myDataAdapter = new SqlDataAdapter(sqlCommand);
                DataSet myDataSet = new DataSet();

                SqlParameter p1 = new SqlParameter("@sSlotId", strEvent);

                sqlCommand.Parameters.Add(p1);

                var sb = new StringBuilder();

                sb.AppendLine("<span class=\"list-group\">");

                try
                {
                    myDataAdapter.Fill(myDataSet, "students");

                    DataTable dt = myDataSet.Tables[0];

                    foreach (DataRow row in dt.Rows)
                    {                                                

                        sb.AppendLine("<span class=\"list-group-item\">");
                        sb.AppendLine("<div class=\"row\">");

                        sb.AppendLine("<div class=\"col-md-2\">");
                        //sb.AppendLine("<span>");
                        //<img class="featurette-image img-responsive center-block event-image" alt="<%# DataBinder.Eval(Container.DataItem, "vcFirstname")%> <%# DataBinder.Eval(Container.DataItem, "vcSurname")%> Image" src="<%# DataBinder.Eval(Container.DataItem, "ImagePath")%>">

                        if (strImagesOn == "true")
                        {
                            sb.AppendLine("<img class=\"featurette-image img-responsive center-block event-image\" alt=\"" + row["vcFirstname"].ToString() + " " + row["vcSurname"].ToString() + " Image\" src=\"" + row["ImagePath"].ToString() + "\" style=\"display: block;\">");
                        }
                        else
                        {
                            sb.AppendLine("<img class=\"featurette-image img-responsive center-block event-image\" alt=\"" + row["vcFirstname"].ToString() + " " + row["vcSurname"].ToString() + " Image\" src=\"" + row["ImagePath"].ToString() + "\" style=\"display: none;\">");
                        }
                                                
                        //sb.AppendLine("</span>");
                        sb.AppendLine("</div>");
                        
                        sb.AppendLine("<div class=\"col-md-3\">");

                        sb.AppendLine(row["vcFirstname"].ToString());
                        sb.AppendLine(row["vcSurname"].ToString());
                        sb.AppendLine("(" + row["vcITAccountName"].ToString() + ")");

                        sb.AppendLine("</div>");
                        sb.AppendLine("<div class=\"col-md-2\">");
                        sb.AppendLine(row["dtCreated"].ToString());
                        
                        sb.AppendLine("</div>");

                        sb.AppendLine("<div class=\"col-md-5\">");

                        sb.AppendLine("<div class=\"btn-group\" data-toggle=\"buttons\">");

                        switch(row["Attendance"].ToString().ToLower())
                        {
                            case "absent":

                                sb.AppendLine("<input type=\"submit\" value=\"Present\" class=\"btn btn-default\">");
                                sb.AppendLine("<input type=\"submit\" value=\"Absent\" class=\"btn btn-danger\">");
                                sb.AppendLine("<input type=\"submit\" value=\"Authorised Absence\" class=\"btn btn-default\">");

                                break;
                            case "present":

                                sb.AppendLine("<input type=\"submit\" value=\"Present\" class=\"btn btn-primary present\">");
                                sb.AppendLine("<input type=\"submit\" value=\"Absent\" class=\"btn btn-default\">");
                                sb.AppendLine("<input type=\"submit\" value=\"Authorised Absence\" class=\"btn btn-default\">");

                                break;
                            case "authorised":

                                sb.AppendLine("<input type=\"submit\" value=\"Present\" class=\"btn btn-default\">");
                                sb.AppendLine("<input type=\"submit\" value=\"Absent\" class=\"btn btn-default\">");
                                sb.AppendLine("<input type=\"submit\" value=\"Authorised Absence\" class=\"btn btn-warning authorised\">");

                                break;

                        }                       

                        sb.AppendLine("</div>");
                        sb.AppendLine("</div>");
                        sb.AppendLine("</div>");
                        
                        sb.AppendLine("</span>");
                        
                    }
                                        
                }
                catch (Exception ex)
                {

                }

                sb.AppendLine("</span>");                       

            context.Response.ContentType = "application/json";
            context.Response.Write(jsonSerializer.Serialize(sb.ToString()));
        
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