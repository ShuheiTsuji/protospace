class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer  :role
      t.text  :image
      t.references  :product_id
      t.timestamps
    end
  end
end

