# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    include SiteHandler
    not_add_site_to_params

    load_and_authorize_resource
    skip_load_resource only: :index

    UPDATE_USER_PARAMS = %i[first_name
                            last_name
                            father_name
                            phone_number].freeze
    USER_PARAMS = UPDATE_USER_PARAMS

    def index
      @users = User.all

      respond_to do |format|
        format.html
        format.json { render json: @users }
      end
    end

    def new; end

    def edit; end

    def create
      @user.save
      respond_with @user, location: users_path
    end

    def update
      @user.update update_user_params
      respond_with @user, location: users_path
    end

    def destroy
      @user.destroy
      respond_with @user, location: users_path
    end

    private

    def user_params
      params.require(:user).permit(*USER_PARAMS)
    end

    def update_user_params
      params.require(:user).permit(*UPDATE_USER_PARAMS)
    end
  end
end
