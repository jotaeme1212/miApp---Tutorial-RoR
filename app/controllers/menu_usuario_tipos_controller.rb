class MenuUsuarioTiposController < ApplicationController

  before_filter :access_menu

  def index
    @menu_usuario_tipos = MenuUsuarioTipo.all
  end

  def show
    @menu_usuario_tipo = MenuUsuarioTipo.find(params[:id])
  end

  def new
    @menu_usuario_tipo = MenuUsuarioTipo.new
  end

  def create
    @menu_usuario_tipo = MenuUsuarioTipo.new(params[:menu_usuario_tipo])

    if @menu_usuario_tipo.save
      render action: "show", notice: 'Registro creado.'
    else
      render action: "new"
    end
  end

  def edit
    @menu_usuario_tipo = MenuUsuarioTipo.find(params[:id])
  end

  def update
    @menu_usuario_tipo = MenuUsuarioTipo.find(params[:id])

    if @menu_usuario_tipo.update_attributes(params[:menu_usuario_tipo])
      render action: "show", notice: 'Registro actualizado.'
    else
      render action: "new"
    end
  end

  def destroy
    @menu_usuario_tipo = MenuUsuarioTipo.find(params[:id])
    @menu_usuario_tipo.destroy
    redirect_to menu_usuario_tipos_url
  end

end
