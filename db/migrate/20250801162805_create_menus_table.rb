class CreateMenusTable < ActiveRecord::Migration[8.0]
  def change
    create_table :menus_tables do |t|
      t.string :title
      t.text :foods

      t.timestamps
    end
  end
end
