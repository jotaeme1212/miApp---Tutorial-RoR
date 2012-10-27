class CreateUsuarioTipos < ActiveRecord::Migration
  def change
    create_table :usuario_tipos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
