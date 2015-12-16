$('#send_chat').on('click', function(){
  var chat_name = $('#chat_name').val();
  var chat_content = $('#chat_content').val();

  var data = {
    name: chat_name,
    content: chat_content
  }

  // Call ajax
  // $.post('/v1/messages', data)
  $.ajax({url: "/v1/messages", data: data, method: 'POST', success: function(result){
    // console.log(result);
    var content_append = "<tr>";
    content_append += "<td>";
    content_append += result.id;
    content_append += "</td>";
    content_append += "<td>";
    content_append += result.name;
    content_append += "</td>";
    content_append += "<td>";
    content_append += result.content;
    content_append += "</td>";
    content_append += "</tr>";
    
    $('#chat_history').prepend(content_append);
  }});
});