class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.boolean :membership
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
