# frozen_string_literal: true

module Admin
  class SettingsController < Admin::ApplicationController
    def index; end

    def create; end

    def edit; end

    def update
      setting_params.keys.each do |key|
        Setting.__send__("#{key}=", setting_params[key].strip) unless setting_params[key].nil?
      end

      redirect_to setting_path, notice: "Setting was successfully updated."
    end

    private

    def setting_params
      params.require(:setting)
    end
  end
end
