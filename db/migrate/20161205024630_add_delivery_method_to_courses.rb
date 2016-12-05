class AddDeliveryMethodToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :deliveryMethod, :string
  end
end
