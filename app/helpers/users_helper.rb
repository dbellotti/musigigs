module UsersHelper

  def referring_url
    if !request.env["HTTP_REFERER"].blank?
      return request.env["HTTP_REFERER"]
    else
      return "Empty"
    end
  end

end
