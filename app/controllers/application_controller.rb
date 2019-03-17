class ApplicationController < ActionController::API

  def MP_KEY
    Rails.application.credentials[Rails.env.to_sym][:mountain_project][:api_key]
  end

  def MP_BASE_URL
    "https://www.mountainproject.com/data"
  end

end
