class ScheduleMailer < ApplicationMailer

  def send_starttime_before(user, schedule)
    @user = user
    @schedule = schedule
    mail to: user.email, subject: "#{schedule[6]}対#{schedule[7]} 試合開始１時間前です"
  end
end
