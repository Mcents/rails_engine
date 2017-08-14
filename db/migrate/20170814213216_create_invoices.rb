class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.reference :customer_id, foreign_key: true
      t.reference :merchant_id, foreign_key: true
      t.citext :status

      t.timestamps
    end
  end
end
