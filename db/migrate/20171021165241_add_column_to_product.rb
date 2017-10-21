class AddColumnToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :user_id, :integer

    Product.update_all(user_id: 1)
  end
end
