using MessagingToolkit.QRCode.Codec;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AttendanceManagement.App_Code;

namespace AttendanceManagement
{
    public partial class _event : System.Web.UI.Page
    {
        /// <summary>
        /// ### FUTURE ###
        /// The expected/actual students list fires on doc.ready through event.js file
        /// might be that the 10 second div refresh isnt needed and we include a refresh button at the top of the list
        /// after an event closes (maybe midnight of that day) the event should be made historical and moved into a seperate table 
        /// so that it can be reported on more accurately (against a hard event id) as opposed to datetime and room
        /// ### Even better ###
        /// Only do a refresh when there is new content!
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {

                String eventid = Request.QueryString["id"];                             
                    
                    Event ev1 = new Event();
                    ev1 = Event.LoadEvent(eventid);

                    lblEvent.Text = ev1.Title;
                    lblDate.Text = string.Format("{0:dd/MM/yyyy}", ev1.Start);
                    lblTime.Text = string.Format("{0:HH:mm}", ev1.Start) + "-" + string.Format("{0:HH:mm}", ev1.End);
                    
                    btnRoom.Text = ev1.Room;
                    btnLocation.Text = ev1.Location;

                    lblSlot.Text = ev1.Slot;

                    LoadQRCode(eventid, ev1.Room);

            }

        }                   

        void LoadQRCode(String eventid, String room)
        {

            string url = "http://wsv-att1snd.uol.le.ac.uk/registration.aspx?event=" + eventid + "&room=" + room;

            QRCodeEncoder encoder = new QRCodeEncoder();
            Bitmap hi = encoder.Encode(url);
            hi.Save(Server.MapPath("~/images/ji.jpg"), ImageFormat.Jpeg);
            img.ImageUrl = "~/images/ji.jpg";

        }

    }
}