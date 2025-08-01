class DropMenusAndFoods < ActiveRecord::Migration[8.0]
    def up
    drop_table :foods
    drop_table :menus
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
