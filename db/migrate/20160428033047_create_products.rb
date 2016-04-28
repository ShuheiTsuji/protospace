class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text  :catch_copy
      t.text  :concept
      t.string  :title
      t.timestamps
    end
  end
end
