class DevisetokenAuth::RegistrationController < DeviseTokenAuth::SessionsController
  skip_before_action :authenticate_api_user!
end