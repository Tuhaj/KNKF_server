class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.text :abstract
      t.text :description
      t.string :author_full_name
      t.boolean :approved
      t.boolean :membership
      t.references :user, index: true

      t.timestamps
    end
  end
end
