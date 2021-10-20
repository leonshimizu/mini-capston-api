class AddHowManyOfEachProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :how_many, :integer
  end
end
