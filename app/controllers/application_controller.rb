class ApplicationController < ActionController::Base

  protect_from_forgery

  def login_required
    return true if session[:userid]
    access_denied
    return false
  end # Fin login_required

  def access_menu

    if session[:userid]
		tiene_acceso = false
		tipo_usuario = Usuario.find(session[:userid]).usuario_tipo_id # Se recupera el tipo del usuario
		# Se controla solamente por controlador, no importa la accion
		# accion = Menu.find_by_controller_and_action(params[:controller], params[:action])
		accion = Menu.find_by_controller(params[:controller])
		# Para evitar error en ejecucion por nil, se ponen a cero si no existe
		tipo_usuario = 0 if !tipo_usuario
		accion = 0 if !accion
		acceso = MenuUsuarioTipo.find_by_menu_id_and_usuario_tipo_id(accion, tipo_usuario)
		tiene_acceso = true if acceso
	else
		# Si no est‡ logueado, no hay acceso
		tiene_acceso = false
	end

	return true if tiene_acceso
	access_denied
    return false

  end # Fin access_menu

  def access_denied
    redirect_to :controller => 'home', :action => 'acceso_denegado'
  end # Fin access_denied

end
