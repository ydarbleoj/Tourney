# joel = User.create!(username: 'Joel Brady', handicap: 7.6, email: 'brady.joel@gmail.com', password: 'gonzaga2004', password_confirmation: 'gonzaga2004', admin: true)
# bryan = User.create!(username: 'Bryan Hellum', handicap: 8, email: 'bhellum@gmail.com', password: 'hellum1234', password_confirmation: 'hellum1234')
# payne = User.create!(username: 'Mike Payne', handicap: 14, email: 'michaeljamespayne@yahoo.com', password: 'payne1234', password_confirmation: 'payne1234')
# cory = User.create!(username: 'Cory Booth', handicap: 21, email: 'coryjbooth@gmail.com', password: 'booth1234', password_confirmation: 'booth1234')
# jack = User.create!(username: 'Jack Weast', handicap: 25, email: 'jack.weast@intel.com', password: 'weast1234', password_confirmation: 'weast1234')
# damon = User.create!(username: 'Damon Sullivan', handicap: 36, email: 'damon.sullivan@thugdesign.com', password: 'sullivan1234', password_confirmation: 'sullivan1234')
# pat = User.create!(username: 'Pat Anderson', handicap: 36, email: 'patrick.edward.anderson@gmail.com', password: 'anderson1234', password_confirmation: 'anderson1234')
# robb = User.create!(username: 'Robb Page', handicap: 6.5, email: 'theswine19@gmail.com', password: 'page1234', password_confirmation: 'page1234')
# scott = User.create!(username: 'Scott Kovesdy', handicap: 5.6, email: 'skovesdy@msn.com', password: 'kovesdy1234', password_confirmation: 'kovesdy1234')
# rory = User.create!(username: 'Rory Tarquinio', handicap: n, email: 'rtarquinio10@gmail.com', password: 'tarquinio1234', password_confirmation: 'tarquinio1234')
# albino = User.create!(username: 'Albino Duran', handicap: 14, email: 'albino.duran@verizon.com', password: 'duran1234', password_confirmation: 'duran1234')
# greg = User.create!(username: 'Greg Smith', handicap: 23, email: 'grs@yurik.net', password: 'smith1234', password_confirmation: 'smith1234')
# rich = User.create!(username: 'Rich Guisti', handicap: nil, email: 'rich.giusti@masergy.com', password: 'guisti1234', password_confirmation: 'guisti1234')
# dan = User.create!(username: 'Dan Jablonski', handicap: 18, email: 'daniel.jablonski@verizon.com', password: 'jablonski1234', password_confirmation: 'jablonski1234')
# eric = User.create!(username: 'Eric Fox', handicap: nil, email: 'theazfoxes@mac.com', password: 'fox12345', password_confirmation: 'fox12345')
# matt = User.create!(username: 'Matt James', handicap: nil, email: 'mjiggity@gmail.com', password: 'james1234', password_confirmation: 'james1234')
# jeremy = User.create!(username: 'Jeremy Emerson', handicap: 14, email: 'jeremy@wrightstrategies.com', password: 'emerson1234', password_confirmation: 'emerson1234')
# david = User.create!(username: 'David Sanda', handicap: 21.8, email: 'david.sanda@verizon.com', password: 'sanda1234', password_confirmation: 'sanda1234')
# payne = User.where(email: 'michaeljamespayne@yahoo.com').first
# bandon = Course.create!(par: 72, yardage: 6221, name: 'Bandon Dunes', rating: 71.4, slope: 133, tee: 'Green', city: 'Bandon', state: 'Oregon',
# 		h1_yds: 352, h1_par: 4, h1_hcap: 13, h2_yds: 155, h2_par: 3, h2_hcap: 15, h3_yds: 489, h3_par: 5, h3_hcap: 3,
# 	  h4_yds: 362, h4_par: 4, h4_hcap: 5, h5_yds: 400, h5_par: 4, h5_hcap: 1, h6_yds: 153, h6_par: 3, h6_hcap: 17,
# 		h7_yds: 372, h7_par: 4, h7_hcap: 7, h8_yds: 342, h8_par: 4, h8_hcap: 11,
# 	  h9_yds: 520, h9_par: 5, h9_hcap: 9,
#     out_yds: 3145, out_par: 36,
#     h10_yds: 339, h10_par: 4, h10_hcap: 8,
# 		h11_yds: 351, h11_par: 4, h11_hcap: 2,
# 		h12_yds: 153, h12_par: 3, h12_hcap: 18,
# 		h13_yds: 537, h13_par: 5, h13_hcap: 6,
# 		h14_yds: 332, h14_par: 4, h14_hcap: 16,
# 		h15_yds: 131, h15_par: 3, h15_hcap: 14,
# 		h16_yds: 345, h16_par: 4, h16_hcap: 10,
# 		h17_yds: 375, h17_par: 4, h17_hcap: 12,
# 		h18_yds: 513, h18_par: 5, h18_hcap: 4,
# 		in_yds: 3076, in_par: 36 )
# bandon_dunes = NewCourse.create(name: 'Bandon Dunes', slope: 133, rating: 71.4, tee: 'Green', state: 'Oregon', city: 'Bandon', par: 72)
# bandon_dunes.holes.create(number: 1, par: 4, yards: 352, handicap: 13)
# bandon_dunes.holes.create(number: 2, par: 3, yards: 155, handicap: 15)
# bandon_dunes.holes.create(number: 3, par: 5, yards: 489, handicap: 3)
# bandon_dunes.holes.create(number: 4, par: 4, yards: 362, handicap: 5)
# bandon_dunes.holes.create(number: 5, par: 4, yards: 400, handicap: 1)
# bandon_dunes.holes.create(number: 6, par: 3, yards: 153, handicap: 17)
# bandon_dunes.holes.create(number: 7, par: 4, yards: 372, handicap: 7)
# bandon_dunes.holes.create(number: 8, par: 4, yards: 342, handicap: 11)
# bandon_dunes.holes.create(number: 9, par: 5, yards: 520, handicap: 9)
# bandon_dunes.holes.create(number: 10, par: 4, yards: 339, handicap: 8)
# bandon_dunes.holes.create(number: 11, par: 4, yards: 351, handicap: 2)
# bandon_dunes.holes.create(number: 12, par: 3, yards: 153, handicap: 18)
# bandon_dunes.holes.create(number: 13, par: 5, yards: 537, handicap: 6)
# bandon_dunes.holes.create(number: 14, par: 4, yards: 332, handicap: 16)
# bandon_dunes.holes.create(number: 15, par: 3, yards: 131, handicap: 14)
# bandon_dunes.holes.create(number: 16, par: 4, yards: 345, handicap: 10)
# bandon_dunes.holes.create(number: 17, par: 4, yards: 375, handicap: 12)
# bandon_dunes.holes.create(number: 18, par: 5, yards: 513, handicap: 4)

