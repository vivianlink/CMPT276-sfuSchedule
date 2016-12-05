class AddDeliveryMethodToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :deliveryMethod, :string
  end
end
