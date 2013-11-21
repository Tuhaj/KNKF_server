class CreateLecturesUsers < ActiveRecord::Migration
  def change
    create_table :lectures_users do |t|
      t.references :lecture, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
