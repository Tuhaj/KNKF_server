class AddCollumnMadeByToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :made_by, :string
  end
end
