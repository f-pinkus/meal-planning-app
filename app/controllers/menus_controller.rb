class MenusController < ApplicationController
  def index
    @menus = Menu.all

    render :index
  end

  def create
    @menu = Menu.create(
      title: params[:title],
      foods: params[:foods]
    )

    render :show
  end

  def show
    @menu = Menu.find_by(id: params[:id])

    render :show
  end

  def update
    @menu = Menu.find_by(id: params[:id])

    @menu.update(
      title: params[:title] || @menu.title,
      foods: params[:foods] || @menu.foods
    )

    render :show
  end

  def destroy
    @menu = Menu.find_by(id: params[:id])

    @menu.destroy

    render json: { message: "Menu deleted."}
  end
end
