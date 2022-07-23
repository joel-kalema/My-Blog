class ApplicationController < ActionController::Base
  def current_user
      User.first # rubocop:todo Layout/IndentationWidth
  end
end
