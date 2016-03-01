module API
  module V1
    class BaseController < ApplicationController
      before_filter :authorize

      private

      unless params[:token] == Figaro.env.portal_token
        redirect_to root_path
        false
      end
    end
  end
end