class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.reference :invoice_id
      t.integer :credit_card_number
      t.integer :credit_card_expiration_date

      t.timestamps
    end
  end
end
