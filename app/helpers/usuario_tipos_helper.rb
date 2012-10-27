module UsuarioTiposHelper

    include FechasHelper

    def generar_planilla_tipo_usuarios
        # Crear el libro
        workbook = Spreadsheet::Excel.new('public/archivo.xls')
        format = Spreadsheet::Format.new :color => :blue, :weight => :bold, :size => 10

        # Crear las hojas
        worksheet1 = workbook.add_worksheet('Tipo Usuarios')
        #worksheet2 = workbook.add_worksheet('Hoja2')

        # Escribir en las hojas especificando las celdas.
        worksheet1.write(0, 0, ['ID', 'Nombre', 'Creado', 'Actualizado'], format)

        registros = UsuarioTipo.find(:all, :order => 'id')
        linea = 0
        registros.each do |registro|
            linea = linea + 1
            worksheet1.write(linea, 0, [registro.id, registro.nombre, ver_fecha_df(registro.created_at), ver_fecha_df(registro.updated_at)])
        end

        # Se cierra el libro
        workbook.close
    end # Fin generar_planilla_tipo_usuarios

end