# pacific = Course.create!(par: 71, yardage: 6142, name: 'Pacific Dunes', rating: 70.7, slope: 133, tee: 'Green', city: 'Bandon', state: 'Oregon',
# 		h1_yds: 304, h1_par: 4, h1_hcap: 9,
# 	  h2_yds: 335, h2_par: 4, h2_hcap: 11,
# 		h3_yds: 476, h3_par: 5, h3_hcap: 7,
# 	  h4_yds: 449, h4_par: 4, h4_hcap: 3,
# 	  h5_yds: 181, h5_par: 3, h5_hcap: 17,
#     h6_yds: 288, h6_par: 4, h6_hcap: 13,
# 		h7_yds: 436, h7_par: 4, h7_hcap: 1,
# 		h8_yds: 369, h8_par: 4, h8_hcap: 5,
# 	  h9_yds: 379, h9_par: 4, h9_hcap: 15,
#     out_yds: 3217, out_par: 36,
#     h10_yds: 163, h10_par: 3, h10_hcap: 14,
# 		h11_yds: 131, h11_par: 3, h11_hcap: 18,
# 		h12_yds: 507, h12_par: 5, h12_hcap: 6,
# 		h13_yds: 390, h13_par: 4, h13_hcap: 2,
# 		h14_yds: 128, h14_par: 3, h14_hcap: 16,
# 		h15_yds: 504, h15_par: 5, h15_hcap: 10,
# 		h16_yds: 338, h16_par: 4, h16_hcap: 12,
# 		h17_yds: 189, h17_par: 3, h17_hcap: 8,
# 		h18_yds: 575, h18_par: 5, h18_hcap: 4,
# 		in_yds: 2925, in_par: 35 )
# pacific_dunes = NewCourse.create(name: 'Pacific Dunes', slope: 133, rating: 70.7, tee: 'Green', state: 'Oregon', city: 'Bandon', par: 71)
# pacific_dunes.holes.create(number: 1, par: 4, yards: 304, handicap: 9)
# pacific_dunes.holes.create(number: 2, par: 4, yards: 335, handicap: 11)
# pacific_dunes.holes.create(number: 3, par: 5, yards: 476, handicap: 7)
# pacific_dunes.holes.create(number: 4, par: 4, yards: 449, handicap: 3)
# pacific_dunes.holes.create(number: 5, par: 3, yards: 181, handicap: 17)
# pacific_dunes.holes.create(number: 6, par: 4, yards: 288, handicap: 13)
# pacific_dunes.holes.create(number: 7, par: 4, yards: 436, handicap: 1)
# pacific_dunes.holes.create(number: 8, par: 4, yards: 369, handicap: 5)
# pacific_dunes.holes.create(number: 9, par: 4, yards: 379, handicap: 15)
# pacific_dunes.holes.create(number: 10, par: 3, yards: 163, handicap: 14)
# pacific_dunes.holes.create(number: 11, par: 3, yards: 131, handicap: 18)
# pacific_dunes.holes.create(number: 12, par: 5, yards: 507, handicap: 6)
# pacific_dunes.holes.create(number: 13, par: 4, yards: 390, handicap: 2)
# pacific_dunes.holes.create(number: 14, par: 3, yards: 128, handicap: 16)
# pacific_dunes.holes.create(number: 15, par: 5, yards: 504, handicap: 10)
# pacific_dunes.holes.create(number: 16, par: 4, yards: 338, handicap: 12)
# pacific_dunes.holes.create(number: 17, par: 3, yards: 189, handicap: 8)
# pacific_dunes.holes.create(number: 18, par: 5, yards: 575, handicap: 4)
# trails = Course.create!(par: 71, yardage: 6247, name: 'Bandon Trails', rating: 71.1, slope: 129, tee: 'Green', city: 'Bandon', state: 'Oregon',
# 		h1_yds: 356, h1_par: 4, h1_hcap: 13,
# 	  h2_yds: 166, h2_par: 3, h2_hcap: 17,
# 		h3_yds: 532, h3_par: 5, h3_hcap: 3,
# 	  h4_yds: 363, h4_par: 4, h4_hcap: 5,
# 	  h5_yds: 124, h5_par: 3, h5_hcap: 15,
#     h6_yds: 359, h6_par: 4, h6_hcap: 9,
# 		h7_yds: 406, h7_par: 4, h7_hcap: 7,
# 		h8_yds: 299, h8_par: 4, h8_hcap: 11,
# 	  h9_yds: 522, h9_par: 5, h9_hcap: 1,
#     out_yds: 3127, out_par: 36,
#     h10_yds: 393, h10_par: 4, h10_hcap: 10,
# 		h11_yds: 429, h11_par: 4, h11_hcap: 4,
# 		h12_yds: 235, h12_par: 3, h12_hcap: 18,
# 		h13_yds: 374, h13_par: 4, h13_hcap: 12,
# 		h14_yds: 306, h14_par: 4, h14_hcap: 14,
# 		h15_yds: 367, h15_par: 4, h15_hcap: 8,
# 		h16_yds: 494, h16_par: 5, h16_hcap: 2,
# 		h17_yds: 159, h17_par: 3, h17_hcap: 16,
# 		h18_yds: 363, h18_par: 4, h18_hcap: 6,
# 		in_yds: 3120, in_par: 35 )
# tr = NewCourse.create(name: 'Bandon Trails', slope: 129, rating: 70.7, tee: 'Green', state: 'Oregon', city: 'Bandon', par: 71)
# tr.holes.create(number: 1, par: 4, yards: 356, handicap: 13)
# tr.holes.create(number: 2, par: 3, yards: 166, handicap: 17)
# tr.holes.create(number: 3, par: 5, yards: 532, handicap: 3)
# tr.holes.create(number: 4, par: 4, yards: 363, handicap: 5)
# tr.holes.create(number: 5, par: 3, yards: 124, handicap: 15)
# tr.holes.create(number: 6, par: 4, yards: 359, handicap: 9)
# tr.holes.create(number: 7, par: 4, yards: 406, handicap: 7)
# tr.holes.create(number: 8, par: 4, yards: 299, handicap: 11)
# tr.holes.create(number: 9, par: 5, yards: 522, handicap: 1)
# tr.holes.create(number: 10, par: 4, yards: 393, handicap: 10)
# tr.holes.create(number: 11, par: 4, yards: 429, handicap: 4)
# tr.holes.create(number: 12, par: 3, yards: 235, handicap: 18)
# tr.holes.create(number: 13, par: 4, yards: 374, handicap: 12)
# tr.holes.create(number: 14, par: 4, yards: 306, handicap: 14)
# tr.holes.create(number: 15, par: 4, yards: 367, handicap: 8)
# tr.holes.create(number: 16, par: 5, yards: 494, handicap: 2)
# tr.holes.create(number: 17, par: 3, yards: 159, handicap: 16)
# tr.holes.create(number: 18, par: 4, yards: 363, handicap: 6)
# old_mac = Course.create(par: 71, yardage: 6320, name: 'Old Mac', rating: 71.6, slope: 125, tee: 'Green', city: 'Bandon', state: 'Oregon',
# 		h1_yds: 304, h1_par: 4, h1_hcap: 11,
# 	  h2_yds: 162, h2_par: 3, h2_hcap: 15,
# 		h3_yds: 345, h3_par: 4, h3_hcap: 9,
# 	  h4_yds: 472, h4_par: 4, h4_hcap: 1,
# 	  h5_yds: 134, h5_par: 3, h5_hcap: 17,
#     h6_yds: 520, h6_par: 5, h6_hcap: 3,
# 		h7_yds: 345, h7_par: 4, h7_hcap: 5,
# 		h8_yds: 170, h8_par: 3, h8_hcap: 13,
# 	  h9_yds: 352, h9_par: 4, h9_hcap: 7,
#     out_yds: 2804, out_par: 34,
#     h10_yds: 440, h10_par: 4, h10_hcap: 6,
# 		h11_yds: 399, h11_par: 4, h11_hcap: 4,
# 		h12_yds: 205, h12_par: 3, h12_hcap: 16,
# 		h13_yds: 319, h13_par: 4, h13_hcap: 18,
# 		h14_yds: 297, h14_par: 4, h14_hcap: 14,
# 		h15_yds: 482, h15_par: 5, h15_hcap: 12,
# 		h16_yds: 433, h16_par: 4, h16_hcap: 2,
# 		h17_yds: 515, h17_par: 5, h17_hcap: 10,
# 		h18_yds: 426, h18_par: 4, h18_hcap: 8,
# 		in_yds: 3516, in_par: 37 )
# mac = NewCourse.create(name: 'Old Mac', slope: 125, rating: 71.6, tee: 'Green', state: 'Oregon', city: 'Bandon', par: 71)
# mac.holes.create(number: 1, par: 4, yards: 304, handicap: 11)
# mac.holes.create(number: 2, par: 3, yards: 162, handicap: 15)
# mac.holes.create(number: 3, par: 4, yards: 345, handicap: 9)
# mac.holes.create(number: 4, par: 4, yards: 472, handicap: 1)
# mac.holes.create(number: 5, par: 3, yards: 134, handicap: 17)
# mac.holes.create(number: 6, par: 5, yards: 520, handicap: 3)
# mac.holes.create(number: 7, par: 4, yards: 345, handicap: 5)
# mac.holes.create(number: 8, par: 3, yards: 170, handicap: 13)
# mac.holes.create(number: 9, par: 4, yards: 352, handicap: 7)
# mac.holes.create(number: 10, par: 4, yards: 440, handicap: 6)
# mac.holes.create(number: 11, par: 4, yards: 399, handicap: 4)
# mac.holes.create(number: 12, par: 3, yards: 205, handicap: 16)
# mac.holes.create(number: 13, par: 4, yards: 319, handicap: 18)
# mac.holes.create(number: 14, par: 4, yards: 297, handicap: 14)
# mac.holes.create(number: 15, par: 5, yards: 482, handicap: 12)
# mac.holes.create(number: 16, par: 4, yards: 433, handicap: 2)
# mac.holes.create(number: 17, par: 5, yards: 515, handicap: 10)
# mac.holes.create(number: 18, par: 4, yards: 426, handicap: 8)
# bandon_2016 = Tournament.create!(name: 'Bandon', year: 2016, num_players: 16, num_rounds: 3,
# 														 end_date: DateTime.new(2016, 3, 19,18,00,00))
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: payne.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: cory.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: jack.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: robb.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: scott.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: eric.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: rory.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: rich.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: albino.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: dan.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: greg.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: matt.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: joel.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: bryan.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: damon.id)
# Leaderboard.create!(tournament_id: bandon_2016.id, user_id: pat.id)
#
# # Round One
# fri = DateTime.new(2016, 3, 17)
# fri_first = DateTime.new(2016, 3, 17, 9, 40, 00)
# fri_sec = DateTime.new(2016, 3, 17, 9, 50, 00)
# fri_third = DateTime.new(2016, 3, 17, 10, 00, 00)
# fri_fourth = DateTime.new(2016, 3, 17, 10, 10, 00)
# # First
# payne.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_first.strftime("%F"), tee_time: fri_first.strftime("%H:%M"))
# cory.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_first.strftime("%F"), tee_time: fri_first.strftime("%H:%M"))
# jack.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_first.strftime("%F"), tee_time: fri_first.strftime("%H:%M"))
# robb.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_first.strftime("%F"), tee_time: fri_first.strftime("%H:%M"))
# # Second
# scott.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_sec.strftime("%F"), tee_time: fri_sec.strftime("%H:%M"))
# eric.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_sec.strftime("%F"), tee_time: fri_sec.strftime("%H:%M"))
# rory.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_sec.strftime("%F"), tee_time: fri_sec.strftime("%H:%M"))
# rich.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_sec.strftime("%F"), tee_time: fri_sec.strftime("%H:%M"))
# # Third
# albino.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_third.strftime("%F"), tee_time: fri_third.strftime("%H:%M"))
# dan.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_third.strftime("%F"), tee_time: fri_third.strftime("%H:%M"))
# greg.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_third.strftime("%F"), tee_time: fri_third.strftime("%H:%M"))
# matt.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_third.strftime("%F"), tee_time: fri_third.strftime("%H:%M"))
# # Fourth
# joel.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_fourth.strftime("%F"), tee_time: fri_fourth.strftime("%H:%M"))
# bryan.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_fourth.strftime("%F"), tee_time: fri_fourth.strftime("%H:%M"))
# damon.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_fourth.strftime("%F"), tee_time: fri_fourth.strftime("%H:%M"))
# pat.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
# 	                 date_played: fri_fourth.strftime("%F"), tee_time: fri_fourth.strftime("%H:%M"))
#
# # Round Two
# sat = DateTime.new(2016, 3, 18)
# sat_first = DateTime.new(2016, 3, 18, 10, 10, 00)
# sat_sec = DateTime.new(2016, 3, 18, 10, 20, 00)
# sat_third = DateTime.new(2016, 3, 18, 10, 30, 00)
# sat_fourth = DateTime.new(2016, 3, 18, 10, 40, 00)
# # First
# payne.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_first.strftime("%F"), tee_time: sat_first.strftime("%H:%M"))
# cory.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_first.strftime("%F"), tee_time: sat_first.strftime("%H:%M"))
# jack.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_first.strftime("%F"), tee_time: sat_first.strftime("%H:%M"))
# robb.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_first.strftime("%F"), tee_time: sat_first.strftime("%H:%M"))
# # Second
# scott.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_sec.strftime("%F"), tee_time: sat_sec.strftime("%H:%M"))
# eric.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_sec.strftime("%F"), tee_time: sat_sec.strftime("%H:%M"))
# rory.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_sec.strftime("%F"), tee_time: sat_sec.strftime("%H:%M"))
# rich.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_sec.strftime("%F"), tee_time: sat_sec.strftime("%H:%M"))
# # Third
# albino.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_third.strftime("%F"), tee_time: sat_third.strftime("%H:%M"))
# dan.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_third.strftime("%F"), tee_time: sat_third.strftime("%H:%M"))
# greg.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_third.strftime("%F"), tee_time: sat_third.strftime("%H:%M"))
# matt.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_third.strftime("%F"), tee_time: sat_third.strftime("%H:%M"))
# # Fourth
# joel.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_fourth.strftime("%F"), tee_time: sat_fourth.strftime("%H:%M"))
# bryan.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_fourth.strftime("%F"), tee_time: sat_fourth.strftime("%H:%M"))
# damon.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_fourth.strftime("%F"), tee_time: sat_fourth.strftime("%H:%M"))
# pat.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
# 	                 date_played: sat_fourth.strftime("%F"), tee_time: sat_fourth.strftime("%H:%M"))
#
# # Round Three
# sun = DateTime.new(2016, 3, 19)
# sun_first = DateTime.new(2016, 3, 19, 10, 20, 00)
# sun_sec = DateTime.new(2016, 3, 19, 10, 30, 00)
# sun_third = DateTime.new(2016, 3, 19, 10, 40, 00)
# sun_fourth = DateTime.new(2016, 3, 19, 10, 50, 00)
# # First
# payne.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_first.strftime("%F"), tee_time: sun_first.strftime("%H:%M"))
# cory.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_first.strftime("%F"), tee_time: sun_first.strftime("%H:%M"))
# jack.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_first.strftime("%F"), tee_time: sun_first.strftime("%H:%M"))
# robb.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_first.strftime("%F"), tee_time: sun_first.strftime("%H:%M"))
# # Second
# scott.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_sec.strftime("%F"), tee_time: sun_sec.strftime("%H:%M"))
# eric.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_sec.strftime("%F"), tee_time: sun_sec.strftime("%H:%M"))
# rory.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_sec.strftime("%F"), tee_time: sun_sec.strftime("%H:%M"))
# rich.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_sec.strftime("%F"), tee_time: sun_sec.strftime("%H:%M"))
# # Third
# albino.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_third.strftime("%F"), tee_time: sun_third.strftime("%H:%M"))
# dan.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_third.strftime("%F"), tee_time: sun_third.strftime("%H:%M"))
# greg.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_third.strftime("%F"), tee_time: sun_third.strftime("%H:%M"))
# matt.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_third.strftime("%F"), tee_time: sun_third.strftime("%H:%M"))
# # Fourth
# joel.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_fourth.strftime("%F"), tee_time: sun_fourth.strftime("%H:%M"))
# bryan.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_fourth.strftime("%F"), tee_time: sun_fourth.strftime("%H:%M"))
# damon.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_fourth.strftime("%F"), tee_time: sun_fourth.strftime("%H:%M"))
# pat.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
# 	                 date_played: sun_fourth.strftime("%F"), tee_time: sun_fourth.strftime("%H:%M"))
#
# # Bandon 2015
# ROUND One
bandon_2015 = Tournament.where(name: 'Bandon', year: 2015).first

