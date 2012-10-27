module FechasHelper

    # Formato de fechas
    FECHA_FORMATO1 = '%d/%m/%Y'
    FECHA_FORMATO2 = '%d/%m/%Y - %H:%M'
    FECHA_FORMATO3 = '%d-%m-%Y'
    FECHA_FORMATO4 = '%d-%m-%Y - %H:%M'
    FECHA_FORMATO5 = '%l:%M %p, %B %d, %Y'

    def ver_fecha(fecha, formato)
        fecha.strftime(formato)
    end

    # Fecha por default, para usar la misma en todos los index de datos
    def ver_fecha_df(fecha)
        if fecha
            fecha.strftime(FECHA_FORMATO2)
        else
            '-'
        end
    end

end
