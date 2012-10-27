class MenusController < ApplicationController

  before_filter :access_menu

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(params[:menu])

    if @menu.save
      render action: "show", notice: 'Registro creado.'
    else
      render action: "new"
    end
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    params[:menu][:usuario_tipo_ids] ||= [] # Para que no de error al desmarcar todas las casillas

    if @menu.update_attributes(params[:menu])
      render action: "show", notice: 'Registro actualizado.'
    else
      render action: "edit"
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to menus_url
  end

end
