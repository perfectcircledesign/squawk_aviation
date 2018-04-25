module CustomViewHelper

  def determine_stylesheet(stylesheet)
    if stylesheet.present?
      stylesheet
    else
      if home_page?
      "cms"
      elsif controller_name == 'registrations' and (['account', 'news_feed', 'jobs_feed', 'search'].include? action_name)
        "user-profile"
      elsif controller_name == 'registrations' and (action_name == 'airline_account')
        "airline-dashboard"
      elsif (controller_name == 'jobs' and action_name == 'show') or (controller_name == 'messages' and action_name == 'index')
        "user-profile"
      else
        "cms"
      end
    end
  end

end
