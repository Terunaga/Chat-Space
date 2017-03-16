$(function() {
  $(function() {
    scrollToBottom();
  });

  function buildHTML(data) {
    var html =
    '<li class="message__list">'
    + '<div class="message__info">'
      + '<div class="message--user">' + data.user + '</div>'
      + '<div class="message--date">' + data.date + '</div>'
    + '</div>'
    + '<div class="message__content">'
      + '<p>' + data.text + '</p>'
      + '<p><img src="' + data.image.image.url + '"></p>'
    + '</div>'
    + '</li>';
    return html;
  }

  function scrollToBottom() {
    $('.main__message').scrollTop( $('.main__message').height() );
  }

  $('.submit_button').on('click', function(e) {
    e.preventDefault();

    var textField = $('.input_form');
    var form      = $('#new_message')[0];
    var formData  = new FormData(form);

    $.ajax({
      type:        'POST',
      url:         './messages.json',
      data:        formData,
      dataType:    'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.main__message').append(html);
      textField.val('');
      scrollToBottom();
    })
    .fail(function() {
      alert("You ain't gonna send that message baby.");
    });
  });
});
