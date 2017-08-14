class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    enable_extension('citext')
    create_table :invoices do |t|
      t.references :customer_id, foreign_key: true
      t.references :merchant_id, foreign_key: true
      t.citext :status

      t.timestamps
    end
  end
end
