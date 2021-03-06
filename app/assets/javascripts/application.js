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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
// Loads all Semantic javascripts
//= require semantic-ui

scrollToBottom = () => {
  let messagesElement = $('#messages');
  if (messagesElement.length > 0) {
    messagesElement.scrollTop(messagesElement[0].scrollHeight);
  }
}

clearMessageBox = () => {
  $('#new-message-box')[0].value = '';
}

submitMessageWithReturnKey = () => {
  $('#new-message-box').on('keydown', (e) => {
    if (e.value.lenght > 0 && e.keyCode == 13) {
      $('#new-message-submit').click();
      e.target.value = '';
    }
  });
}

$(document).on("turbolinks:load", function () {
  $(".ui.dropdown").dropdown();
  $('.message .close')
    .on('click', function () {
      $(this)
        .closest('.message')
        .transition('fade')
        ;
    });
  $('.special.cards .image').dimmer({
    on: 'hover'
  });
  scrollToBottom();
  clearMessageBox();
  submitMessageWithReturnKey();
});
