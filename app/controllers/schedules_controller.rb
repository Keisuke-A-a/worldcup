class SchedulesController < ApplicationController

  def top

  end
  def index

  end
  
  def country
    @countries = Country.all
    @country = Country.new
  end

  def country_update
    @country = Country.find_by(ranking: params[:country][:ranking])
    @country.name = params[:country][:name]
    if @country.save
      redirect_to schedules_country_path
    else
      flash.now[:danger] = 'false'
      render :country
    end
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
