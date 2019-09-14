class ResultsController < ApplicationController
  def result
    @results = Result.all
  end

  def pool
    @pool_a = Country.where(pool: "A").map(&:name)
    @results_a = Result.where(pool: "A")
  end
end
