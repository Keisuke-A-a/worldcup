require 'csv'
class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
  # validates :password, length: { in: 8..32 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i }

  attr_accessor :activation_token
  before_create :create_activation_digest

  has_secure_password

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # トークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  @csv_data = CSV.table('app/views/schedules/schedule.csv', headers: true)

  # メールを送信するメソッド
  def self.test_mailer
    time = Time.now
    for i in 0..47 do
      if time.strftime("%m") == ('%02d' % @csv_data[i][1])
        if time.strftime("%d") == ('%02d' % @csv_data[i][2])
          if time.strftime("%H:%M") == @csv_data[i][4]
            User.all.each do |user|
              ScheduleMailer.send_starttime_before(user, @csv_data[i]).deliver
            end
          end
        end
      end
    end
  end

  private
  # 有効化トークンとダイジェストを作成及び代入する
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
