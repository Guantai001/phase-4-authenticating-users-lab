class UsersController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
    # GET /me
    def show
        user = User.find_by(id: session[:user_id])
        render json: user
      end

      def destroy
        session.delete :user_id
        head :no_content
      end

        private

        def record_not_found
            render json: { error: "Not authorized" }, status: :unauthorized
        end
end
