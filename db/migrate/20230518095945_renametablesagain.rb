class Renametablesagain < ActiveRecord::Migration[7.0]
  def change
    change_table :likes do |t|
    t.rename :user_id, :author_id
    end

    change_table :comments do |t|
    t.rename :user_id, :author_id
    end
  end
end
