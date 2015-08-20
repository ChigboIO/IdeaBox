class CreateMembersTable < ActiveRecord::Migration
  def up
    create_table :members do |table|
      table.string  :fullname, null: false
      table.string  :email, null: false
      table.string  :username, null: false
      table.string  :password, null: false
      table.string  :avatar, null: false, default: 'avatar1.png'
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
    drop_table :members
  end
end
