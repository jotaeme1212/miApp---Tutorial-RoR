module ApplicationHelper

    include FechasHelper

    # Enlace que se muestra solo si el usuario ha ingresado al sistema
    def link_usuario(titulo, enlace)
        link_to titulo, enlace if not session[:usuario]
    end

    # Enlace que se muestra solo si no hay un usuario logueado
    def link_anonimo(titulo, enlace)
        link_to titulo, enlace if session[:usuario]
    end

    def ver_debug
        debug(params) if ENV['RAILS_ENV'] == 'development'
    end

    def ver_info_pie
        if session[:usuario]
            usuario = session[:usuario] + ' - '
        else
            usuario = ''
        end
        # Date.today
        usuario + ver_fecha_df(Time.now) + ' - Todos los derechos reservados - 2012'
    end

end
