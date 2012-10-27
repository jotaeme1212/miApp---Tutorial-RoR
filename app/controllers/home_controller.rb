class HomeController < ApplicationController

  before_filter :login_required, :only => [:acerca_de, :salir, :cambio_clave]

  def index
  end

  def acerca_de
  end

  # GET ingreso
  def ingreso
  end

  # POST ingreso
  def ingresar
    login = params[:datos][:login]
    clave = params[:datos][:clave]
    existe = Usuario.find_by_login_and_clave(login, clave)

    if !existe
      session[:usuario] = nil
      session[:userid] = nil
      redirect_to home_ingreso_path, :notice => 'Usuario/Clave incorrectos'
    else
      session[:usuario] = existe.login + '(' + existe.nombre + ')'
      session[:userid] = existe.id
      redirect_to home_index_path
    end
  end

  # GET cambio_clave
  def cambio_clave
  end

  # POST cambio_clave
  def cambiar_clave
    clave_act = params[:datos][:clave_act]
    clave_new = params[:datos][:clave_new]
    clave_rep = params[:datos][:clave_rep]

    usuario = Usuario.find(session[:userid])

    if (usuario.clave != clave_act) or (clave_new != clave_rep)
      redirect_to home_cambio_clave_path, :notice => 'Error en clave actual o claves no coinciden'
    else
      usuario.clave = clave_new
      if usuario.update_attributes(usuario.attributes)
        redirect_to home_cambio_clave_path, :notice => 'Clave cambiada con exito'
      else
        redirect_to home_cambio_clave_path, :notice => usuario.errors.full_messages.first
      end
    end
  end

  def acceso_denegado
  end

  def salir
    reset_session
    redirect_to home_index_path
  end

end
