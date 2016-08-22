namespace :books_data do
	desc "Imports Books Data into Database"
		task :books_data, [:filename] => :environment do
	    CSV.foreach('book_data.csv', :headers => true) do |row|
	      Book.create!(row.to_hash)
	    end
	end
end
