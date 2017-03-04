module Groups::MessageHelper
  def group_users(group)
    group.users.pluck(:name).join(' ')
  end

  def format_date(message)
    message.created_at.strftime('%Y/%m/%d %H:%M:%S')
  end
end
