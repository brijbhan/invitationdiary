$(document).on 'ready', ->
  $('#party_start_at, #party_end_at').datetimepicker
    format: 'yyyy-mm-dd hh:ii'
    autoclose: true
