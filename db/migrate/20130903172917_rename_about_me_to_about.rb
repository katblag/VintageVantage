class RenameAboutMeToAbout < ActiveRecord::Migration
  def change
    rename_column :users, :about_me, :about
  end
end
