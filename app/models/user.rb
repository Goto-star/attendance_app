class User < ApplicationRecord
  has_many :attendances, dependent: :destroy
  validates :name, presence: true, length: { maximum: 20 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def today_attendance
    Attendance.where(created_at: Time.zone.today.beginning_of_day..Time.zone.today.end_of_day, user_id: id).first
  end
end
