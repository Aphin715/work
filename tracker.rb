#!/usr/bin/env ruby

require 'csv'

#balance starts at 0.00
balance = 0.0
income = 0.0
expenses = 0.0
overdrafts = 0

overdraft_transactions = []

CSV.foreach('transactions.csv', headers: true) do |row|
  amount = row[1].to_f
if amount > 0
  income += amount
else
  expenses += amount
end

  balance += amount

  if balance < 0
    balance -=20
overdrafts += 20
overdraft_transactions << (row << balance.round(2).to_s)

end



end

#if balance drops below zero charge an over draft fee of 20 dollars



#Print ending balance
puts "Ending Balance: #{balance}"

#print total income
puts "Total Income: #{income}"
#print total expenses

puts "Total Expenses: #{expenses}"
#print total overdraft fees
puts "Total Overdraft Charges: #{overdrafts}"

puts "Overdrafts (balance, expense, description, date)"

overdraft_transactions.each do |transaction|

puts transaction[3] + "," + transaction[1] + ","  + transaction[2] + "," + transaction[0]
end

#{overdraft_transactions}"
