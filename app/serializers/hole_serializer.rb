class HoleSerializer
  include FastJsonapi::ObjectSerializer
  set_type :hole
  set_id :id

  belongs_to :new_course
  attributes :par, :number, :handicap, :new_course_id, :yards
end