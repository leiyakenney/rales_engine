class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :invoice
      t.string :credit_card_number
      t.string :credit_card_expiration_date
      t.string :result

      t.timestamps
    end
  end
end
