class Addnameuser < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
    t.rename :author_id,:user_id
    end
  end
end
