class RenameUserNametoEmail < ActiveRecord::Migration
  def change
    rename_column :users, :name, :email
  end
end
