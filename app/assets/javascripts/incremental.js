$(function() {
  function displayUsers(userId, userName) {
    var html =
      '<div class="chat-group-form__field--right">'
        + '<div class="chat-group-user">'
          + '<p class="chat-group-user__name">' + userName + '</p>'
          + '<p class="chat-group-button add" data-user-id=' + userId + '>' + '追加' + '</p>'
        + '</div>'
      + '</div>'
    $('#display_list').append(html);
  }

  function searchUsers(input) {
    $.ajax({
      type: 'GET',
      url: '/users/search.json',
      data: { input: input },
      dataType: 'json'
    })
    .done(function(users) {
      $('#member').siblings().remove();

      $.each(users, function(index, user) {
        displayUsers(user.id, user.name)
      });
    })
  }

  $('#user-search-field').on('keyup', function() {
    input = $('#user-search-field').val();

    if (input.length !== 0) {
      searchUsers(input)
    } else {
      $this = $(this);
      $this.parents('.chat-group-form__field--right').siblings().remove();
    }
  });

  function appendUsers(userId, userName) {
    var html =
      '<div class="chat-group-form__field--right">'
        + '<div class="chat-group-user">'
          + '<p class="chat-group-user__name">' + userName
            + '<input type="hidden" name="group[user_ids][]" value=' + userId + '>'
          + '</p>'
          + '<p class="chat-group-button delete" data-user-id=' + userId + '>' + '削除' + '</p>'
        + '</div>'
      + '</div>'
    $('#user_list').append(html);
  }

  $(document).on('click', '.chat-group-button.add', function() {
    var $this    = $(this);
    var userId   = $this.data('user-id');
    var userName = $this.siblings().text();
    appendUsers(userId, userName);
  });

  $(document).on('click', '.chat-group-button.delete', function() {
    $this = $(this);
    $this.parents('.chat-group-form__field--right').remove();
  });
});
