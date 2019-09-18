# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# 出力先のログファイルの指定
set :output, 'log/crontab.log'
# ジョブの実行環境の指定
set :environment, :production
# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 15.minute do
#   # command "echo 'tesatdfsafssae'"
#   runner "User.test_mailer"
#   # rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


#
# every 1.day, at: '3:34 pm' do
#   runner 'ApplicationHelper.send_email'
# end
