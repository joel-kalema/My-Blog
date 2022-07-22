class LoginController < ApplicationController

    def index
        @form = User.new
    end
 
end