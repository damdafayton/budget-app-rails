module ApplicationHelper
  def main_navigation_page?
    return true if request.original_fullpath == '/' || request.original_fullpath == '/transactions'

    false
  end
end
