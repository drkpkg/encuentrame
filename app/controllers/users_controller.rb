class UsersController < ApplicationController

  before_action :set_user, only: [:info, :update, :delete]

  def index
    @users = User.all
  end

  def info

  end

  def new
    @user = User.new
  end

  def create

  end

  def update
  end

  def delete
  end

  private

  def set_user
    @person = Person.find_by(:id)
  end
end
