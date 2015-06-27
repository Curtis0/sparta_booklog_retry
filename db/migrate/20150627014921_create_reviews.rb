class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
      add_index :reviews, [:user_id, :book_id], unique: true
    #this allows for only one review to be written by one user for each book.
    #Ask Nashiro san what he was saying about why we need to put this code in before ________. I dont know what he said it is before and why.
  end
end
