class CreateMeetingsUsers < ActiveRecord::Migration
  def change
    create_table :meetings_users do |t|
      t.references :meeting, index: true
      t.references :user, index: true
      
      
      t.timestamps
    end
  end
end
