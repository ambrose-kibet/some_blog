class AddDefaultCommentsCounterToTableName < ActiveRecord::Migration[7.0]
  def change
    change_table :likes do |t|
    t.rename  :author_id, :user_id
    end

    change_table :comments do |t|
    t.rename :author_id, :user_id
    end
   
    change_column_default :posts, :comments_counter, from: nil, to: 0
    change_column_default :posts, :likes_counter, from: nil, to: 0
  
  end
end
