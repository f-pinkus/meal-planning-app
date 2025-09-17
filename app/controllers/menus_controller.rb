class MenusController < ApplicationController

  def index
    @menus = Menu.all

    # render :index
    render json: @menus
  end

  def create
    @menu = Menu.create(
      title: params[:title],
      foods: params[:foods]
    )

    # render :show
    render json: @menu
  end

  def show
    @menu = Menu.find_by(id: params[:id])

    # render :show
    render json: @menu
  end

  def update
    @menu = Menu.find_by(id: params[:id])

    @menu.update(
      title: params[:title] || @menu.title,
      foods: params[:foods] || @menu.foods
    )

    # render :show
    render json: @menu
  end

  def destroy
    @menu = Menu.find_by(id: params[:id])

    @menu.destroy

    render json: { message: "Menu deleted."}
  end

  def generate
    prompt = params[:prompt]
    generated_data = AiMenuGenerator.generate(prompt)

    title = params[:title].presence || generated_data["title"]

    @menu = current_user.menus.create(
      title: title,
      foods: generated_data["foods"]
    )

    render json: @menu
  end
end
