class MenuUsuarioTipo < ActiveRecord::Base

  validates_uniqueness_of :menu_id, :scope => :usuario_tipo_id, :message => ' con ese tipo usuario ya existe en la base de datos'

  # Relacion con tablas
  belongs_to :menu
  belongs_to :usuario_tipo
  
end
