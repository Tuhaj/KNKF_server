class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :name
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
