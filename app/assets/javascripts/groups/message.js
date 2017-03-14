$(function() {
  function buildHTML(data, user_name) {
    var html =
    '<li class="message__list">'
    + '<div class="message__info">'
      + '<div class="message--user">' + user_name + '</div>'
      + '<div class="message--date">' + dateToFormatString(new Date(data.created_at), '%YYYY%/%MM%/%DD% %HH%:%mm%:%ss%') + '</div>'
    + '</div>'
    + '<div class="message__content">' + data.text + '</div>'
    + '</li>';
    return html;
  }

  $('.submit_button').on('click', function(e) {
    e.preventDefault();
    var textField = $('.input_form');
    var text      = textField.val();
    var user_name = textField.data('user').name;

    $.ajax({
      type: 'POST',
      url: './messages.json',
      data: {
        message: {
          text: text
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data, user_name)
      $('.main__message').append(html);
      textField.val('');
    })
    .fail(function() {
      alert("You ain't gonna send that message baby.");
    });
  });
});
