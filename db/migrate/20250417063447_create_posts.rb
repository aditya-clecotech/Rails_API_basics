class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      #Ex:- :null => false
      t.text :description

      t.timestamps
    end
  end
end
