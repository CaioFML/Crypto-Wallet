class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails [COOKIES]"
    session[:curso] = "Curso de Ruby on Rails [SESSION]"
    @nome = params[:nome]
    @curso = params[:curso]
  end
end
