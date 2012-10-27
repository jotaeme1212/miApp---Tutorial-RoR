class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :nombre
      t.string :url
      t.string :controller
      t.string :action
      t.string :icono
      t.integer :padre
      t.integer :orden

      t.timestamps
    end
  end
end
