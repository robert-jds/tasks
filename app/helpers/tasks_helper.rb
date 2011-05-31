module TasksHelper
  def user_anchor(user)
    return '' if !user
    return "##{user.last_name}-#{user.id.to_s}"
  end
end
