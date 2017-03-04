module Groups::MessageHelper
  def group_users(group)
    array_users = group.users.pluck(:name).join(' ')
  end
end