trails  = NewCourse.find_by_name('Bandon Trails')
bandon  = NewCourse.find_by_name('Bandon Dunes')
pacific = NewCourse.find_by_name('Pacific Dunes')

bandon_holes  = bandon.holes
pacific_holes = pacific.holes

rnd1 = bandon_2015.tournament_rounds.create(round_number: 1, round_date: DateTime.new(2015, 2, 6), new_course_id: trails.id)
rnd2 = bandon_2015.tournament_rounds.create(round_number: 2, round_date: DateTime.new(2015, 2, 7), new_course_id: bandon.id)
rnd3 = bandon_2015.tournament_rounds.create(round_number: 3, round_date: DateTime.new(2015, 2, 8), new_course_id: pacific.id)

user_ids = Round.where(tournament_id: bandon_2015.id).select(:user_id).uniq
users = User.where(id: user_ids)

users.each do |user|
  bandon_2015.users << user
  # user = User.where(email: user.email).first
  user_rnd1 = Round.where(tournament_id: bandon_2015, user_id: user.id, round_num: 1).first
  handicap = user_rnd1.handicap

  rnd1_sc = rnd1.scorecards.create(user_id: user.id, new_course_id: trails.id,
    total_score: user_rnd1.score,
    total_putts: user_rnd1.putts,
    total_3putts: 0,
    handicap: handicap,
    total_net: user_rnd1.score - handicap,
    round_num: 1,
    finished: true)

  rnd1_sc.user_scores.create(number: 1, score: user_rnd1.send("s#{1}"), putts: user_rnd1.send("p#{1}"), par: 4, handicap: 13)
  rnd1_sc.user_scores.create(number: 2, score: user_rnd1.send("s#{2}"), putts: user_rnd1.send("p#{2}"), par: 3, handicap: 17)
  rnd1_sc.user_scores.create(number: 3, score: user_rnd1.send("s#{3}"), putts: user_rnd1.send("p#{3}"), par: 5, handicap: 3)
  rnd1_sc.user_scores.create(number: 4, score: user_rnd1.send("s#{4}"), putts: user_rnd1.send("p#{4}"), par: 4, handicap: 5)
  rnd1_sc.user_scores.create(number: 5, score: user_rnd1.send("s#{5}"), putts: user_rnd1.send("p#{5}"), par: 3, handicap: 15)
  rnd1_sc.user_scores.create(number: 6, score: user_rnd1.send("s#{6}"), putts: user_rnd1.send("p#{6}"), par: 4, handicap: 9)
  rnd1_sc.user_scores.create(number: 7, score: user_rnd1.send("s#{7}"), putts: user_rnd1.send("p#{7}"), par: 4, handicap: 7)
  rnd1_sc.user_scores.create(number: 8, score: user_rnd1.send("s#{8}"), putts: user_rnd1.send("p#{8}"), par: 4, handicap: 11)
  rnd1_sc.user_scores.create(number: 9, score: user_rnd1.send("s#{9}"), putts: user_rnd1.send("p#{9}"), par: 5, handicap: 1)
  rnd1_sc.user_scores.create(number: 10, score: user_rnd1.send("s#{10}"), putts: user_rnd1.send("p#{10}"), par: 4, handicap: 10)
  rnd1_sc.user_scores.create(number: 11, score: user_rnd1.send("s#{11}"), putts: user_rnd1.send("p#{11}"), par: 4, handicap: 4)
  rnd1_sc.user_scores.create(number: 12, score: user_rnd1.send("s#{12}"), putts: user_rnd1.send("p#{12}"), par: 3, handicap: 18)
  rnd1_sc.user_scores.create(number: 13, score: user_rnd1.send("s#{13}"), putts: user_rnd1.send("p#{13}"), par: 4, handicap: 12)
  rnd1_sc.user_scores.create(number: 14, score: user_rnd1.send("s#{14}"), putts: user_rnd1.send("p#{14}"), par: 4, handicap: 14)
  rnd1_sc.user_scores.create(number: 15, score: user_rnd1.send("s#{15}"), putts: user_rnd1.send("p#{15}"), par: 4, handicap: 8)
  rnd1_sc.user_scores.create(number: 16, score: user_rnd1.send("s#{16}"), putts: user_rnd1.send("p#{16}"), par: 5, handicap: 2)
  rnd1_sc.user_scores.create(number: 17, score: user_rnd1.send("s#{17}"), putts: user_rnd1.send("p#{17}"), par: 3, handicap: 16)
  rnd1_sc.user_scores.create(number: 18, score: user_rnd1.send("s#{18}"), putts: user_rnd1.send("p#{18}"), par: 4, handicap: 6)

  user_scores1 = rnd1_sc.user_scores
  three_putts1 = user_scores1.map { |x| p x.putts if x.putts > 2 }.compact.length
  rnd1_sc.update(total_3putts: three_putts1)

  rnd1_score = user_rnd1.score - handicap

  user_rnd2 = Round.where(tournament_id: bandon_2015, user_id: user.id, round_num: 2).first

  rnd2_sc = rnd2.scorecards.create(user_id: user.id, new_course_id: bandon.id,
    total_score: user_rnd2.score,
    total_putts: user_rnd2.putts,
    total_3putts: 0,
    handicap: handicap,
    total_net: user_rnd2.score - handicap,
    round_num: 2,
    finished: true)

  rnd2_sc.user_scores.create(number: 1, score: user_rnd2.send("s#{1}"),putts: user_rnd2.send("p#{1}"), par: bandon_holes[0].par, handicap: bandon_holes[0].handicap)
  rnd2_sc.user_scores.create(number: 2, score: user_rnd2.send("s#{2}"),putts: user_rnd2.send("p#{2}"), par: bandon_holes[1].par, handicap: bandon_holes[1].handicap)
  rnd2_sc.user_scores.create(number: 3, score: user_rnd2.send("s#{3}"),putts: user_rnd2.send("p#{3}"), par: bandon_holes[2].par, handicap: bandon_holes[2].handicap)
  rnd2_sc.user_scores.create(number: 4, score: user_rnd2.send("s#{4}"),putts: user_rnd2.send("p#{4}"), par: bandon_holes[3].par, handicap: bandon_holes[3].handicap)
  rnd2_sc.user_scores.create(number: 5, score: user_rnd2.send("s#{5}"),putts: user_rnd2.send("p#{5}"), par: bandon_holes[4].par, handicap: bandon_holes[4].handicap)
  rnd2_sc.user_scores.create(number: 6, score: user_rnd2.send("s#{6}"),putts: user_rnd2.send("p#{6}"), par: bandon_holes[5].par, handicap: bandon_holes[5].handicap)
  rnd2_sc.user_scores.create(number: 7, score: user_rnd2.send("s#{7}"),putts: user_rnd2.send("p#{7}"), par: bandon_holes[6].par, handicap: bandon_holes[6].handicap)
  rnd2_sc.user_scores.create(number: 8, score: user_rnd2.send("s#{8}"),putts: user_rnd2.send("p#{8}"), par: bandon_holes[7].par, handicap: bandon_holes[7].handicap)
  rnd2_sc.user_scores.create(number: 9, score: user_rnd2.send("s#{9}"),putts: user_rnd2.send("p#{9}"), par: bandon_holes[8].par, handicap: bandon_holes[8].handicap)
  rnd2_sc.user_scores.create(number: 10, score: user_rnd2.send("s#{10}"),putts: user_rnd2.send("p#{10}"), par: bandon_holes[9].par, handicap: bandon_holes[9].handicap)
  rnd2_sc.user_scores.create(number: 11, score: user_rnd2.send("s#{11}"),putts: user_rnd2.send("p#{11}"), par: bandon_holes[10].par, handicap: bandon_holes[10].handicap)
  rnd2_sc.user_scores.create(number: 12, score: user_rnd2.send("s#{12}"),putts: user_rnd2.send("p#{12}"), par: bandon_holes[11].par, handicap: bandon_holes[11].handicap)
  rnd2_sc.user_scores.create(number: 13, score: user_rnd2.send("s#{13}"),putts: user_rnd2.send("p#{13}"), par: bandon_holes[12].par, handicap: bandon_holes[12].handicap)
  rnd2_sc.user_scores.create(number: 14, score: user_rnd2.send("s#{14}"),putts: user_rnd2.send("p#{14}"), par: bandon_holes[13].par, handicap: bandon_holes[13].handicap)
  rnd2_sc.user_scores.create(number: 15, score: user_rnd2.send("s#{15}"),putts: user_rnd2.send("p#{15}"), par: bandon_holes[14].par, handicap: bandon_holes[14].handicap)
  rnd2_sc.user_scores.create(number: 16, score: user_rnd2.send("s#{16}"),putts: user_rnd2.send("p#{16}"), par: bandon_holes[15].par, handicap: bandon_holes[15].handicap)
  rnd2_sc.user_scores.create(number: 17, score: user_rnd2.send("s#{17}"),putts: user_rnd2.send("p#{17}"), par: bandon_holes[16].par, handicap: bandon_holes[16].handicap)
  rnd2_sc.user_scores.create(number: 18, score: user_rnd2.send("s#{18}"),putts: user_rnd2.send("p#{18}"), par: bandon_holes[17].par, handicap: bandon_holes[17].handicap)

  user_scores2 = rnd2_sc.user_scores
  three_putts2 = user_scores2.map { |x| p x.putts if x.putts > 2 }.compact.length

  rnd2_score = user_rnd2.score - handicap
  rnd2_sc.update(total_3putts: three_putts2)


  user_rnd3 = Round.where(tournament_id: bandon_2015, user_id: user.id, round_num: 3).first

  rnd3_sc = rnd3.scorecards.create(user_id: user.id, new_course_id: pacific.id,
    total_score: user_rnd3.score,
    total_putts: user_rnd3.putts,
    total_3putts: 0,
    handicap: handicap,
    total_net: user_rnd3.score - handicap,
    round_num: 3,
    finished: true)

  rnd3_sc.user_scores.create(number: 1, score: user_rnd3.send("s#{1}"),putts: user_rnd3.send("p#{1}"), par: pacific_holes[0].par, handicap: pacific_holes[0].handicap)
  rnd3_sc.user_scores.create(number: 2, score: user_rnd3.send("s#{2}"),putts: user_rnd3.send("p#{2}"), par: pacific_holes[1].par, handicap: pacific_holes[1].handicap)
  rnd3_sc.user_scores.create(number: 3, score: user_rnd3.send("s#{3}"),putts: user_rnd3.send("p#{3}"), par: pacific_holes[2].par, handicap: pacific_holes[2].handicap)
  rnd3_sc.user_scores.create(number: 4, score: user_rnd3.send("s#{4}"),putts: user_rnd3.send("p#{4}"), par: pacific_holes[3].par, handicap: pacific_holes[3].handicap)
  rnd3_sc.user_scores.create(number: 5, score: user_rnd3.send("s#{5}"),putts: user_rnd3.send("p#{5}"), par: pacific_holes[4].par, handicap: pacific_holes[4].handicap)
  rnd3_sc.user_scores.create(number: 6, score: user_rnd3.send("s#{6}"),putts: user_rnd3.send("p#{6}"), par: pacific_holes[5].par, handicap: pacific_holes[5].handicap)
  rnd3_sc.user_scores.create(number: 7, score: user_rnd3.send("s#{7}"),putts: user_rnd3.send("p#{7}"), par: pacific_holes[6].par, handicap: pacific_holes[6].handicap)
  rnd3_sc.user_scores.create(number: 8, score: user_rnd3.send("s#{8}"),putts: user_rnd3.send("p#{8}"), par: pacific_holes[7].par, handicap: pacific_holes[7].handicap)
  rnd3_sc.user_scores.create(number: 9, score: user_rnd3.send("s#{9}"),putts: user_rnd3.send("p#{9}"), par: pacific_holes[8].par, handicap: pacific_holes[8].handicap)
  rnd3_sc.user_scores.create(number: 10, score: user_rnd3.send("s#{10}"),putts: user_rnd3.send("p#{10}"), par: pacific_holes[9].par, handicap: pacific_holes[9].handicap)
  rnd3_sc.user_scores.create(number: 11, score: user_rnd3.send("s#{11}"),putts: user_rnd3.send("p#{11}"), par: pacific_holes[10].par, handicap: pacific_holes[10].handicap)
  rnd3_sc.user_scores.create(number: 12, score: user_rnd3.send("s#{12}"),putts: user_rnd3.send("p#{12}"), par: pacific_holes[11].par, handicap: pacific_holes[11].handicap)
  rnd3_sc.user_scores.create(number: 13, score: user_rnd3.send("s#{13}"),putts: user_rnd3.send("p#{13}"), par: pacific_holes[12].par, handicap: pacific_holes[12].handicap)
  rnd3_sc.user_scores.create(number: 14, score: user_rnd3.send("s#{14}"),putts: user_rnd3.send("p#{14}"), par: pacific_holes[13].par, handicap: pacific_holes[13].handicap)
  rnd3_sc.user_scores.create(number: 15, score: user_rnd3.send("s#{15}"),putts: user_rnd3.send("p#{15}"), par: pacific_holes[14].par, handicap: pacific_holes[14].handicap)
  rnd3_sc.user_scores.create(number: 16, score: user_rnd3.send("s#{16}"),putts: user_rnd3.send("p#{16}"), par: pacific_holes[15].par, handicap: pacific_holes[15].handicap)
  rnd3_sc.user_scores.create(number: 17, score: user_rnd3.send("s#{17}"),putts: user_rnd3.send("p#{17}"), par: pacific_holes[16].par, handicap: pacific_holes[16].handicap)
  rnd3_sc.user_scores.create(number: 18, score: user_rnd3.send("s#{18}"),putts: user_rnd3.send("p#{18}"), par: pacific_holes[17].par, handicap: pacific_holes[17].handicap)

  user_scores3 = rnd3_sc.user_scores
  three_putts3 = user_scores3.map { |x| p x.putts if x.putts > 2 }.compact.length
  rnd3_sc.update(total_3putts: three_putts3)

  rnd3_score = user_rnd3.score - handicap

  total_score = (rnd1_score + rnd2_score + rnd3_score) - (trails.par + bandon.par + pacific.par)


  leaderboard = bandon_2015.leaderboards.create(user_id: user.id, handicap: handicap,
    rnd1_score: rnd1_score,
    rnd2_score: rnd2_score,
    rnd3_score: rnd3_score,
    rnd1_putts: user_rnd1.putts,
    rnd2_putts: user_rnd2.putts,
    rnd3_putts: user_rnd3.putts,
    total_score: total_score,
    total_putts: (user_rnd1.putts + user_rnd2.putts + user_rnd3.putts),
    total_3_putts: (three_putts1 + three_putts2 + three_putts3),
    net_total: (rnd1_score + rnd2_score + rnd3_score),
    rn1_3putts: three_putts1,
    rnd2_3putts: three_putts2,
    rnd3_3putts: three_putts3)

