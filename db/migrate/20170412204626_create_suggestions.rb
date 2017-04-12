class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.string :name
      t.boolean :optional
      t.string :purchase_location
      t.integer :purchase_count
      t.string :last_purchase_date

      t.timestamps
    end
  end
end
