class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.references :customer
      t.references :merchant
      t.string :status

      t.timestamps
    end
  end
end