end

bandon_2016 = Tournament.where(name: 'Bandon', year: 2016).first

trails  = NewCourse.find_by_name('Bandon Trails')
old_mac = NewCourse.find_by_name('Old Mac')
bandon  = NewCourse.find_by_name('Bandon Dunes')

bandon_holes  = bandon.holes
old_mac_holes = old_mac.holes

rnd1 = bandon_2016.tournament_rounds.create(round_number: 1, round_date: DateTime.new(2016, 3, 17), new_course_id: trails.id)
rnd2 = bandon_2016.tournament_rounds.create(round_number: 2, round_date: DateTime.new(2016, 3, 18), new_course_id: old_mac.id)
rnd3 = bandon_2016.tournament_rounds.create(round_number: 3, round_date: DateTime.new(2016, 3, 19), new_course_id: bandon.id)

user_ids = Round.where(tournament_id: bandon_2016.id).select(:user_id).uniq
users = User.where(id: user_ids)

users.each do |user|
  bandon_2016.users << user
  # user = User.where(email: user.email).first
  user_rnd1 = Round.where(tournament_id: bandon_2016, user_id: user.id, round_num: 1).first
  handicap = user_rnd1.handicap

  rnd1_sc = rnd1.scorecards.create(user_id: user.id, new_course_id: trails.id,
    total_score: user_rnd1.score,
    total_putts: user_rnd1.putts,
    total_3putts: 0,
    handicap: handicap,
    total_net: user_rnd1.score - handicap,
    round_num: 1,
    finished: true)

  rnd1_sc.user_scores.create(number: 1, score: user_rnd1.send("s#{1}"), putts: user_rnd1.send("p#{1}"), par: 4, handicap: 13)
  rnd1_sc.user_scores.create(number: 2, score: user_rnd1.send("s#{2}"), putts: user_rnd1.send("p#{2}"), par: 3, handicap: 17)
  rnd1_sc.user_scores.create(number: 3, score: user_rnd1.send("s#{3}"), putts: user_rnd1.send("p#{3}"), par: 5, handicap: 3)
  rnd1_sc.user_scores.create(number: 4, score: user_rnd1.send("s#{4}"), putts: user_rnd1.send("p#{4}"), par: 4, handicap: 5)
  rnd1_sc.user_scores.create(number: 5, score: user_rnd1.send("s#{5}"), putts: user_rnd1.send("p#{5}"), par: 3, handicap: 15)
  rnd1_sc.user_scores.create(number: 6, score: user_rnd1.send("s#{6}"), putts: user_rnd1.send("p#{6}"), par: 4, handicap: 9)
  rnd1_sc.user_scores.create(number: 7, score: user_rnd1.send("s#{7}"), putts: user_rnd1.send("p#{7}"), par: 4, handicap: 7)
  rnd1_sc.user_scores.create(number: 8, score: user_rnd1.send("s#{8}"), putts: user_rnd1.send("p#{8}"), par: 4, handicap: 11)
  rnd1_sc.user_scores.create(number: 9, score: user_rnd1.send("s#{9}"), putts: user_rnd1.send("p#{9}"), par: 5, handicap: 1)
  rnd1_sc.user_scores.create(number: 10, score: user_rnd1.send("s#{10}"), putts: user_rnd1.send("p#{10}"), par: 4, handicap: 10)
  rnd1_sc.user_scores.create(number: 11, score: user_rnd1.send("s#{11}"), putts: user_rnd1.send("p#{11}"), par: 4, handicap: 4)
  rnd1_sc.user_scores.create(number: 12, score: user_rnd1.send("s#{12}"), putts: user_rnd1.send("p#{12}"), par: 3, handicap: 18)
  rnd1_sc.user_scores.create(number: 13, score: user_rnd1.send("s#{13}"), putts: user_rnd1.send("p#{13}"), par: 4, handicap: 12)
  rnd1_sc.user_scores.create(number: 14, score: user_rnd1.send("s#{14}"), putts: user_rnd1.send("p#{14}"), par: 4, handicap: 14)
  rnd1_sc.user_scores.create(number: 15, score: user_rnd1.send("s#{15}"), putts: user_rnd1.send("p#{15}"), par: 4, handicap: 8)
  rnd1_sc.user_scores.create(number: 16, score: user_rnd1.send("s#{16}"), putts: user_rnd1.send("p#{16}"), par: 5, handicap: 2)
  rnd1_sc.user_scores.create(number: 17, score: user_rnd1.send("s#{17}"), putts: user_rnd1.send("p#{17}"), par: 3, handicap: 16)
  rnd1_sc.user_scores.create(number: 18, score: user_rnd1.send("s#{18}"), putts: user_rnd1.send("p#{18}"), par: 4, handicap: 6)

  user_scores1 = rnd1_sc.user_scores
  three_putts1 = user_scores1.map { |x| p x.putts if x.putts > 2 }.compact.length
  rnd1_sc.update(total_3putts: three_putts1)

  rnd1_score = user_rnd1.score - handicap

  user_rnd2 = Round.where(tournament_id: bandon_2016, user_id: user.id, round_num: 2).first

  rnd2_sc = rnd2.scorecards.create(user_id: user.id, new_course_id: old_mac.id,
    total_score: user_rnd2.score,
    total_putts: user_rnd2.putts,
    total_3putts: 0,
    handicap: handicap,
    total_net: user_rnd2.score - handicap,
    round_num: 2,
    finished: true)

  rnd2_sc.user_scores.create(number: 1, score: user_rnd2.send("s#{1}"),putts: user_rnd2.send("p#{1}"), par: old_mac_holes[0].par, handicap: old_mac_holes[0].handicap)
  rnd2_sc.user_scores.create(number: 2, score: user_rnd2.send("s#{2}"),putts: user_rnd2.send("p#{2}"), par: old_mac_holes[1].par, handicap: old_mac_holes[1].handicap)
  rnd2_sc.user_scores.create(number: 3, score: user_rnd2.send("s#{3}"),putts: user_rnd2.send("p#{3}"), par: old_mac_holes[2].par, handicap: old_mac_holes[2].handicap)
  rnd2_sc.user_scores.create(number: 4, score: user_rnd2.send("s#{4}"),putts: user_rnd2.send("p#{4}"), par: old_mac_holes[3].par, handicap: old_mac_holes[3].handicap)
  rnd2_sc.user_scores.create(number: 5, score: user_rnd2.send("s#{5}"),putts: user_rnd2.send("p#{5}"), par: old_mac_holes[4].par, handicap: old_mac_holes[4].handicap)
  rnd2_sc.user_scores.create(number: 6, score: user_rnd2.send("s#{6}"),putts: user_rnd2.send("p#{6}"), par: old_mac_holes[5].par, handicap: old_mac_holes[5].handicap)
  rnd2_sc.user_scores.create(number: 7, score: user_rnd2.send("s#{7}"),putts: user_rnd2.send("p#{7}"), par: old_mac_holes[6].par, handicap: old_mac_holes[6].handicap)
  rnd2_sc.user_scores.create(number: 8, score: user_rnd2.send("s#{8}"),putts: user_rnd2.send("p#{8}"), par: old_mac_holes[7].par, handicap: old_mac_holes[7].handicap)
  rnd2_sc.user_scores.create(number: 9, score: user_rnd2.send("s#{9}"),putts: user_rnd2.send("p#{9}"), par: old_mac_holes[8].par, handicap: old_mac_holes[8].handicap)
  rnd2_sc.user_scores.create(number: 10, score: user_rnd2.send("s#{10}"),putts: user_rnd2.send("p#{10}"), par: old_mac_holes[9].par, handicap: old_mac_holes[9].handicap)
  rnd2_sc.user_scores.create(number: 11, score: user_rnd2.send("s#{11}"),putts: user_rnd2.send("p#{11}"), par: old_mac_holes[10].par, handicap: old_mac_holes[10].handicap)
  rnd2_sc.user_scores.create(number: 12, score: user_rnd2.send("s#{12}"),putts: user_rnd2.send("p#{12}"), par: old_mac_holes[11].par, handicap: old_mac_holes[11].handicap)
  rnd2_sc.user_scores.create(number: 13, score: user_rnd2.send("s#{13}"),putts: user_rnd2.send("p#{13}"), par: old_mac_holes[12].par, handicap: old_mac_holes[12].handicap)
  rnd2_sc.user_scores.create(number: 14, score: user_rnd2.send("s#{14}"),putts: user_rnd2.send("p#{14}"), par: old_mac_holes[13].par, handicap: old_mac_holes[13].handicap)
  rnd2_sc.user_scores.create(number: 15, score: user_rnd2.send("s#{15}"),putts: user_rnd2.send("p#{15}"), par: old_mac_holes[14].par, handicap: old_mac_holes[14].handicap)
  rnd2_sc.user_scores.create(number: 16, score: user_rnd2.send("s#{16}"),putts: user_rnd2.send("p#{16}"), par: old_mac_holes[15].par, handicap: old_mac_holes[15].handicap)
  rnd2_sc.user_scores.create(number: 17, score: user_rnd2.send("s#{17}"),putts: user_rnd2.send("p#{17}"), par: old_mac_holes[16].par, handicap: old_mac_holes[16].handicap)
  rnd2_sc.user_scores.create(number: 18, score: user_rnd2.send("s#{18}"),putts: user_rnd2.send("p#{18}"), par: old_mac_holes[17].par, handicap: old_mac_holes[17].handicap)

  user_scores2 = rnd2_sc.user_scores
  three_putts2 = user_scores2.map { |x| p x.putts if x.putts > 2 }.compact.length

  rnd2_score = user_rnd2.score - handicap
  rnd2_sc.update(total_3putts: three_putts2)


  user_rnd3 = Round.where(tournament_id: bandon_2016, user_id: user.id, round_num: 3).first

  rnd3_sc = rnd3.scorecards.create(user_id: user.id, new_course_id: bandon.id,
    total_score: user_rnd3.score,
    total_putts: user_rnd3.putts,
    total_3putts: 0,
    handicap: handicap,
    total_net: user_rnd3.score - handicap,
    round_num: 3,
    finished: true)

  rnd3_sc.user_scores.create(number: 1, score: user_rnd3.send("s#{1}"),putts: user_rnd3.send("p#{1}"), par: bandon_holes[0].par, handicap: bandon_holes[0].handicap)
  rnd3_sc.user_scores.create(number: 2, score: user_rnd3.send("s#{2}"),putts: user_rnd3.send("p#{2}"), par: bandon_holes[1].par, handicap: bandon_holes[1].handicap)
  rnd3_sc.user_scores.create(number: 3, score: user_rnd3.send("s#{3}"),putts: user_rnd3.send("p#{3}"), par: bandon_holes[2].par, handicap: bandon_holes[2].handicap)
  rnd3_sc.user_scores.create(number: 4, score: user_rnd3.send("s#{4}"),putts: user_rnd3.send("p#{4}"), par: bandon_holes[3].par, handicap: bandon_holes[3].handicap)
  rnd3_sc.user_scores.create(number: 5, score: user_rnd3.send("s#{5}"),putts: user_rnd3.send("p#{5}"), par: bandon_holes[4].par, handicap: bandon_holes[4].handicap)
  rnd3_sc.user_scores.create(number: 6, score: user_rnd3.send("s#{6}"),putts: user_rnd3.send("p#{6}"), par: bandon_holes[5].par, handicap: bandon_holes[5].handicap)
  rnd3_sc.user_scores.create(number: 7, score: user_rnd3.send("s#{7}"),putts: user_rnd3.send("p#{7}"), par: bandon_holes[6].par, handicap: bandon_holes[6].handicap)
  rnd3_sc.user_scores.create(number: 8, score: user_rnd3.send("s#{8}"),putts: user_rnd3.send("p#{8}"), par: bandon_holes[7].par, handicap: bandon_holes[7].handicap)
  rnd3_sc.user_scores.create(number: 9, score: user_rnd3.send("s#{9}"),putts: user_rnd3.send("p#{9}"), par: bandon_holes[8].par, handicap: bandon_holes[8].handicap)
  rnd3_sc.user_scores.create(number: 10, score: user_rnd3.send("s#{10}"),putts: user_rnd3.send("p#{10}"), par: bandon_holes[9].par, handicap: bandon_holes[9].handicap)
  rnd3_sc.user_scores.create(number: 11, score: user_rnd3.send("s#{11}"),putts: user_rnd3.send("p#{11}"), par: bandon_holes[10].par, handicap: bandon_holes[10].handicap)
  rnd3_sc.user_scores.create(number: 12, score: user_rnd3.send("s#{12}"),putts: user_rnd3.send("p#{12}"), par: bandon_holes[11].par, handicap: bandon_holes[11].handicap)
  rnd3_sc.user_scores.create(number: 13, score: user_rnd3.send("s#{13}"),putts: user_rnd3.send("p#{13}"), par: bandon_holes[12].par, handicap: bandon_holes[12].handicap)
  rnd3_sc.user_scores.create(number: 14, score: user_rnd3.send("s#{14}"),putts: user_rnd3.send("p#{14}"), par: bandon_holes[13].par, handicap: bandon_holes[13].handicap)
  rnd3_sc.user_scores.create(number: 15, score: user_rnd3.send("s#{15}"),putts: user_rnd3.send("p#{15}"), par: bandon_holes[14].par, handicap: bandon_holes[14].handicap)
  rnd3_sc.user_scores.create(number: 16, score: user_rnd3.send("s#{16}"),putts: user_rnd3.send("p#{16}"), par: bandon_holes[15].par, handicap: bandon_holes[15].handicap)
  rnd3_sc.user_scores.create(number: 17, score: user_rnd3.send("s#{17}"),putts: user_rnd3.send("p#{17}"), par: bandon_holes[16].par, handicap: bandon_holes[16].handicap)
  rnd3_sc.user_scores.create(number: 18, score: user_rnd3.send("s#{18}"),putts: user_rnd3.send("p#{18}"), par: bandon_holes[17].par, handicap: bandon_holes[17].handicap)

  user_scores3 = rnd3_sc.user_scores
  three_putts3 = user_scores3.map { |x| p x.putts if x.putts > 2 }.compact.length
  rnd3_sc.update(total_3putts: three_putts3)

  rnd3_score = user_rnd3.score - handicap

  total_score = (rnd1_score + rnd2_score + rnd3_score) - (trails.par + bandon.par + old_mac.par)


  leaderboard = bandon_2016.leaderboards.create(user_id: user.id, handicap: handicap,
    rnd1_score: rnd1_score,
    rnd2_score: rnd2_score,
    rnd3_score: rnd3_score,
    rnd1_putts: user_rnd1.putts,
    rnd2_putts: user_rnd2.putts,
    rnd3_putts: user_rnd3.putts,
    total_score: total_score,
    total_putts: (user_rnd1.putts + user_rnd2.putts + user_rnd3.putts),
    total_3_putts: (three_putts1 + three_putts2 + three_putts3),
    net_total: (rnd1_score + rnd2_score + rnd3_score),
    rn1_3putts: three_putts1,
    rnd2_3putts: three_putts2,
    rnd3_3putts: three_putts3)

