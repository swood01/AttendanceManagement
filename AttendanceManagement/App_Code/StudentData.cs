using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AttendanceManagement.App_Code
{
    public class StudentData
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string email { get; set; }
        public string studentNo { get; set; }
        public string imagePath { get; set; }

        public StudentData()
        {
        }
    }
}