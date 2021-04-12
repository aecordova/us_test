class CreateRealStates < ActiveRecord::Migration[6.0]
  def change
    create_table :real_states do |t|
      t.string :name
      t.integer :property_type
      t.string :street
      t.string :external_number
      t.string :internal_number
      t.string :neighborhood
      t.string :city
      t.string :country
      t.integer :rooms
      t.float :bathrooms
      t.text :comments
      
      t.timestamps
    end
  end
end