class AddDDesignationToDDetails < ActiveRecord::Migration
  def change
    add_column :d_details, :dDesignation, :string
  end
end
