class InitialSchema < ActiveRecord::Migration[7.1]
  def up
    create_table :products do |t|
      t.string :name
      t.string :discount_by_quantity
    end
  end

  def down
    drop_table :products
  end
end
