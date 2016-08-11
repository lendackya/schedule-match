class Course < ApplicationRecord
  belongs_to :user

  validates :starts_time, :ends_time, :user_id, :name, presence: true

end
