//doc ready function loads up expected students against actual attendees on page load
$(document).ready(function () {

    //Get id parameter from URL so correct event can be loaded
    var eventid = getUrlParameter('id');

    $.ajax({
        url: 'handlers/event.ashx',
        type: 'POST',
        data: { 'Event': eventid },
        dataType: 'json',
        success: function (data) {

            $('#ExpectedStudents').html(data);
            UpdateAttendanceCounts();
        },
        error: function (errorText) {

        }
    });
});

/*
Function to refresh the expected students div every 10 seconds
*/
var auto_refresh = setInterval(
function () {
    $('#ExpectedStudents').empty();

    //Get id parameter from URL so correct event can be loaded
    var eventid = getUrlParameter('id');

    $.ajax({
        url: 'handlers/event.ashx',
        type: 'POST',
        data: { 'Event': eventid },
        dataType: 'json',
        success: function (data) {

            $('#ExpectedStudents').html(data);
            UpdateAttendanceCounts();

        },
        error: function (errorText) {

        }
    });



}, 10000); // refresh every 10000 milliseconds

/*
Function to update attendance counts within events page
*/
function UpdateAttendanceCounts() {

    var expected = 0;
    var present = 0;
    var authorised = 0;
    var reported = 0

    expected = document.getElementsByClassName("list-group-item").length;
    present = document.getElementsByClassName("btn btn-primary present").length;
    authorised = document.getElementsByClassName("btn btn-primary authorised").length;

    reported = authorised + present;

    var perReported = (reported / expected) * 100;
    var perPresent = (present / expected) * 100;

    $('#lblReported').text(reported);
    $('#lblExpected').text(expected);
    $('#lblPresent').text(present);

    $('#pbExpected').attr("style", "width:100%");
    $('#pbReported').attr("style", "width:" + perReported + "%;");
    $('#pbPresent').attr("style", "width:" + perPresent + "%;");

}

/*
Function to get parameters from url
*/
function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};