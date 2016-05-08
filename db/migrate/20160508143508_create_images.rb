class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer  :role
      t.text  :image
      t.references  :product
      t.timestamps
    end
  end
end

