class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references  :user_id
      t.references  :product_id
      t.timestamps
    end
  end
end

