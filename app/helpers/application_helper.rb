module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def select_place
    case @place
    when '東京'
    end
  end

  def select_tv
    case @tv
    when "nhk"
      loop_tv(7)
    when "ntv"
      loop_tv(8)
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
end
