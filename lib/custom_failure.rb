class CustomFailure < Devise::FailureApp
  # You need to override respond to eliminate recall
  def respond
    if request.format == :js
      render 'login'
    end
  end
end