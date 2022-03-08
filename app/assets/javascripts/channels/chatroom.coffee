App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data.flag == "message"
      $('#message-container').append data.message;
      submit_message();
      scroll_bottom();
    else if data.flag == "create"
      if document.getElementById(data.user.username) == null
        $('#active_users').append '<a class="item" id=' + data.user.username + '>' + 
          data.user.username + '</a>'
    else if data.flag == "destroy"
      if document.getElementById(data.user.username) != null
        document.getElementById(data.user.username).remove();

