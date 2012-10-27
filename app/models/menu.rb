class Menu < ActiveRecord::Base

    before_destroy :validates_no_dependents

    validates_presence_of     :nombre, :message => 'no puede estar vacio'
    validates_numericality_of :orden,  :message => 'debe ser un numero'
    validates_numericality_of :padre,  :message => 'debe ser un numero'

    # Tipo de relacion
    has_and_belongs_to_many :usuario_tipos, :join_table => 'menu_usuario_tipos'

    # -------------------- Procedimientos de las validaciones ----------------------

    def validates_no_dependents
        if self.usuario_tipos.count() > 0
            errors.add :base, 'El Menu tiene Tipo de Usuarios asociados'
            false
        end
    end # Fin validates_no_dependents

end