end

#
# # Round One
# fifteen_fri = DateTime.new(2015, 2, 6)
# fifteen_fri_first = DateTime.new(2015, 2, 6, 9, 50, 00)
# # fifteen_fri_sec = DateTime.new(2015, 2, 6, 10, 00, 00)
# # fifteen_fri_third = DateTime.new(2015, 2, 6, 10, 10, 00)
# # # First
# payne_rnd1 = payne.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course_id: 3,
# 	                 date_played: fifteen_fri_first.strftime("%F"), tee_time: fifteen_fri_first.strftime("%H:%M"),
# 	                 	s1: 7, s2: 4, s3: 6, s4: 6,
# 	                  s5: 5, s6: 5, s7: 6, s8: 5,
# 	                 	s9: 7, s10: 4, s11: 6, s12: 3,
# 	                 	s13: 5, s14: 6, s15: 4, s16: 7,
# 	                 	s17: 3, s18: 4 , handicap: 14,
# 	                 	p1: 3, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 3, p6: 1, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 1,
# 	                 	p13: 2, p14: 1, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 94, putts: 35)
#
# cory.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_first.strftime("%F"), tee_time: fifteen_fri_first.strftime("%H:%M"),
# 	                 	s1: 7, s2: 4, s3: 9, s4: 6,
# 	                  s5: 3, s6: 5, s7: 5, s8: 7,
#                   	s9: 9, s10: 6, s11: 10, s12: 4,
# 	                 	s13: 5, s14: 6, s15: 7, s16: 10,
# 	                 	s17: 5, s18: 5, handicap: 21,
# 	                 	p1: 2, p2: 2, p3: 3, p4: 3,
# 	                 	p5: 1, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 3, p10: 2, p11: 3, p12: 2,
# 	                 	p13: 1, p14: 2, p15: 3, p16: 2,
# 	                 	p17: 3, p18: 2,
# 	                 	score: 113, putts: 37)
# damon.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_first.strftime("%F"), tee_time: fifteen_fri_first.strftime("%H:%M"),
# 	                 	s1: 6, s2: 8, s3: 9, s4: 8,
# 	                  s5: 4, s6: 5, s7: 9, s8: 5,
#                   	s9: 8, s10: 5, s11: 7, s12: 6,
# 	                 	s13: 11, s14: 10, s15: 10, s16: 12,
# 	                 	s17: 10, s18: 11 , handicap: 32,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 3,
# 	                 	p5: 1, p6: 2, p7: 2, p8: 3,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 3,
# 	                 	p13: 2, p14: 2, p15: 2, p16: 3,
# 	                 	p17: 2, p18: 2 ,
# 	                 	score: 144, putts: 39)
# bryan.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_first.strftime("%F"), tee_time: fifteen_fri_first.strftime("%H:%M"),
# 	                 	s1: 6, s2: 5, s3: 6, s4: 5,
# 	                  s5: 5, s6: 5, s7: 6, s8: 6,
#                   	s9: 5, s10: 4, s11: 5, s12: 4,
# 	                 	s13: 4, s14: 6, s15: 3, s16: 6,
# 	                 	s17: 5, s18: 5, handicap: 8,
# 	                 	p1: 2, p2: 3, p3: 2, p4: 2,
# 	                 	p5: 3, p6: 2, p7: 2, p8: 1,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 3,
# 	                 	p13: 2, p14: 2, p15: 1, p16: 2,
# 	                 	p17: 1, p18: 2,
# 	                 	score: 92, putts: 36)
# # Second
# jack.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_sec.strftime("%F"), tee_time: fifteen_fri_sec.strftime("%H:%M"),
# 	                 	s1: 6, s2: 6, s3: 6, s4: 6,
# 	                  s5: 4, s6: 9, s7: 7, s8: 4,
#                   	s9: 6, s10: 9, s11: 8, s12: 5,
# 	                 	s13: 4, s14: 11, s15: 7, s16: 8,
# 	                 	s17: 8, s18: 5, handicap: 25,
# 	                 	p1: 2, p2: 3, p3: 1, p4: 2,
# 	                 	p5: 1, p6: 1, p7: 3, p8: 1,
# 	                 	p9: 1, p10: 2, p11: 2, p12: 2,
# 	                 	p13: 1, p14: 2, p15: 2, p16: 2,
# 	                 	p17: 1, p18: 2,
# 	                 	score: 119, putts: 31)
# jeremy.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_sec.strftime("%F"), tee_time: fifteen_fri_sec.strftime("%H:%M"),
# 	                 	s1: 5, s2: 4, s3: 7, s4: 7,
# 	                  s5: 2, s6: 4, s7: 5, s8: 6,
#                   	s9: 5, s10: 7, s11: 6, s12: 5,
# 	                 	s13: 6, s14: 5, s15: 5, s16: 6,
# 	                 	s17: 5, s18: 4, handicap: 13,
# 	                 	p1: 2, p2: 3, p3: 2, p4: 2,
# 	                 	p5: 1, p6: 1, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 3, p12: 2,
# 	                 	p13: 3, p14: 3, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 1,
# 	                 	score: 94, putts: 37)
# greg.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_sec.strftime("%F"), tee_time: fifteen_fri_sec.strftime("%H:%M"),
# 	                 	s1: 6, s2: 7, s3: 10, s4: 4,
# 	                  s5: 4, s6: 9, s7: 6, s8: 5,
#                   	s9: 7, s10: 5, s11: 6, s12: 6,
# 	                 	s13: 7, s14: 8, s15: 6, s16: 8,
# 	                 	s17: 7, s18: 8, handicap: 23,
# 	                 	p1: 1, p2: 2, p3: 3, p4: 2,
# 	                 	p5: 1, p6: 3, p7: 3, p8: 1,
# 	                 	p9: 2, p10: 3, p11: 2, p12: 2,
# 	                 	p13: 3, p14: 3, p15: 2, p16: 4,
# 	                 	p17: 2, p18: 3,
# 	                 	score: 119, putts: 42)
# dan.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_sec.strftime("%F"), tee_time: fifteen_fri_sec.strftime("%H:%M"),
# 	                 	s1: 7, s2: 5, s3: 7, s4: 6,
# 	                  s5: 3, s6: 5, s7: 5, s8: 5,
#                   	s9: 6, s10: 9, s11: 8, s12: 4,
# 	                 	s13: 6, s14: 9, s15: 5, s16: 4,
# 	                 	s17: 4, s18: 4, handicap: 18,
# 	                 	p1: 2, p2: 2, p3: 1, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 3, p8: 3,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 2,
# 	                 	p13: 2, p14: 3, p15: 2, p16: 1,
# 	                 	p17: 1, p18: 2,
# 	                 	score: 102, putts: 36)
# # Third
# david.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_third.strftime("%F"), tee_time: fifteen_fri_third.strftime("%H:%M"),
# 	                 	s1: 10, s2: 5, s3: 5, s4: 6,
# 	                  s5: 3, s6: 6, s7: 5, s8: 5,
#                   	s9: 9, s10: 6, s11: 5, s12: 4,
# 	                 	s13: 6, s14: 6, s15: 6, s16: 6,
# 	                 	s17: 4, s18: 7, handicap: 20,
# 	                 	p1: 4, p2: 3, p3: 1, p4: 3,
# 	                 	p5: 2, p6: 3, p7: 2, p8: 3,
# 	                 	p9: 3, p10: 3, p11: 2, p12: 3,
# 	                 	p13: 3, p14: 3, p15: 3, p16: 3,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 104, putts: 48)
# albino.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_third.strftime("%F"), tee_time: fifteen_fri_third.strftime("%H:%M"),
# 	                 	s1: 7, s2: 3, s3: 7, s4: 8,
# 	                  s5: 4, s6: 5, s7: 6, s8: 6,
#                   	s9: 5, s10: 4, s11: 6, s12: 3,
# 	                 	s13: 6, s14: 5, s15: 4, s16: 7,
# 	                 	s17: 5, s18: 6, handicap: 14,
# 	                 	p1: 1, p2: 1, p3: 2, p4: 2,
# 	                 	p5: 3, p6: 2, p7: 3, p8: 3,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 2,
# 	                 	p13: 3, p14: 3, p15: 1, p16: 3,
# 	                 	p17: 1, p18: 2,
# 	                 	score: 97, putts: 38)
# joel.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_third.strftime("%F"), tee_time: fifteen_fri_third.strftime("%H:%M"),
# 	                 	s1: 8, s2: 4, s3: 5, s4: 4,
# 	                  s5: 3, s6: 4, s7: 5, s8: 5,
#                   	s9: 5, s10: 2, s11: 5, s12: 4,
# 	                 	s13: 7, s14: 5, s15: 5, s16: 6,
# 	                 	s17: 2, s18: 4, handicap: 7,
# 	                 	p1: 3, p2: 2, p3: 1, p4: 2,
# 	                 	p5: 1, p6: 1, p7: 2, p8: 1,
# 	                 	p9: 2, p10: 0, p11: 2, p12: 3,
# 	                 	p13: 3, p14: 1, p15: 2, p16: 1,
# 	                 	p17: 1, p18: 1,
# 	                 	score: 83, putts: 29)
# pat.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
# 	                 date_played: fifteen_fri_third.strftime("%F"), tee_time: fifteen_fri_third.strftime("%H:%M"),
# 	                 	s1: 8, s2: 8, s3: 7, s4: 8,
# 	                  s5: 3, s6: 5, s7: 10, s8: 6,
#                   	s9: 7, s10: 5, s11: 6, s12: 5,
# 	                 	s13: 6, s14: 6, s15: 7, s16: 8,
# 	                 	s17: 5, s18: 6, handicap: 32,
# 	                 	p1: 3, p2: 2, p3: 2, p4: 3,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 3,
# 	                 	p13: 3, p14: 2, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 116, putts: 40)
#
# # Round Two
# fifteen_sat = DateTime.new(2015, 2, 7)
# fifteen_sat_first = DateTime.new(2015, 2, 7, 10, 30, 00)
# fifteen_sat_sec = DateTime.new(2015, 2, 7, 10, 40, 00)
# fifteen_sat_third = DateTime.new(2015, 2, 7, 10, 50, 00)
# # # First
# payne.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course_id: 1,
# 	                 date_played: fifteen_sat_first.strftime("%F"), tee_time: fifteen_sat_first.strftime("%H:%M"),
# 	                 	s1: 4, s2: 4, s3: 6, s4: 6,
# 	                  s5: 5, s6: 6, s7: 6, s8: 5,
#                     s9: 7, s10: 4, s11: 5, s12: 4,
# 	                 	s13: 6, s14: 6, s15: 4, s16: 7,
# 	                 	s17: 5, s18: 8, handicap: 14,
# 	                 	p1: 2, p2: 2, p3: 1, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 1, p11: 2, p12: 2,
# 	                 	p13: 2, p14: 2, p15: 2, p16: 3,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 98, putts: 35)
# cory.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_first.strftime("%F"), tee_time: fifteen_sat_first.strftime("%H:%M"),
# 	                 	s1: 7, s2: 4, s3: 10, s4: 10,
# 	                  s5: 9, s6: 3, s7: 9, s8: 7,
#                     s9: 6, s10: 5, s11: 6, s12: 6,
# 	                 	s13: 7, s14: 7, s15: 5, s16: 6,
# 	                 	s17: 5, s18: 8, handicap: 21,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 1, p10: 2, p11: 2, p12: 2,
# 	                 	p13: 3, p14: 2, p15: 2, p16: 3,
# 	                 	p17: 2, p18: 3,
# 	                 	score: 120, putts: 38)
# jack.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_first.strftime("%F"), tee_time: fifteen_sat_first.strftime("%H:%M"),
# 	                 	s1: 6, s2: 7, s3: 7, s4: 6,
# 	                  s5: 8, s6: 5, s7: 6, s8: 4,
#                     s9: 6, s10: 7, s11: 5, s12: 5,
# 	                 	s13: 10, s14: 5, s15: 3, s16: 9,
# 	                 	s17: 7, s18: 10, handicap: 25,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 1,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 3,
# 	                 	p13: 2, p14: 2, p15: 2, p16: 1,
# 	                 	p17: 3, p18: 3,
# 	                 	score: 116, putts: 37)
# jeremy.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_first.strftime("%F"), tee_time: fifteen_sat_first.strftime("%H:%M"),
# 	                 	s1: 6, s2: 4, s3: 5, s4: 5,
# 	                  s5: 5, s6: 3, s7: 6, s8: 6,
#                     s9: 7, s10: 6, s11: 4, s12: 4,
# 	                 	s13: 6, s14: 6, s15: 6, s16: 4,
# 	                 	s17: 5, s18: 6, handicap: 13,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 1,
# 	                 	p9: 2, p10: 3, p11: 1, p12: 2,
# 	                 	p13: 2, p14: 3, p15: 3, p16: 2,
# 	                 	p17: 2, p18: 1,
# 	                 	score: 94, putts: 36)
# # Second
# greg.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_sec.strftime("%F"), tee_time: fifteen_sat_sec.strftime("%H:%M"),
# 	                 	s1: 7, s2: 7, s3: 7, s4: 8,
# 	                  s5: 6, s6: 4, s7: 8, s8: 6,
#                     s9: 7, s10: 6, s11: 6, s12: 5,
# 	                 	s13: 7, s14: 4, s15: 3, s16: 6,
# 	                 	s17: 5, s18: 6, handicap: 23,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 1, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 1, p11: 2, p12: 2,
# 	                 	p13: 3, p14: 1, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 108, putts: 35)
# dan.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_sec.strftime("%F"), tee_time: fifteen_sat_sec.strftime("%H:%M"),
# 	                 	s1: 8, s2: 3, s3: 7, s4: 7,
# 	                  s5: 5, s6: 3, s7: 5, s8: 6,
#                     s9: 7, s10: 4, s11: 3, s12: 5,
# 	                 	s13: 6, s14: 5, s15: 4, s16: 6,
# 	                 	s17: 7, s18: 6, handicap: 18,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 1,
# 	                 	p9: 2, p10: 2, p11: 1, p12: 3,
# 	                 	p13: 2, p14: 2, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 3,
# 	                 	score: 97, putts: 36)
# david.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_sec.strftime("%F"), tee_time: fifteen_sat_sec.strftime("%H:%M"),
# 	                 	s1: 3, s2: 4, s3: 7, s4: 5,
# 	                  s5: 5, s6: 5, s7: 8, s8: 7,
#                     s9: 7, s10: 6, s11: 5, s12: 4,
# 	                 	s13: 6, s14: 6, s15: 4, s16: 5,
# 	                 	s17: 6, s18: 9, handicap: 20,
# 	                 	p1: 1, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 1,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 2,
# 	                 	p13: 2, p14: 2, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 102, putts: 34)
# albino.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_sec.strftime("%F"), tee_time: fifteen_sat_sec.strftime("%H:%M"),
# 	                 	s1: 5, s2: 3, s3: 7, s4: 6,
# 	                  s5: 5, s6: 4, s7: 5, s8: 5,
#                     s9: 5, s10: 6, s11: 5, s12: 4,
# 	                 	s13: 5, s14: 5, s15: 3, s16: 5,
# 	                 	s17: 5, s18: 7, handicap: 14,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 3,
# 	                 	p13: 1, p14: 2, p15: 1, p16: 2,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 94, putts: 35)
# # Third
# damon.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_third.strftime("%F"), tee_time: fifteen_sat_third.strftime("%H:%M"),
# 	                 	s1: 5, s2: 4, s3: 11, s4: 9,
# 	                  s5: 8, s6: 8, s7: 6, s8: 6,
#                     s9: 6, s10: 5, s11: 6, s12: 6,
# 	                 	s13: 11, s14: 7, s15: 7, s16: 8,
# 	                 	s17: 8, s18: 8, handicap: 32,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 1,
# 	                 	p5: 2, p6: 3, p7: 2, p8: 1,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 3,
# 	                 	p13: 1, p14: 2, p15: 3, p16: 3,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 129, putts: 36)
# pat.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_third.strftime("%F"), tee_time: fifteen_sat_third.strftime("%H:%M"),
# 	                 	s1: 6, s2: 4, s3: 7, s4: 7,
# 	                  s5: 8, s6: 4, s7: 7, s8: 7,
#                     s9: 8, s10: 6, s11: 6, s12: 2,
# 	                 	s13: 7, s14: 9, s15: 9, s16: 7,
# 	                 	s17: 7, s18: 6, handicap: 32,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 1,
# 	                 	p13: 2, p14: 3, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 117, putts: 36)
# bryan.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_third.strftime("%F"), tee_time: fifteen_sat_third.strftime("%H:%M"),
# 	                 	s1: 5, s2: 3, s3: 7, s4: 5,
# 	                  s5: 4, s6: 4, s7: 6, s8: 5,
#                     s9: 6, s10: 5, s11: 4, s12: 4,
# 	                 	s13: 7, s14: 4, s15: 6, s16: 7,
# 	                 	s17: 6, s18: 6, handicap: 8,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 1, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 3, p11: 1, p12: 2,
# 	                 	p13: 3, p14: 2, p15: 2, p16: 3,
# 	                 	p17: 3, p18: 3,
# 	                 	score: 94, putts: 38)
# joel.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
# 	                 date_played: fifteen_sat_third.strftime("%F"), tee_time: fifteen_sat_third.strftime("%H:%M"),
# 	                 	s1: 4, s2: 4, s3: 6, s4: 6,
# 	                  s5: 4, s6: 4, s7: 5, s8: 8,
#                     s9: 6, s10: 4, s11: 3, s12: 4,
# 	                 	s13: 7, s14: 5, s15: 8, s16: 5,
# 	                 	s17: 4, s18: 4, handicap: 7,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 1, p12: 2,
# 	                 	p13: 2, p14: 3, p15: 2, p16: 2,
# 	                 	p17: 1, p18: 1,
# 	                 	score: 91, putts: 34)
#
# # Round Three
# fifteen_sun = DateTime.new(2015, 2, 8)
# fifteen_sun_first = DateTime.new(2015, 2, 8, 10, 50, 00)
# fifteen_sun_sec = DateTime.new(2015, 2, 8, 11, 00, 00)
# fifteen_sun_third = DateTime.new(2015, 2, 8, 11, 10, 00)
# # First
# greg.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_first.strftime("%F"), tee_time: fifteen_sun_first.strftime("%H:%M"),
# 	                 	s1: 6, s2: 6, s3: 5, s4: 6,
# 	                  s5: 6, s6: 5, s7: 7, s8: 6,
#                     s9: 5, s10: 5, s11: 3, s12: 7,
# 	                 	s13: 6, s14: 6, s15: 6, s16: 7,
# 	                 	s17: 7, s18: 10, handicap: 23,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 5, p6: 2, p7: 3, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 1, p12: 2,
# 	                 	p13: 2, p14: 3, p15: 3, p16: 2,
# 	                 	p17: 3, p18: 3,
# 	                 	score: 111, putts: 41)
# albino.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_first.strftime("%F"), tee_time: fifteen_sun_first.strftime("%H:%M"),
# 	                 	s1: 6, s2: 5, s3: 5, s4: 6,
# 	                  s5: 4, s6: 5, s7: 5, s8: 4,
#                     s9: 6, s10: 5, s11: 3, s12: 8,
# 	                 	s13: 5, s14: 7, s15: 8, s16: 6,
# 	                 	s17: 5, s18: 5, handicap: 14,
# 	                 	p1: 2, p2: 2, p3: 2, p4: 2,
# 	                 	p5: 2, p6: 3, p7: 2, p8: 2,
# 	                 	p9: 3, p10: 2, p11: 2, p12: 3,
# 	                 	p13: 2, p14: 3, p15: 2, p16: 2,
# 	                 	p17: 3, p18: 2,
# 	                 	score: 97, putts: 41)
# jack.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_first.strftime("%F"), tee_time: fifteen_sun_first.strftime("%H:%M"),
# 	                 	s1: 6, s2: 5, s3: 7, s4: 6,
# 	                  s5: 5, s6: 6, s7: 5, s8: 6,
#                     s9: 5, s10: 5, s11: 5, s12: 7,
# 	                 	s13: 5, s14: 6, s15: 6, s16: 8,
# 	                 	s17: 5, s18: 7, handicap: 25,
# 	                 	p1: 2, p2: 2, p3: 3, p4: 2,
# 	                 	p5: 3, p6: 2, p7: 2, p8: 3,
# 	                 	p9: 1, p10: 2, p11: 3, p12: 2,
# 	                 	p13: 1, p14: 2, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 3,
# 	                 	score: 105, putts: 39)
# joel.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_first.strftime("%F"), tee_time: fifteen_sun_first.strftime("%H:%M"),
# 	                 	s1: 5, s2: 4, s3: 6, s4: 5,
# 	                  s5: 4, s6: 4, s7: 6, s8: 3,
#                     s9: 5, s10: 3, s11: 4, s12: 5,
# 	                 	s13: 6, s14: 3, s15: 5, s16: 6,
# 	                 	s17: 4, s18: 5, handicap: 7,
# 	                 	p1: 3, p2: 2, p3: 2, p4: 3,
# 	                 	p5: 2, p6: 1, p7: 2, p8: 0,
# 	                 	p9: 3, p10: 2, p11: 2, p12: 2,
# 	                 	p13: 2, p14: 1, p15: 2, p16: 2,
# 	                 	p17: 3, p18: 1,
# 	                 	score: 84, putts: 35)
# # Second
# jeremy.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_sec.strftime("%F"), tee_time: fifteen_sun_sec.strftime("%H:%M"),
# 	                 	s1: 4, s2: 6, s3: 5, s4: 5,
# 	                  s5: 4, s6: 5, s7: 4, s8: 4,
#                     s9: 4, s10: 4, s11: 4, s12: 5,
# 	                 	s13: 3, s14: 3, s15: 5, s16: 7,
# 	                 	s17: 3, s18: 7, handicap: 13,
# 	                 	p1: 2, p2: 3, p3: 2, p4: 3,
# 	                 	p5: 3, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 3, p11: 2, p12: 2,
# 	                 	p13: 1, p14: 1, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 82, putts: 38)
# bryan.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_sec.strftime("%F"), tee_time: fifteen_sun_sec.strftime("%H:%M"),
# 	                 	s1: 5, s2: 6, s3: 5, s4: 6,
# 	                  s5: 4, s6: 4, s7: 5, s8: 5,
#                     s9: 4, s10: 4, s11: 4, s12: 5,
# 	                 	s13: 5, s14: 5, s15: 5, s16: 6,
# 	                 	s17: 5, s18: 7, handicap: 8,
# 	                 	p1: 2, p2: 2, p3: 1, p4: 2,
# 	                 	p5: 2, p6: 2, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 2,
# 	                 	p13: 1, p14: 2, p15: 2, p16: 2,
# 	                 	p17: 3, p18: 2,
# 	                 	score: 90, putts: 35)
# pat.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_sec.strftime("%F"), tee_time: fifteen_sun_sec.strftime("%H:%M"),
# 	                 	s1: 4, s2: 6, s3: 7, s4: 9,
# 	                  s5: 5, s6: 6, s7: 6, s8: 7,
#                     s9: 5, s10: 4, s11: 4, s12: 8,
# 	                 	s13: 10, s14: 5, s15: 6, s16: 7,
# 	                 	s17: 5, s18: 6, handicap: 32,
# 	                 	p1: 1, p2: 3, p3: 2, p4: 2,
# 	                 	p5: 3, p6: 2, p7: 3, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 2, p12: 3,
# 	                 	p13: 2, p14: 2, p15: 2, p16: 3,
# 	                 	p17: 3, p18: 2,
# 	                 	score: 107, putts: 42)
# payne.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course_id: 2,
# 	                 date_played: fifteen_sun_sec.strftime("%F"), tee_time: fifteen_sun_sec.strftime("%H:%M"),
# 	                 	s1: 5, s2: 5, s3: 7, s4: 5,
# 	                  s5: 4, s6: 4, s7: 6, s8: 5,
#                     s9: 6, s10: 4, s11: 4, s12: 5,
# 	                 	s13: 6, s14: 3, s15: 6, s16: 4,
# 	                 	s17: 5, s18: 7, handicap: 14,
# 	                 	p1: 3, p2: 1, p3: 2, p4: 2,
# 	                 	p5: 3, p6: 1, p7: 2, p8: 2,
# 	                 	p9: 2, p10: 2, p11: 3, p12: 2,
# 	                 	p13: 2, p14: 1, p15: 2, p16: 2,
# 	                 	p17: 3, p18: 2,
# 	                 	score: 91, putts: 37)
# # Third
# damon.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_third.strftime("%F"), tee_time: fifteen_sun_third.strftime("%H:%M"))
# cory.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_third.strftime("%F"), tee_time: fifteen_sun_third.strftime("%H:%M"),
# 	                 	s1: 5, s2: 6, s3: 7, s4: 7,
# 	                  s5: 6, s6: 6, s7: 6, s8: 5,
#                     s9: 5, s10: 3, s11: 4, s12: 7,
# 	                 	s13: 5, s14: 5, s15: 9, s16: 6,
# 	                 	s17: 4, s18: 8, handicap: 21,
# 	                 	p1: 2, p2: 2, p3: 3, p4: 3,
# 	                 	p5: 1, p6: 2, p7: 2, p8: 1,
# 	                 	p9: 3, p10: 2, p11: 3, p12: 3,
# 	                 	p13: 3, p14: 2, p15: 2, p16: 1,
# 	                 	p17: 1, p18: 3,
# 	                 	score: 104, putts: 39)
# dan.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_third.strftime("%F"), tee_time: fifteen_sun_third.strftime("%H:%M"),
# 	                 	s1: 4, s2: 6, s3: 7, s4: 6,
# 	                  s5: 4, s6: 5, s7: 7, s8: 7,
#                     s9: 4, s10: 4, s11: 3, s12: 6,
# 	                 	s13: 9, s14: 5, s15: 7, s16: 5,
# 	                 	s17: 5, s18: 7, handicap: 18,
# 	                 	p1: 2, p2: 1, p3: 3, p4: 2,
# 	                 	p5: 3, p6: 2, p7: 2, p8: 3,
# 	                 	p9: 1, p10: 2, p11: 2, p12: 2,
# 	                 	p13: 2, p14: 3, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 96, putts: 38)
# david.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
# 	                 date_played: fifteen_sun_third.strftime("%F"), tee_time: fifteen_sun_third.strftime("%H:%M"),
# 	                 	s1: 4, s2: 6, s3: 6, s4: 5,
# 	                  s5: 5, s6: 4, s7: 6, s8: 6,
#                     s9: 7, s10: 5, s11: 6, s12: 5,
# 	                 	s13: 6, s14: 4, s15: 6, s16: 7,
# 	                 	s17: 4, s18: 6, handicap: 20,
# 	                 	p1: 1, p2: 3, p3: 3, p4: 1,
# 	                 	p5: 2, p6: 1, p7: 2, p8: 3,
# 	                 	p9: 3, p10: 3, p11: 3, p12: 1,
# 	                 	p13: 3, p14: 2, p15: 2, p16: 2,
# 	                 	p17: 2, p18: 2,
# 	                 	score: 98, putts: 39)
#
#






# test_tourn = Tournament.create(name: 'Royal JBS Tournament', year: 2016, num_players: 140, num_rounds: 1, end_date: DateTime.new(2016, 6, 13))
# round_one = test_tourn.tournament_rounds.create(round_number: 1)

# users.each do |user|
#   sc = round_one.scorecards.create(user_id: user.id, new_course_id: 1)
#   (1..18).each {|x| sc.user_scores.create(number: x, score: rand(2..7))}
# end
