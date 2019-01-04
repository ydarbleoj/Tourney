class NewCourseSerializer
  include FastJsonapi::ObjectSerializer
  set_type :new_course
  set_id :id

  attributes :name, :par, :slope, :rating, :tee
end
