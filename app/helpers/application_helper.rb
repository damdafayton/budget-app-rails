module ApplicationHelper
  def main_navigation_page?
    if (request.original_fullpath=='/' || request.original_fullpath=='/transactions') then
      return true
    end
    return false
  end
end
