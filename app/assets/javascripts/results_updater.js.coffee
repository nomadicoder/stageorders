console.log ("results_updater.js.coffee")

$(document).ready ->
  $('select#team_id').change (event) ->
    console.log ('change_team')
    team_id = $("select#team_id").val()
    console.log ('team_id: ' + team_id)
    view = $("#status_table").attr('class')
    console.log ('view: ' + view)
    $.post view + '/change_team', 'team[id]': team_id, (data) ->
      $("#status_table").html(data)
  
setInterval ->
    console.log ('tick')
    view = $("#status_table").attr('class')
    console.log ('view: ' + view)
    $('#stage_table').load(view + '/refresh')
  , 5000
  
