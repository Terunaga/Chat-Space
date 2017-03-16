$(function() {
  function buildHTML(data, user_name) {
    var html =
    '<li class="message__list">'
    + '<div class="message__info">'
      + '<div class="message--user">' + user_name + '</div>'
      + '<div class="message--date">' + dateToFormatString(new Date(data.created_at), '%YYYY%/%MM%/%DD% %HH%:%mm%:%ss%') + '</div>'
    + '</div>'
    + '<div class="message__content">'
      + '<p>' + data.text + '</p>'
      + '<p><img src="' + data.image.url + '"></p>'
    + '</div>'
    + '</li>';
    return html;
  }

  $('.submit_button').on('click', function(e) {
    e.preventDefault();
    var textField = $('.input_form');
    var text      = textField.val();
    var user_name = textField.data('user').name;
    var image     = new FormData($('#message_image')[0].files[0]);



    var form = $('#new_message')[0];

    var formData = new FormData(form);

    $.ajax({
      type: 'POST',
      url: './messages.json',
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data, user_name)
      $('.main__message').append(html);
      textField.val('');
    })
    .fail(function(data) {
      alert("You ain't gonna send that message baby.");
    });
  });
});
