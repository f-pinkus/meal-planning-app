class RenameMenusTablesToMenus < ActiveRecord::Migration[8.0]
  def change
    rename_table :menus_tables, :menus
  end
end
