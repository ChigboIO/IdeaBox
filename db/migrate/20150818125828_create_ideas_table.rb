class CreateIdeasTable < ActiveRecord::Migration
  def up
    create_table :ideas do |table|
      table.string  :title, null: false
      table.text	:description, null: true
      table.string  :created_by, null: false
      table.integer  :likes, null: false, default: 0
      table.timestamps(null: false)
    end
=begin
    Ideas.create  surname:  	'Test',
                    firstname: 	'User',
                    email: 		'test@localhost.com',
                    phone: 		''
=end
  end

  def down
    drop_table :ideas
  end
end
