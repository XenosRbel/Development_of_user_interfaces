# frozen_string_literal: true

module Admin
  class AdministratorsController < ApplicationController
    datatable model: Administrator
    def index
     super
    end
  end
end
