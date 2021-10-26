class AddProductIdToImage < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :image_url_id, :integer
    add_column :images, :products_id, :integer
  end
end
