class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :workouts

  validates :name, presence: true, length: {minimum: 1}

  scope :active, -> {where('last_sign_in_at > ?', Date.today - 60.days)}
  scope :sorted, -> {order('total_reps DESC')}

  def last_workout
    l = workouts.last
    l ? l.created_at : nil
  end

  def self.top_ten_all_time
    sorted.take(10)
  end

  def self.top_ten_active
    active.sorted.take(10)
  end
end
