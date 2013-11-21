class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :full_name
      t.string :password
      t.boolean :approves_aplications
      t.boolean :schedules_lectures
      t.boolean :arranges_meetings
      t.boolean :upgrades_users_to_organization_members

      t.timestamps
    end
  end
end
