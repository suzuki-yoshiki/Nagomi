module ApplicationHelper

  def full_title(page_name = "")
    base_title = "Nagomi"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end

  # 渡されたユーザーがログイン済みのユーザーであればtrueを返します。
  def current_user?(user)
    user == current_user
  end

end
