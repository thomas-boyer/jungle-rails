class ChangeRatingToReview < ActiveRecord::Migration
  def change
    drop_table :ratings

    create_table :reviews do |t|
      t.integer :product_id
      t.integer :user_id
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
