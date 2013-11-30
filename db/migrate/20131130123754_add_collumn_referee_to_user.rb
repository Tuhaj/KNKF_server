class AddCollumnRefereeToUser < ActiveRecord::Migration
  def change
    add_column :users, :referee, :boolean
  end
end
