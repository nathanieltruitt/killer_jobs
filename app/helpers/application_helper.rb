module ApplicationHelper
  # Only anonymous users can create new companies. Then they become a company admin.
  def no_current_user?
    return true if current_user.nil?

    false
  end
end
