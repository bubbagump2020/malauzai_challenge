class CreateCustomerSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :customer_searches do |t|
      t.belongs_to :customer
      t.string :name
      t.string :latitude
      t.string :longitude
      
      t.timestamps
    end
  end
end
