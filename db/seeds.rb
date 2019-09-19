User.create!(name:  "Admin User",
             email: "admin@admin.com",
             password:              "aaaa1111",
             password_confirmation: "aaaa1111",
             activated: true,
             admin: true,
             activated_at: Time.zone.now)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#               email: email,
#               password:              password,
#               password_confirmation: password,
#               activated: true,
#               activated_at: Time.zone.now)
# end


# require "csv"
# CSV.foreach('db/result.csv', headers: true) do |row|
#   Result.create!(game: row['game'],
#                  member1: row['member1'],
#                  member2: row['member2'],
#                  score1: row['score1'],
#                  score2: row['score2'],
#                  pool: row['pool'],
#                  point1: row['point1'],
#                  point2: row['point2']
#                 )
# end

# CSV.foreach('db/ranking.csv', headers: true) do |row|
#   Country.create(name: row['country'],
#                  pool: row['pool'],
#                  ranking: row['ranking'])
# end
