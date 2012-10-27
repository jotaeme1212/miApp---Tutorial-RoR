class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :login
      t.string :nombre
      t.string :clave
      t.string :email
      t.integer :usuario_tipo_id

      t.timestamps
    end
  end
end
