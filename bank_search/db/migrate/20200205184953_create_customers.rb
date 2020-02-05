class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :bank_type
      t.string :language
      t.string :response
      t.integer :locations

      t.timestamps
    end
  end
end
