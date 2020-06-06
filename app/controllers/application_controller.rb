class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :resources_not_found

  protected

    def resources_not_found
    end
    
end
