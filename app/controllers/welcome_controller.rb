class WelcomeController < ApplicationController
  def index
    @nome = params[:nome]
  end
end
