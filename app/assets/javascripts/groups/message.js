$(function() {
  function buildHTML(data) {
    console.log(data.text);
    var html = $('<li class="message__list"><div class="message__content">').append(data.text);
    return html;
  }

  $(function() {
    $('.submit_button').on('click', function(e) {
      e.preventDefault();
      var textField = $('.input_form');
      var text      = textField.val();
      var group_id  = textField.data('group').id;

      $.ajax({
        type: 'POST',
        url: '/groups/' + group_id + '/messages.json',
        data: {
          message: {
            text: text
          }
        },
        dataType: 'json'
      })
      .done(function(data) {
        var html = buildHTML(data)
        $('.main__message').append(html);
        textField.val('');
      })
      .fail(function() {
        alert("You ain't gonna send that message baby.");
      });
    });
  });
});
