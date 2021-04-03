# frozen_string_literal: true

module ApplicationHelper
  include Chartkick::Helper

  def path_for(model)
    public_send("#{model.class.name.split('::').last.downcase}_path", model)
  end

  def edit_path_for(model)
    "#{path_for(model)}/edit"
  end

  def new_path_for(model)
    public_send("new_#{model.name.split('::').last.downcase}_path")
  end

  def search_for(model)
    public_send("#{model.name.split('::').last.downcase.pluralize}_path")
  end

  def title
    I18n.t("actions.#{params[:controller]}")
  end
end
