$(function() {
  const INTERVAL = 3000;

  function appendNewMessages(user, text, date) {
    var html =
      '<li class="message__list">'
        + '<div class="message__info">'
          + '<div class="message--user">' + user + '</div>'
          + '<div class="message--date">' + date + '</div>'
        + '</div>'
        + '<div class="message__content">' + text + '</div>'
      + '</li>'
    $('.main__message').append(html);
  }

  function fetchNewMessages(messages) {
    var currentMessageCounts = $('.main__message').children().length;
    messages.splice(0, currentMessageCounts);
    return messages;
  }

  refreshMessages = function refreshMessages() {
    $.ajax({
      type: 'GET',
      url: './messages.json',
      dataType: 'json'
    })
    .done(function(messages) {
      newMessage = fetchNewMessages(messages)
      $.each(messages, function(index, message) {
        var user = message.user.name;
        var text = message.text;
        var date = dateToFormatString(new Date(message.created_at), '%YYYY%/%MM%/%DD% %HH%:%mm%:%ss%');

        appendNewMessages(user, text, date);
      });
    })
    .fail(function() {
      alert('failed to reload messages baby!');
    });
  }

  setInterval(refreshMessages, INTERVAL);
});
