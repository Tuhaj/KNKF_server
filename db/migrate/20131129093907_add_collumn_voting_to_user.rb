class AddCollumnVotingToUser < ActiveRecord::Migration
  def change
    add_column :users, :voting_for, :string
  end
end
