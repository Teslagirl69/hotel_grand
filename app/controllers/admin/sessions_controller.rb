# frozen_string_literal: true


  class Admin::SessionsController < Devise::SessionsController
    include Accessible
    skip_before_action :check_resource, only: :destroy
  end
