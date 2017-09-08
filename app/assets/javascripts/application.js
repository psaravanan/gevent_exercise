// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery2
//= require rails-ujs
//= require turbolinks
//= require moment
//= require bootstrap-datetimepicker
//= bootstrap-datetimepicker
//= require bootstrap-sprockets

$(document).ready(function() {

  $(document).on('turbolinks:load', function() {
    call_datepicker();
  });
  
  call_datepicker();
  
});

function call_datepicker(){
  // $('.datepicker').datetimepicker();
  $('#startdate,#enddate').datetimepicker({
    useCurrent: false,
    minDate: moment()
});
$('#startdate').datetimepicker().on('dp.change', function (e) {
    var incrementDay = moment(new Date(e.date));
    incrementDay.add(1, 'days');
    $('#enddate').data('DateTimePicker').minDate(incrementDay);
    $(this).data("DateTimePicker").hide();
});

$('#enddate').datetimepicker().on('dp.change', function (e) {
        var decrementDay = moment(new Date(e.date));
        decrementDay.subtract(1, 'days');
        $('#startdate').data('DateTimePicker').maxDate(decrementDay);
         $(this).data("DateTimePicker").hide();
    });


}


