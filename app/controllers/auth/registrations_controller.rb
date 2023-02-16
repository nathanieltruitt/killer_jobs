module Auth
  class RegistrationsController < Devise::RegistrationsController

    def create
      params[:user][:role_id] = params[:user][:role_id].to_i
      super
    end

    private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
    end
  end
end