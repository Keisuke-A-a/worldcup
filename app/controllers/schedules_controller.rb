class SchedulesController < ApplicationController

  def top

  end
  def index

  end

  def ranking

  end
  def selectranking
    @pool = params[:pool]
  end

  def select
    @pool = params[:pool]
    @country = params[:country]
    @tv = params[:tv]
  end

  def result
    @result = Result.all
  end
  # def send
  #   ScheduleMailer.send_starttime_before(User.second, "日本").deliver
  # end
end
