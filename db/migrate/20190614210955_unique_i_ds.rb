class UniqueIDs < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      add_index(:reviews, [:product_id, :user_id], :unique => true)
    end
  end
end
