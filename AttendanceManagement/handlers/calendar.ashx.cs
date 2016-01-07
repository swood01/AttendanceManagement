using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using AttendanceManagement.App_Code;

namespace AttendanceManagement.Handlers
{
    /// <summary>
    /// Summary description for EventHandler
    /// </summary>
    public class CalendarHandler : IHttpHandler
    {
        private List<CalendarEvent> _cal = new List<CalendarEvent>();

        public void ProcessRequest(HttpContext context)
        {
            //Load Data
            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceManagement"].ConnectionString);

            SqlCommand sqlCommand = default(SqlCommand);

            sqlCommand = new SqlCommand("uolsp_select_events", sqlConnection);

            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter myDataAdapter = new SqlDataAdapter(sqlCommand);
            DataSet myDataSet = new DataSet();

            try
            {
                myDataAdapter.Fill(myDataSet, "events");
                var eventList = myDataSet.Tables[0].AsEnumerable().Select(dataRow => new CalendarEvent { title = dataRow.Field<string>("vcTitle"), 
                    end = dataRow.Field<DateTime>("dtEnd").ToString("yyyy-MM-dd HH:mm"), 
                    start = dataRow.Field<DateTime>("dtStart").ToString("yyyy-MM-dd HH:mm"), 
                    url = String.Format("/event.aspx?id={0}", dataRow.Field<string>("vcSlot")),
                    description = String.Format("Location: {0}, Room {1}", dataRow.Field<string>("vcLocation"), dataRow.Field<string>("vcRoom"))
                }).ToList();

                //This is the important part!
                MemoryStream stream = new MemoryStream();
                DataContractJsonSerializer s = new DataContractJsonSerializer(typeof(List<CalendarEvent>));
                s.WriteObject(stream, eventList);
                stream.Position = 0;
                StreamReader sr = new StreamReader(stream);

                context.Response.ContentType = "application/json";
                context.Response.Write(sr.ReadToEnd());
            }
            catch (Exception ex)
            {
                //An error occurred
                String error = ex.Message;
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