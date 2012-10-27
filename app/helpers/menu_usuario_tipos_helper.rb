module MenuUsuarioTiposHelper

	include FechasHelper
    
	# Con un objeto de tipo MenuUsuarioTipo, arma el item del menu
	def mostrar_item(menu)

		# Si el item tiene url, controlador o accion, arma link, sino solo label
		if (menu.controller != '') or (menu.action != '') or (menu.url != '')
			if menu.url != ''
				link_to menu.nombre, menu.url
			else
				link_to menu.nombre, :controller => menu.controller, :action => menu.action
			end
		else
			menu.nombre
		end

	end # Fin mostrar_item

	def mostrar_item_img(menu)
		icono = 'icono_menu.gif'
		icono = menu.icono if  menu.icono != ''
		image_tag(icono) if menu.orden != 0
	end # Fin mostrar_item_img

	# Carga el menu dinamico de la aplicacion
	def cargar_menu
		if session[:usuario]
			@opciones = Menu.find(:all, :order => 'padre, orden')
		else
			@opciones = []
		end
	end # Fin Carga el menu dinamico de la aplicacion

end
