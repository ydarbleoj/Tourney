class NewCourse < ActiveRecord::Base
  has_many :holes
  has_many :scorecards
end
