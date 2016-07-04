class AddReferenceToPublications < ActiveRecord::Migration
  def change
    add_reference :publications, :book, index: true, foreign_key: true
  end
end
