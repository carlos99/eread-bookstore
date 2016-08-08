namespace :users_data do
	desc "Imports Users Data into Database"
		task :users_data, [:filename] => :environment do
	    CSV.foreach('users.csv', :headers => true) do |row|
	      User.create!(row.to_hash)
	    end
	end
end
