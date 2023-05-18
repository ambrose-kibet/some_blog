class Renametables < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
    t.rename :commentscounter, :comments_counter
    t.rename :likescounter, :likes_counter
    end

    change_table :users do |t|
    t.rename :postsCounter, :posts_counter
    end
  end
end
