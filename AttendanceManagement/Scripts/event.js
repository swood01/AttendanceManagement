//doc ready function loads up expected students against actual attendees on page load
$(document).ready(function () {

    //Get id parameter from URL so correct event can be loaded
    var eventid = getUrlParameter('id');                     

    var imageson = 'false';

    if ($('#chkShowImages').is(':checked')) {
        imageson = 'true';
    }

    alert(imageson);

    $.ajax({
        url: 'handlers/event.ashx',
        type: 'POST',
        data: { 'Event': eventid, 'ImageOn': imageson },
        dataType: 'json',
        success: function (data) {

            $('#ExpectedStudents').html(data);
            UpdateAttendanceCounts();                                               

        },
        error: function (errorText) {

        }
    });        
    
    $('#chkShowImages').change(function () {
        
        var showImage;

        if($(this).is(':checked'))
        {
            showImage = 'true';
            //show all student images
            $('span.list-group-item img').show();
        }
        else
        {
            showImage = 'false';
            //hide all student images
            $('span.list-group-item img').hide();
        }

        $.ajax({
            url: 'handlers/showimage.ashx',
            type: 'POST',
            data: { 'Event': eventid, 'ShowImage': showImage },
            dataType: 'json',
            success: function (data) {                                

            },
            error: function (errorText) {

            }
        });

    })

});

/*
Function to refresh the expected students div every 10 seconds
*/
var auto_refresh = setInterval(
function () {     

    //console.log($('.list-group-item').html());

    var laststudent = $('.list-group-item .row .col-md-3').html();//$('.list-group-item').html();
        
    //Get id parameter from URL so correct event can be loaded
    var eventid = getUrlParameter('id');

    var imageson = 'false';

    if ($('#chkShowImages').is(':checked')) {    
        imageson = 'true';        
    }
    
    $.ajax({
        url: 'handlers/event.ashx',
        type: 'POST',
        data: { 'Event': eventid, 'ImageOn': imageson },
        dataType: 'json',
        success: function (data) {
                        
            AnyNewStudents(laststudent, data);

        },
        error: function (errorText) {

        }
    });
    

}, 10000); // refresh every 10000 milliseconds

function AnyNewStudents(laststudent, data)
{   
    
    var elements = $(data);    
    var newlaststudent = $('.list-group-item .row .col-md-3', elements);        

    //console.log(newlaststudent.html());
    //console.log(laststudent);

    if (newlaststudent.html() != laststudent)
    {            
        $('#ExpectedStudents').empty();
        $('#ExpectedStudents').html(data);               

        //set background colour of first new student to light-green
        $('.list-group-item').first().css('background-color', '#dff0d8');                 
        
        //reset background colour to white after 5 seconds
        setTimeout(function () {
            $('.list-group-item').first().css("background-color", "#FFFFFF");
        }, 5000);

        UpdateAttendanceCounts();
    }

}

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