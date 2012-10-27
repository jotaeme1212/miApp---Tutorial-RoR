class CreateMenuUsuarioTipos < ActiveRecord::Migration
  def change
    create_table :menu_usuario_tipos do |t|
      t.integer :menu_id
      t.integer :usuario_tipo_id

      t.timestamps
    end
  end
end
