class AddColumnToReading < ActiveRecord::Migration
  def change
    add_column :readings, :recomended_by, :string
  end
end
