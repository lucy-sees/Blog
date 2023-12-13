class AddAuthorIdToLikes < ActiveRecord::Migration[7.1]
  def change
    add_column :likes, :author_id, :integer
  end
end
