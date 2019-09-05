require 'csv'

csv_data = CSV.table('schedule.csv', headers: true)

csv = csv_data.count
csvarry = Array.new
for i in 1..csv do
  if csv_data[i-1][7] == 1
    csvarry << csv_data[i-1][0]
  end
end
p
puts csvarry
