# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

console.log ("results.js.coffee")

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
  
