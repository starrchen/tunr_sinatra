ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :database => "tunr_db"
)

# Fix an issue with sinatra and Active Record where connections are left open
if defined? Sinatra
	after do
	  ActiveRecord::Base.connection.close
	end
end
