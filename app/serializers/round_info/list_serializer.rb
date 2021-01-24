module RoundInfo
  class ListSerializer
    include FastJsonapi::ObjectSerializer
    set_type :tournament_round
    set_id :id
    belongs_to :tournament
    belongs_to :new_course

    attributes :round_number, :round_date, :new_course_id

    attribute :slope do |obj|
      obj.new_course.slope
    end

    attribute :rating do |obj|
      obj.new_course.rating
    end

    attribute :name do |obj|
      "#{obj.new_course.name}"
    end

    attribute :par do |obj|
      obj.new_course.par
    end

    attribute :yardage do |obj|
      obj.new_course.yardage
    end
  end
end
