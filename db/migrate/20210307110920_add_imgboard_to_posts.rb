class AddImgboardToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :imgboard_id, :integer
  end
end
