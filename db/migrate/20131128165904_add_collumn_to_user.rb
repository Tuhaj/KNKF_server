class AddCollumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :has_a_vote, :boolean
  end
end
