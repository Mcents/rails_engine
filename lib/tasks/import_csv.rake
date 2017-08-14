# require 'csv'
#
# namespace :import_csv do
#
#   csv_text = File.read('./data/customers.csv')
#   csv = CSV.parse(csv_text, :headers => true)
#   csv.each do |row|
#     Customer.create!(row.to_hash)
#   end
#
#   csv_text = File.read('./data/invoice_items.csv')
#   csv = CSV.parse(csv_text, :headers => true)
#   csv.each do |row|
#     InvoiceItem.create!(row.to_hash)
#   end
#
#   csv_text = File.read('./data/items.csv')
#   csv = CSV.parse(csv_text, :headers => true)
#   csv.each do |row|
#     Item.create!(row.to_hash)
#   end
#
#   csv_text = File.read('./data/invoices.csv')
#   csv = CSV.parse(csv_text, :headers => true)
#   csv.each do |row|
#     Invoice.create!(row.to_hash)
#   end
#
#   csv_text = File.read('./data/merchants.csv')
#   csv = CSV.parse(csv_text, :headers => true)
#   csv.each do |row|
#     Merchant.create!(row.to_hash)
#   end
#
#   csv_text = File.read('./data/transactions.csv')
#   csv = CSV.parse(csv_text, :headers => true)
#   csv.each do |row|
#     Transaction.create!(row.to_hash)
#   end
#
#   task all: [:customers, :invoice_items, :invoices, :items, :merchants, :transactions]
# end
