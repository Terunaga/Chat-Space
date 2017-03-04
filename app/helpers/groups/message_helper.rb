module Groups::MessageHelper
  def group_users(group)
    group.users.pluck(:name).join(' ')
  end
end
