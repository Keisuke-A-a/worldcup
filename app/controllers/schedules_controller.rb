class SchedulesController < ApplicationController

  def index

  end

  def ranking
  end
  
  def select
    @tv = params[:tv]
  end
end
