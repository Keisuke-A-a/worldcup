module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def admin?
    return !current_user.nil? ? @current_user.admin : false

    # if !current_user.nil?
    #   return @current_user.admin
    # else
    #    false
    # end
  end

  def select_loop(str, s)
    if str && str != "none"
      for i in 1..@csv_data.count do
        if @csv_data[i-1][s] == str
          @csv_arry << @csv_data[i-1]
        end
      end
    else
      @csv_arry = @csv_data
    end
    @csv_data = @csv_arry
    @csv_arry = Array.new
  end


  def select_ranking_pool
    select_loop(@pool, 2)
  end
  def select_pool
    select_loop(@pool, 6)
  end

# スケジュールから国を絞る
  def select_country
    if @country && @country != "none"
      for i in 1..@csv_data.count do
        if @csv_data[i-1][7] == @country || @csv_data[i-1][8] == @country
          @csv_arry << @csv_data[i-1]
        end
      end
    else
      @csv_arry = @csv_data
    end
    @csv_data = @csv_arry
    @csv_arry = Array.new
  end

  def select_tv
    case @tv
    when "nhk"
      loop_tv(9)
    when "ntv"
      loop_tv(10)
    else
      @csv_arry = @csv_data
    end
  end

  def loop_tv(s)
    for i in 1..@csv_data.count do
      if @csv_data[i-1][s] == 1
        @csv_arry << @csv_data[i-1]
      end
    end
  end

  def result_pool(results, p)
    results.each do |r|
      @arry = Array.new
      if r.member1 == p || r.member2 == p
        @arry << "A"
      end
    end
  end

  # ポイントを合計する
  def point_count(country)
    points = Result.where(member1: country)
    point = 0
    points.each do |p|
      point += p.point1
    end
    points = Result.where(member2: country)
    points.each do |p|
      point += p.point2
    end
    return point
  end
end
