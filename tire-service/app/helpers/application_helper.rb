# frozen_string_literal: true

module ApplicationHelper
  def path_for(model)
    public_send("#{model.class.name.split('::').last.downcase}_path", model)
  end

  def edit_path_for(model)
    "#{path_for(model)}/edit"
  end
end
