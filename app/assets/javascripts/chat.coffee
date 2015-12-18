@Remote = {}

Remote.cable = Cable.createConsumer("ws://10.121.79.79:28080")

Remote.cable.subscriptions.create "ChatChannel",
  received: (data) ->
    content_append = '<tr>'
    content_append += '<td>'
    content_append += data.message.id
    content_append += '</td>'
    content_append += '<td>'
    content_append += data.message.name
    content_append += '</td>'
    content_append += '<td>'
    content_append += data.message.content
    content_append += '</td>'
    content_append += '</tr>'
    $('#chat_history').prepend content_append

$('#send_chat').on 'click', ->
  chat_name = $('#chat_name').val()
  chat_content = $('#chat_content').val()
  data = 
    name: chat_name
    content: chat_content
  $.ajax
    url: '/v1/messages'
    data: data
    method: 'POST'