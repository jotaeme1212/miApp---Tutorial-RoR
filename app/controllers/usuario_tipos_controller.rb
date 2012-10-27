class UsuarioTiposController < ApplicationController

  include UsuarioTiposHelper

  before_filter :access_menu

  def index
    @usuario_tipos = UsuarioTipo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuario_tipos }
      format.xml { render :xml => @usuario_tipos }
    end
  end

  def show
    @usuario_tipo = UsuarioTipo.find(params[:id])
  end

  def new
    @usuario_tipo = UsuarioTipo.new
  end

  def create
    @usuario_tipo = UsuarioTipo.new(params[:usuario_tipo])

    if @usuario_tipo.save
      render action: "show", :notice => 'Registro creado.'
    else
      render action: "new"
    end
  end

  def edit
    @usuario_tipo = UsuarioTipo.find(params[:id])
  end

  def update
    @usuario_tipo = UsuarioTipo.find(params[:id])

    if @usuario_tipo.update_attributes(params[:usuario_tipo])
      render action: "show", :notice => 'Registro actualizado.'
    else
      render action: "edit"
    end
  end

  def destroy
    @usuario_tipo = UsuarioTipo.find(params[:id])
    @usuario_tipo.destroy
    redirect_to usuario_tipos_url
  end

  # Genera TXT con los datos de la tabla
  def txt
    generar_planilla_tipo_usuarios
    send_file 'public/archivo.xls', :type => 'application/vnd.ms-excel', :disposition => 'inline'
  end

end
