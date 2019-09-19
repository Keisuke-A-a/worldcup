class ResultsController < ApplicationController

  # before_action :require_admin, only: [:input]
  def result
    @results = Result.all.order("id ASC")
  end

  def pool
    # @pools =[]
    # @results = []
    # ["A","B","C","D"].each do |group|
    #   @pools << Country.where(pool: group).map(&:name)
    #   @results << Result.where(pool: group)
    # end
    @pool_a = Country.where(pool: "A").map(&:name)
    @results_a = Result.where(pool: "A")
    @pool_b = Country.where(pool: "B").map(&:name)
    @results_b = Result.where(pool: "B")
    @pool_c = Country.where(pool: "C").map(&:name)
    @results_c = Result.where(pool: "C")
    @pool_d = Country.where(pool: "D").map(&:name)
    @results_d = Result.where(pool: "D")

  end

  def input

  end

  def update
    @result = Result.find(params[:game])
    @result.score1 = params[:score1]
    @result.score2 = params[:score2]
    @result.point1 = params[:point1]
    @result.point2 = params[:point2]
    if @result.save
      redirect_to results_result_path
    else
      render :input
    end
  end

  private
  def require_admin
    unless admin?
      redirect_to schedules_index_path
    end
  end
end
