FactoryGirl.define do
  factory :new_course do

  end

  trait :bandon_dunes do
    name 'Bandon Dunes'
    slope 133
    yardage 6221
    rating 71.4
    tee 'Green'
    state 'Oregon'
    city 'Bandon'
    par 72
    after :create do |new_course|
      new_course.holes.create(number: 1, par: 4, yards: 352, handicap: 13)
      new_course.holes.create(number: 2, par: 3, yards: 155, handicap: 15)
      new_course.holes.create(number: 3, par: 5, yards: 489, handicap: 3)
      new_course.holes.create(number: 4, par: 4, yards: 362, handicap: 5)
      new_course.holes.create(number: 5, par: 4, yards: 400, handicap: 1)
      new_course.holes.create(number: 6, par: 3, yards: 153, handicap: 17)
      new_course.holes.create(number: 7, par: 4, yards: 372, handicap: 7)
      new_course.holes.create(number: 8, par: 4, yards: 342, handicap: 11)
      new_course.holes.create(number: 9, par: 5, yards: 520, handicap: 9)
      new_course.holes.create(number: 10, par: 4, yards: 339, handicap: 8)
      new_course.holes.create(number: 11, par: 4, yards: 351, handicap: 2)
      new_course.holes.create(number: 12, par: 3, yards: 153, handicap: 18)
      new_course.holes.create(number: 13, par: 5, yards: 537, handicap: 6)
      new_course.holes.create(number: 14, par: 4, yards: 332, handicap: 16)
      new_course.holes.create(number: 15, par: 3, yards: 131, handicap: 14)
      new_course.holes.create(number: 16, par: 4, yards: 345, handicap: 10)
      new_course.holes.create(number: 17, par: 4, yards: 375, handicap: 12)
      new_course.holes.create(number: 18, par: 5, yards: 513, handicap: 4)
    end
  end

  trait :pacific_dunes do
    name 'Pacific Dunes'
    yardage 6142
    slope 133
    rating 70.7
    tee 'Green'
    city 'Bandon'
    state 'Oregon'
    par 71
    after :create do |new_course|
      new_course.holes.create(number: 1, par: 4, yards: 304, handicap: 9)
      new_course.holes.create(number: 2, par: 4, yards: 335, handicap: 11)
      new_course.holes.create(number: 3, par: 5, yards: 476, handicap: 7)
      new_course.holes.create(number: 4, par: 4, yards: 449, handicap: 3)
      new_course.holes.create(number: 5, par: 3, yards: 181, handicap: 17)
      new_course.holes.create(number: 6, par: 4, yards: 288, handicap: 13)
      new_course.holes.create(number: 7, par: 4, yards: 436, handicap: 1)
      new_course.holes.create(number: 8, par: 4, yards: 369, handicap: 5)
      new_course.holes.create(number: 9, par: 4, yards: 379, handicap: 15)
      new_course.holes.create(number: 10, par: 3, yards: 163, handicap: 14)
      new_course.holes.create(number: 11, par: 3, yards: 131, handicap: 18)
      new_course.holes.create(number: 12, par: 5, yards: 507, handicap: 6)
      new_course.holes.create(number: 13, par: 4, yards: 390, handicap: 2)
      new_course.holes.create(number: 14, par: 3, yards: 128, handicap: 16)
      new_course.holes.create(number: 15, par: 5, yards: 504, handicap: 10)
      new_course.holes.create(number: 16, par: 4, yards: 338, handicap: 12)
      new_course.holes.create(number: 17, par: 3, yards: 189, handicap: 8)
      new_course.holes.create(number: 18, par: 5, yards: 575, handicap: 4)
    end
  end

  trait :old_mac do
    name 'Old Mac'
    yardage 6320
    slope 125
    rating 71.6
    tee 'Green'
    city 'Bandon'
    state 'Oregon'
    par 71
    after :create do |new_course|
      new_course.holes.create(number: 1, par: 4, yards: 304, handicap: 11)
      new_course.holes.create(number: 2, par: 3, yards: 162, handicap: 15)
      new_course.holes.create(number: 3, par: 4, yards: 345, handicap: 9)
      new_course.holes.create(number: 4, par: 4, yards: 472, handicap: 1)
      new_course.holes.create(number: 5, par: 3, yards: 134, handicap: 17)
      new_course.holes.create(number: 6, par: 5, yards: 520, handicap: 3)
      new_course.holes.create(number: 7, par: 4, yards: 345, handicap: 5)
      new_course.holes.create(number: 8, par: 3, yards: 170, handicap: 13)
      new_course.holes.create(number: 9, par: 4, yards: 352, handicap: 7)
      new_course.holes.create(number: 10, par: 4, yards: 440, handicap: 6)
      new_course.holes.create(number: 11, par: 4, yards: 399, handicap: 4)
      new_course.holes.create(number: 12, par: 3, yards: 205, handicap: 16)
      new_course.holes.create(number: 13, par: 4, yards: 319, handicap: 18)
      new_course.holes.create(number: 14, par: 4, yards: 297, handicap: 14)
      new_course.holes.create(number: 15, par: 5, yards: 482, handicap: 12)
      new_course.holes.create(number: 16, par: 4, yards: 433, handicap: 2)
      new_course.holes.create(number: 17, par: 5, yards: 515, handicap: 10)
      new_course.holes.create(number: 18, par: 4, yards: 426, handicap: 8)
    end
  end

  trait :bandon_trails do
    name 'Bandon Trails'
    yardage 6400
    slope 129
    rating 70.7
    tee 'Green'
    city 'Bandon'
    state 'Oregon'
    par 71
    after :create do |new_course|
      new_course.holes.create(number: 1, par: 4, yards: 356, handicap: 13)
      new_course.holes.create(number: 2, par: 3, yards: 166, handicap: 17)
      new_course.holes.create(number: 3, par: 5, yards: 532, handicap: 3)
      new_course.holes.create(number: 4, par: 4, yards: 363, handicap: 5)
      new_course.holes.create(number: 5, par: 3, yards: 124, handicap: 15)
      new_course.holes.create(number: 6, par: 4, yards: 359, handicap: 9)
      new_course.holes.create(number: 7, par: 4, yards: 406, handicap: 7)
      new_course.holes.create(number: 8, par: 4, yards: 299, handicap: 11)
      new_course.holes.create(number: 9, par: 5, yards: 522, handicap: 1)
      new_course.holes.create(number: 10, par: 4, yards: 393, handicap: 10)
      new_course.holes.create(number: 11, par: 4, yards: 429, handicap: 4)
      new_course.holes.create(number: 12, par: 3, yards: 235, handicap: 18)
      new_course.holes.create(number: 13, par: 4, yards: 374, handicap: 12)
      new_course.holes.create(number: 14, par: 4, yards: 306, handicap: 14)
      new_course.holes.create(number: 15, par: 4, yards: 367, handicap: 8)
      new_course.holes.create(number: 16, par: 5, yards: 494, handicap: 2)
      new_course.holes.create(number: 17, par: 3, yards: 159, handicap: 16)
      new_course.holes.create(number: 18, par: 4, yards: 363, handicap: 6)
    end
  end
end
