$(document).on('turbolinks:load', function () {
  console.log(window.location.href.split('/').pop())
  App.chatroom = App.cable.subscriptions.create({
    channel: "ChatroomChannel",
    chatroom_id: window.location.href.split('/').pop()
  },
    {
      connected() { },
      disconnected() { },

      received(data) {
        $('#messages-container').append(data.message)
        scrollToBottom();
        clearMessageBox();
      }
    });
})
