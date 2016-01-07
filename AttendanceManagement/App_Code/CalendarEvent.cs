using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AttendanceManagement.App_Code
{
    public class CalendarEvent
    {

        public string title {get; set;}
        public string description { get; set; }
        public string start { get; set; }
        public string end { get; set; }
        public string allday { get; set; }
        public string url { get; set; }
        public string color { get; set; }
        public string borderColor { get; set; }
        public string textColor { get; set; }

        public CalendarEvent()
        {
        }

        public CalendarEvent(string t, string d, string s, string e, string a, string u, string col = null, string bcol = null, string tcol = null)
        {
            title = t;
            description = d;
            start = s;
            end = e;
            allday = a;
            url = u;
            color = col;
            borderColor = bcol;
            textColor = tcol;
        }


    }
}