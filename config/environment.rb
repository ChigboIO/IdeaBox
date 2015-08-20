configure :production, :development do
=begin
 db = URI.parse(ENV['DATABASE_URL'] || 'mysql://root:@localhost:3306/ideabox_db')

 ActiveRecord::Base.establish_connection(
     :adapter => db.scheme == 'mysql' ? 'mysql2' : db.scheme,
     :host     => db.host,
     :username => db.user,
     :password => db.password,
     :database => db.path[1..-1],
     :encoding => 'utf8'
 )
=end

#### I can delete the database file with this following method

 ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "",
  :database => "ideabox_db"
  :encoding	=> "utf8"
)

end