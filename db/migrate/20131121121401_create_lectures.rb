class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :subject
      t.string :place
      t.text :description
      t.date :lecture_date
      t.string :lecturer

      t.timestamps
    end
  end
end
