class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  add_flash_types :info, :error, :warning

  ERROR_MSG = 'Parameter missing!'.freeze

  rescue_from ActionController::ParameterMissing do |_e|
    respond_to do |format|
      format.html do
        # error message
        flash[:error] = ERROR_MSG
        redirect_back fallback_location: root_path
      end
      format.json { render json: ERROR_MSG, status: 422 }
    end
  end
end
