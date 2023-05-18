class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.timestamps
      t.integer :commentscounter
      t.integer :likescounter
    end
  end
end
