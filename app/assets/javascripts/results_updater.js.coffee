console.log ("results_updater.js.coffee")

$(document).ready ->
  $('select#team_id').change (event) ->
    console.log ("Change Teams")
    team_id = $("select#team_id").val()
    view = $("#status_table").attr('class')
    $.post view + '/change_team', 'team[id]': team_id, (data) ->
      $("#status_table").html(data)
  
setInterval ->
    view = $("#status_table").attr('class')
    $('#stage_table').load(view + '/refresh')
  , 30000
  
