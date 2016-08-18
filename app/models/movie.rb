class Movie < ApplicationRecord
  has_many :reviews

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: { only_integer: true }
  validates :description, presence: true
  validates :image, presence: true
  validates :release_date, presence: true

  validate :release_date_is_in_the_past

  def review_average
    if reviews.size!=0
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end 

  def self.search(title, director)
    where("title like ? or director like ?", "%#{title}%", "%#{director}%")
  end 


  def self.duration_less_than_90 
    where("runtime_in_minutes < ?", 90) 
  end

  def self.duration_90_to_120
    where("runtime_in_minutes in (?)", 90..120)
  end

  def self.duration_more_than_120
    where("runtime_in_minutes > ?", 120)
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end 
  end 
end
