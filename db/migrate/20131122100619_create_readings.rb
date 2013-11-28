class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.string :author
      t.string :title
      t.text :description
      t.integer :votes_for
      t.boolean :is_reworked
      t.belongs_to :meeting

      t.timestamps
    end
  end
end
