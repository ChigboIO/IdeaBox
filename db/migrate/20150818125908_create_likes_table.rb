class CreateLikesTable < ActiveRecord::Migration
  def up
    create_table :likes do |table|
      table.string  :liked_by, null: false
      table.string  :idea_id, null: false
      table.timestamps(null: false)
    end
=begin
    Members.create  surname:  	'Test',
                    firstname: 	'User',
                    email: 		'test@localhost.com',
                    phone: 		''
=end
  end

  def down
    drop_table :likes
  end
end
