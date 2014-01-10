class AddCollumnReadingToNote < ActiveRecord::Migration
  def change
    add_reference :notes, :reading, index: true
  end
end
