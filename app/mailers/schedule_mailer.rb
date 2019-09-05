class ScheduleMailer < ApplicationMailer

  def send_starttime_is_now(user, schedule)
    @user = user
    @schedule = schedule
    mail to: user.email, subject: '試合開始１時間前です'
  end
end
