# frozen_string_literal: true

class LoginController < ApplicationController # rubocop:todo Style/Documentation
  def index
    @form = User.new
  end
end
