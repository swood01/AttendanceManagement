$(document).ready(function () {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today myCustomButton',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        events: '/handlers/calendar.ashx',
        eventClick: function (event) {
            if (event.url) {
                window.location.replace(event.url);
                return false;
            }
        }
    })

});