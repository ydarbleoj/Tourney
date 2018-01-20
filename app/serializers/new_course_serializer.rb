class NewCourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :slope, :rating, :tee, :state, :city, :par, :yardage
  # has_many :tournaments
end
