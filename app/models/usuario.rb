class Usuario < ActiveRecord::Base

  validate :clave_valida

  validates_uniqueness_of :login, :message => 'existe en la base de datos'
  validates_presence_of   :login, :nombre, :clave, :message => 'no puede estar vacio'
  validates_length_of     :login, :within => 3..20, :message => 'debe tener entre 3 y 20 caracteres'
  validates_format_of     :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => 'incorrecto'

  def clave_valida
    if self.clave.size < 6
      errors.add(:clave, 'debe debe tener al menos 6 caracteres')
    end
  end

  # Relacion con tablas
  belongs_to :usuario_tipo

end
