# frozen_string_literal: true

class UsersController < ApplicationController # rubocop:todo Style/Documentation
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
