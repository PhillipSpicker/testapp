class ChangePriceToDecimalInProducts < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :products, :price, :decimal
    end

    def down
      change_column :products, :price, :string
    end
  end
end
