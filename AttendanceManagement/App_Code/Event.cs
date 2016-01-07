using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AttendanceManagement.App_Code
{
    public class Event
    {

        public int id { get; set; }
        public string Title { get; set; }
        public string Room { get; set; }
        public string Location { get; set; }
        public string Type { get; set; }
        public string Slot { get; set; }
        public DateTime Start { get; set; }
        public DateTime End { get; set; }

        public static List<Event> GetEvents()
        {

            List<Event> li = new List<Event>();                       

            return li;

        }

        public static Event LoadEvent(string slot)
        {

            SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["AttendanceManagement"].ConnectionString);

            SqlCommand sqlCommand = default(SqlCommand);

            sqlCommand = new SqlCommand("uolsp_select_event", sqlConnection);

            sqlCommand.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter myDataAdapter = new SqlDataAdapter(sqlCommand);
            
            SqlParameter p1 = new SqlParameter("@sSlotId", slot);
            sqlCommand.Parameters.Add(p1);
            
            Event event1 = new Event();

            event1.Slot = slot;
                        
            using (sqlConnection)
            {
                sqlConnection.Open();
                SqlDataReader reader = sqlCommand.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        event1.Title = reader["vcTitle"].ToString();
                        event1.Location = reader["vcLocation"].ToString();
                        event1.Room = reader["vcRoom"].ToString();
                        event1.Start = (DateTime)reader["dtStart"];
                        event1.End = (DateTime)reader["dtEnd"];                        
                    }
                    reader.Close();
                }
                
            }                      
           
            return event1;

        }

    }
}