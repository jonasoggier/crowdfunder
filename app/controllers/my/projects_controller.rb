class My::ProjectsController < ApplicationController

  before_filter :require_login

  def index
    @projects = current_user.projects
  end

  # def new
  #   @project = Project.new
  # end

  #to be seen if really needed all of them...
  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
