class UsuarioTipo < ActiveRecord::Base

    before_destroy :validates_no_dependents

    validates_uniqueness_of :nombre, :message => 'existe en la base de datos'
    validates_presence_of   :nombre, :message => 'no puede estar vacio'

    # Tipo de relacion
    has_many :usuarios #, :dependent => :destroy Si se usa esto, eliminar un tipo de usuario, elimina los usuarios
    has_and_belongs_to_many :menus, :join_table => 'menu_usuario_tipos'

    # -------------------- Procedimientos de las validaciones ----------------------

    def validates_no_dependents
        if (self.usuarios.count() > 0) or (self.menus.count() > 0)
            errors.add :base, 'El Registro tiene Usuarios/Menu asociados'
            false
        end
    end # Fin validates_no_dependents

end
