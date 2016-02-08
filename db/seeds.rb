joel = User.create!(username: 'Joel Brady', handicap: 7.6, email: 'joel@mail.com', home: 'Portland, OR', password: 'brady1234', password_confirmation: 'brady1234', admin: true)
bryan = User.create!(username: 'Bryan Hellum', handicap: 8, email: 'bhellum@gmail.com', home: nil, password: 'hellum1234', password_confirmation: 'hellum1234')
payne = User.create!(username: 'Mike Payne', handicap: 14, email: 'michaeljamespayne@yahoo.com', home: nil, password: 'payne1234', password_confirmation: 'payne1234')
cory = User.create!(username: 'Cory Booth', handicap: 21, email: 'coryjbooth@gmail.com', home: nil, password: 'booth1234', password_confirmation: 'booth1234')
jack = User.create!(username: 'Jack Weast', handicap: 25, email: 'jack.weast@intel.com', home: nil, password: 'weast1234', password_confirmation: 'weast1234')
damon = User.create!(username: 'Damon Sullivan', handicap: 36, email: 'damon.sullivan@thugdesign.com', home: nil, password: 'sullivan1234', password_confirmation: 'sullivan1234')
pat = User.create!(username: 'Pat Anderson', handicap: 36, email: 'patrick.edward.anderson@gmail.com', home: nil, password: 'anderson1234', password_confirmation: 'anderson1234')
robb = User.create!(username: 'Robb Page', handicap: 6.5, email: 'theswine19@gmail.com', home: nil, password: 'page1234', password_confirmation: 'page1234')
scott = User.create!(username: 'Scott Kovesdy', handicap: nil, email: 'skovesdy@msn.com', home: nil, password: 'kovesdy1234', password_confirmation: 'kovesdy1234')
rory = User.create!(username: 'Rory Tarquinio', handicap: nil, email: 'rtarquinio10@gmail.com', home: nil, password: 'tarquinio1234', password_confirmation: 'tarquinio1234')
albino = User.create!(username: 'Albino Duran', handicap: 14, email: 'albino.duran@verizon.com', home: nil, password: 'duran1234', password_confirmation: 'duran1234')
greg = User.create!(username: 'Greg Smith', handicap: 23, email: 'grs@yurik.net', home: nil, password: 'smith1234', password_confirmation: 'smith1234')
rich = User.create!(username: 'Rich Guisti', handicap: nil, email: 'rich.giusti@masergy.com', home: nil, password: 'guisti1234', password_confirmation: 'guisti1234')
dan = User.create!(username: 'Dan Jablonski', handicap: 18, email: 'daniel.jablonski@verizon.com', home: nil, password: 'jablonski1234', password_confirmation: 'jablonski1234')
eric = User.create!(username: 'Eric Fox', handicap: nil, email: 'theazfoxes@mac.com', home: nil, password: 'fox12345', password_confirmation: 'fox12345')
matt = User.create!(username: 'Matt James', handicap: nil, email: 'mjiggity@gmail.com', home: nil, password: 'james1234', password_confirmation: 'james1234')
jeremy = User.create!(username: 'Jeremy Emerson', handicap: 14, email: 'jeremy@wrightstrategies.com', home: nil, password: 'emerson1234', password_confirmation: 'emerson1234')
david = User.create!(username: 'David Sanda', handicap: 21.8, email: 'david.sanda@verizon.com', home: nil, password: 'sanda1234', password_confirmation: 'sanda1234')

bandon = Course.create!(par: 72, yardage: 6221, name: 'Bandon Dunes', rating: 71.4, slope: 133, tee: 'Green', city: 'Bandon', state: 'Oregon',
  scorecard: {
		h1_yds: 352, h1_par: 4, h1_hcap: 13,
	  h2_yds: 155, h2_par: 3, h2_hcap: 15,
		h3_yds: 489, h3_par: 5, h3_hcap: 3,
	  h4_yds: 362, h4_par: 4, h4_hcap: 5,
	  h5_yds: 400, h5_par: 4, h5_hcap: 1,
    h6_yds: 153, h6_par: 3, h6_hcap: 17,
		h7_yds: 372, h7_par: 4, h7hcap: 7,
		h8_yds: 342, h8_par: 4, h8_hcap: 11,
	  h9_yds: 520, h9_par: 5, h9_hcap: 9,
    out_yds: 3145, out_par: 36,
    h10_yds: 339, h10_par: 4, h10_hcap: 8,
		h11_yds: 351, h11_par: 4, h11_hcap: 2,
		h12_yds: 153, h12_par: 3, h12_hcap: 18,
		h13_yds: 537, h13_par: 5, h13_hcap: 6,
		h14_yds: 332, h14_par: 4, h14_hcap: 16,
		h15_yds: 131, h15_par: 3, h15_hcap: 14,
		h16_yds: 345, h16_par: 4, h16_hcap: 10,
		h17_yds: 375, h17_par: 4, h17_hcap: 12,
		h18_yds: 513, h18_par: 5, h18_hcap: 4,
		in_yds: 3076, in_par: 36 })

pacific = Course.create!(par: 71, yardage: 6142, name: 'Pacific Dunes', rating: 70.7, slope: 133, tee: 'Green', city: 'Bandon', state: 'Oregon',
	 scorecard: {
		h1_yds: 304, h1_par: 4, h1_hcap: 9,
	  h2_yds: 335, h2_par: 4, h2_hcap: 11,
		h3_yds: 476, h3_par: 5, h3_hcap: 7,
	  h4_yds: 449, h4_par: 4, h4_hcap: 3,
	  h5_yds: 181, h5_par: 3, h5_hcap: 17,
    h6_yds: 288, h6_par: 4, h6_hcap: 13,
		h7_yds: 436, h7_par: 4, h7hcap: 1,
		h8_yds: 369, h8_par: 4, h8_hcap: 5,
	  h9_yds: 379, h9_par: 4, h9_hcap: 15,
    out_yds: 3217, out_par: 36,
    h10_yds: 163, h10_par: 3, h10_hcap: 14,
		h11_yds: 131, h11_par: 3, h11_hcap: 18,
		h12_yds: 507, h12_par: 5, h12_hcap: 6,
		h13_yds: 390, h13_par: 4, h13_hcap: 2,
		h14_yds: 128, h14_par: 3, h14_hcap: 16,
		h15_yds: 504, h15_par: 5, h15_hcap: 10,
		h16_yds: 338, h16_par: 4, h16_hcap: 12,
		h17_yds: 189, h17_par: 3, h17_hcap: 8,
		h18_yds: 575, h18_par: 5, h18_hcap: 4,
		in_yds: 2925, in_par: 35 })

trails = Course.create!(par: 71, yardage: 6247, name: 'Bandon Trails', rating: 71.1, slope: 129, tee: 'Green', city: 'Bandon', state: 'Oregon',
	scorecard: {
		h1_yds: 356, h1_par: 4, h1_hcap: 13,
	  h2_yds: 166, h2_par: 3, h2_hcap: 17,
		h3_yds: 532, h3_par: 5, h3_hcap: 3,
	  h4_yds: 363, h4_par: 4, h4_hcap: 5,
	  h5_yds: 124, h5_par: 3, h5_hcap: 15,
    h6_yds: 359, h6_par: 4, h6_hcap: 9,
		h7_yds: 406, h7_par: 4, h7hcap: 7,
		h8_yds: 299, h8_par: 4, h8_hcap: 11,
	  h9_yds: 522, h9_par: 5, h9_hcap: 1,
    out_yds: 3127, out_par: 36,
    h10_yds: 393, h10_par: 4, h10_hcap: 10,
		h11_yds: 429, h11_par: 4, h11_hcap: 4,
		h12_yds: 235, h12_par: 3, h12_hcap: 18,
		h13_yds: 374, h13_par: 4, h13_hcap: 12,
		h14_yds: 306, h14_par: 4, h14_hcap: 14,
		h15_yds: 367, h15_par: 4, h15_hcap: 8,
		h16_yds: 494, h16_par: 5, h16_hcap: 2,
		h17_yds: 159, h17_par: 3, h17_hcap: 16,
		h18_yds: 363, h18_par: 4, h18_hcap: 6,
		in_yds: 3120, in_par: 35 })

old_mac = Course.create(par: 71, yardage: 6320, name: 'Old MacDonald', rating: 71.6, slope: 125, tee: 'Green', city: 'Bandon', state: 'Oregon',
	scorecard: {
		h1_yds: 304, h1_par: 4, h1_hcap: 11,
	  h2_yds: 162, h2_par: 3, h2_hcap: 15,
		h3_yds: 345, h3_par: 4, h3_hcap: 9,
	  h4_yds: 472, h4_par: 4, h4_hcap: 1,
	  h5_yds: 134, h5_par: 3, h5_hcap: 17,
    h6_yds: 520, h6_par: 5, h6_hcap: 3,
		h7_yds: 345, h7_par: 4, h7hcap: 5,
		h8_yds: 170, h8_par: 3, h8_hcap: 13,
	  h9_yds: 352, h9_par: 4, h9_hcap: 7,
    out_yds: 2804, out_par: 34,
    h10_yds: 440, h10_par: 4, h10_hcap: 6,
		h11_yds: 399, h11_par: 4, h11_hcap: 4,
		h12_yds: 205, h12_par: 3, h12_hcap: 16,
		h13_yds: 319, h13_par: 4, h13_hcap: 18,
		h14_yds: 297, h14_par: 4, h14_hcap: 14,
		h15_yds: 482, h15_par: 5, h15_hcap: 12,
		h16_yds: 433, h16_par: 4, h16_hcap: 2,
		h17_yds: 515, h17_par: 5, h17_hcap: 10,
		h18_yds: 426, h18_par: 4, h18_hcap: 8,
		in_yds: 3516, in_par: 37 })

bandon_2016 = Tournament.create!(name: 'Bandon', year: 2016, num_players: 16, num_rounds: 3,
														 end_date: DateTime.new(2016, 3, 19,18,00,00))
# Round One
fri = DateTime.new(2016, 3, 17)
fri_first = DateTime.new(2016, 3, 17, 9, 40, 00)
fri_sec = DateTime.new(2016, 3, 17, 9, 50, 00)
fri_third = DateTime.new(2016, 3, 17, 10, 00, 00)
fri_fourth = DateTime.new(2016, 3, 17, 10, 10, 00)
# First
payne.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_first.strftime("%F"), tee_time: fri_first.strftime("%H:%M"))
cory.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_first.strftime("%F"), tee_time: fri_first.strftime("%H:%M"))
jack.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_first.strftime("%F"), tee_time: fri_first.strftime("%H:%M"))
robb.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_first.strftime("%F"), tee_time: fri_first.strftime("%H:%M"))
# Second
scott.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_sec.strftime("%F"), tee_time: fri_sec.strftime("%H:%M"))
eric.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_sec.strftime("%F"), tee_time: fri_sec.strftime("%H:%M"))
rory.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_sec.strftime("%F"), tee_time: fri_sec.strftime("%H:%M"))
rich.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_sec.strftime("%F"), tee_time: fri_sec.strftime("%H:%M"))
# Third
albino.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_third.strftime("%F"), tee_time: fri_third.strftime("%H:%M"))
dan.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_third.strftime("%F"), tee_time: fri_third.strftime("%H:%M"))
greg.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_third.strftime("%F"), tee_time: fri_third.strftime("%H:%M"))
matt.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_third.strftime("%F"), tee_time: fri_third.strftime("%H:%M"))
# Fourth
joel.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_fourth.strftime("%F"), tee_time: fri_fourth.strftime("%H:%M"))
bryan.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_fourth.strftime("%F"), tee_time: fri_fourth.strftime("%H:%M"))
damon.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_fourth.strftime("%F"), tee_time: fri_fourth.strftime("%H:%M"))
pat.rounds.create!(tournament_id: bandon_2016.id, round_num: 1, course: trails,
	                 date_played: fri_fourth.strftime("%F"), tee_time: fri_fourth.strftime("%H:%M"))

# Round Two
sat = DateTime.new(2016, 3, 18)
sat_first = DateTime.new(2016, 3, 18, 10, 10, 00)
sat_sec = DateTime.new(2016, 3, 18, 10, 20, 00)
sat_third = DateTime.new(2016, 3, 18, 10, 30, 00)
sat_fourth = DateTime.new(2016, 3, 18, 10, 40, 00)
# First
payne.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_first.strftime("%F"), tee_time: sat_first.strftime("%H:%M"))
cory.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_first.strftime("%F"), tee_time: sat_first.strftime("%H:%M"))
jack.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_first.strftime("%F"), tee_time: sat_first.strftime("%H:%M"))
robb.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_first.strftime("%F"), tee_time: sat_first.strftime("%H:%M"))
# Second
scott.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_sec.strftime("%F"), tee_time: sat_sec.strftime("%H:%M"))
eric.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_sec.strftime("%F"), tee_time: sat_sec.strftime("%H:%M"))
rory.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_sec.strftime("%F"), tee_time: sat_sec.strftime("%H:%M"))
rich.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_sec.strftime("%F"), tee_time: sat_sec.strftime("%H:%M"))
# Third
albino.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_third.strftime("%F"), tee_time: sat_third.strftime("%H:%M"))
dan.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_third.strftime("%F"), tee_time: sat_third.strftime("%H:%M"))
greg.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_third.strftime("%F"), tee_time: sat_third.strftime("%H:%M"))
matt.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_third.strftime("%F"), tee_time: sat_third.strftime("%H:%M"))
# Fourth
joel.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_fourth.strftime("%F"), tee_time: sat_fourth.strftime("%H:%M"))
bryan.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_fourth.strftime("%F"), tee_time: sat_fourth.strftime("%H:%M"))
damon.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_fourth.strftime("%F"), tee_time: sat_fourth.strftime("%H:%M"))
pat.rounds.create!(tournament_id: bandon_2016.id, round_num: 2, course: old_mac,
	                 date_played: sat_fourth.strftime("%F"), tee_time: sat_fourth.strftime("%H:%M"))

# Round Three
sun = DateTime.new(2016, 3, 19)
sun_first = DateTime.new(2016, 3, 19, 10, 20, 00)
sun_sec = DateTime.new(2016, 3, 19, 10, 30, 00)
sun_third = DateTime.new(2016, 3, 19, 10, 40, 00)
sun_fourth = DateTime.new(2016, 3, 19, 10, 50, 00)
# First
payne.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_first.strftime("%F"), tee_time: sun_first.strftime("%H:%M"))
cory.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_first.strftime("%F"), tee_time: sun_first.strftime("%H:%M"))
jack.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_first.strftime("%F"), tee_time: sun_first.strftime("%H:%M"))
robb.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_first.strftime("%F"), tee_time: sun_first.strftime("%H:%M"))
# Second
scott.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_sec.strftime("%F"), tee_time: sun_sec.strftime("%H:%M"))
eric.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_sec.strftime("%F"), tee_time: sun_sec.strftime("%H:%M"))
rory.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_sec.strftime("%F"), tee_time: sun_sec.strftime("%H:%M"))
rich.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_sec.strftime("%F"), tee_time: sun_sec.strftime("%H:%M"))
# Third
albino.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_third.strftime("%F"), tee_time: sun_third.strftime("%H:%M"))
dan.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_third.strftime("%F"), tee_time: sun_third.strftime("%H:%M"))
greg.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_third.strftime("%F"), tee_time: sun_third.strftime("%H:%M"))
matt.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_third.strftime("%F"), tee_time: sun_third.strftime("%H:%M"))
# Fourth
joel.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_fourth.strftime("%F"), tee_time: sun_fourth.strftime("%H:%M"))
bryan.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_fourth.strftime("%F"), tee_time: sun_fourth.strftime("%H:%M"))
damon.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_fourth.strftime("%F"), tee_time: sun_fourth.strftime("%H:%M"))
pat.rounds.create!(tournament_id: bandon_2016.id, round_num: 3, course: bandon,
	                 date_played: sun_fourth.strftime("%F"), tee_time: sun_fourth.strftime("%H:%M"))

# Bandon 2015
bandon_2015 = Tournament.create!(name: 'Bandon', year: 2015, num_players: 12, num_rounds: 3,
														 end_date: DateTime.new(2015, 2, 8,18,00,00))

# Round One
fifteen_fri = DateTime.new(2015, 2, 6)
fifteen_fri_first = DateTime.new(2015, 2, 6, 9, 50, 00)
fifteen_fri_sec = DateTime.new(2015, 2, 6, 10, 00, 00)
fifteen_fri_third = DateTime.new(2015, 2, 6, 10, 10, 00)
# First
payne.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_first.strftime("%F"), tee_time: fifteen_fri_first.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 7, h2_shots: 4, h3_shots: 6, h4_shots: 6,
	                  h5_shots: 5, h6_shots: 5, h7_shots: 6, h8_shots: 5,
	                 	h9_shots: 7, h10_shots: 4, h11_shots: 6, h12_shots: 3,
	                 	h13_shots: 5, h14_shots: 6, h15_shots: 4, h16_shots: 7,
	                 	h17_shots: 3, h18_shots: 4}, handicap: 14,
	                 putts_card: {
	                 	h1_putts: 3, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 3, h6_putts: 1, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 1,
	                 	h13_putts: 2, h14_putts: 1, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 93, putts: 35)

cory.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_first.strftime("%F"), tee_time: fifteen_fri_first.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 7, h2_shots: 4, h3_shots: 9, h4_shots: 6,
	                  h5_shots: 3, h6_shots: 5, h7_shots: 5, h8_shots: 7,
                  	h9_shots: 9, h10_shots: 6, h11_shots: 10, h12_shots: 4,
	                 	h13_shots: 5, h14_shots: 6, h15_shots: 7, h16_shots: 10,
	                 	h17_shots: 5, h18_shots: 5}, handicap: 21,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 3, h4_putts: 3,
	                 	h5_putts: 1, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 3, h10_putts: 2, h11_putts: 3, h12_putts: 2,
	                 	h13_putts: 1, h14_putts: 2, h15_putts: 3, h16_putts: 2,
	                 	h17_putts: 3, h18_putts: 2 },
	                 	score: 113, putts: 37)
damon.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_first.strftime("%F"), tee_time: fifteen_fri_first.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 6, h2_shots: 8, h3_shots: 9, h4_shots: 8,
	                  h5_shots: 4, h6_shots: 5, h7_shots: 9, h8_shots: 5,
                  	h9_shots: 8, h10_shots: 5, h11_shots: 7, h12_shots: 6,
	                 	h13_shots: 11, h14_shots: 10, h15_shots: 10, h16_shots: 12,
	                 	h17_shots: 10, h18_shots: 11}, handicap: 32,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 3,
	                 	h5_putts: 1, h6_putts: 2, h7_putts: 2, h8_putts: 3,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 2, h14_putts: 2, h15_putts: 2, h16_putts: 3,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 144, putts: 39)
bryan.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_first.strftime("%F"), tee_time: fifteen_fri_first.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 6, h2_shots: 5, h3_shots: 6, h4_shots: 5,
	                  h5_shots: 5, h6_shots: 5, h7_shots: 6, h8_shots: 6,
                  	h9_shots: 5, h10_shots: 4, h11_shots: 5, h12_shots: 4,
	                 	h13_shots: 4, h14_shots: 6, h15_shots: 3, h16_shots: 6,
	                 	h17_shots: 5, h18_shots: 5}, handicap: 8,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 3, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 3, h6_putts: 2, h7_putts: 2, h8_putts: 1,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 2, h14_putts: 2, h15_putts: 1, h16_putts: 2,
	                 	h17_putts: 1, h18_putts: 2 },
	                 	score: 92, putts: 36)
# Second
jack.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_sec.strftime("%F"), tee_time: fifteen_fri_sec.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 6, h2_shots: 6, h3_shots: 6, h4_shots: 6,
	                  h5_shots: 4, h6_shots: 9, h7_shots: 7, h8_shots: 4,
                  	h9_shots: 6, h10_shots: 9, h11_shots: 8, h12_shots: 5,
	                 	h13_shots: 4, h14_shots: 11, h15_shots: 7, h16_shots: 8,
	                 	h17_shots: 8, h18_shots: 5}, handicap: 25,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 3, h3_putts: 1, h4_putts: 2,
	                 	h5_putts: 1, h6_putts: 1, h7_putts: 3, h8_putts: 1,
	                 	h9_putts: 1, h10_putts: 2, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 1, h14_putts: 2, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 1, h18_putts: 2 },
	                 	score: 119, putts: 31)
jeremy.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_sec.strftime("%F"), tee_time: fifteen_fri_sec.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 5, h2_shots: 4, h3_shots: 7, h4_shots: 7,
	                  h5_shots: 2, h6_shots: 4, h7_shots: 5, h8_shots: 6,
                  	h9_shots: 5, h10_shots: 7, h11_shots: 6, h12_shots: 5,
	                 	h13_shots: 6, h14_shots: 5, h15_shots: 5, h16_shots: 6,
	                 	h17_shots: 5, h18_shots: 4}, handicap: 13,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 3, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 1, h6_putts: 1, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 3, h12_putts: 2,
	                 	h13_putts: 3, h14_putts: 3, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 1 },
	                 	score: 94, putts: 37)
greg.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_sec.strftime("%F"), tee_time: fifteen_fri_sec.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 6, h2_shots: 7, h3_shots: 10, h4_shots: 4,
	                  h5_shots: 4, h6_shots: 9, h7_shots: 6, h8_shots: 5,
                  	h9_shots: 7, h10_shots: 5, h11_shots: 6, h12_shots: 6,
	                 	h13_shots: 7, h14_shots: 8, h15_shots: 6, h16_shots: 8,
	                 	h17_shots: 7, h18_shots: 8}, handicap: 23,
	                 putts_card: {
	                 	h1_putts: 1, h2_putts: 2, h3_putts: 3, h4_putts: 2,
	                 	h5_putts: 1, h6_putts: 3, h7_putts: 3, h8_putts: 1,
	                 	h9_putts: 2, h10_putts: 3, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 3, h14_putts: 3, h15_putts: 2, h16_putts: 4,
	                 	h17_putts: 2, h18_putts: 3 },
	                 	score: 119, putts: 42)
dan.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_sec.strftime("%F"), tee_time: fifteen_fri_sec.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 7, h2_shots: 5, h3_shots: 7, h4_shots: 6,
	                  h5_shots: 3, h6_shots: 5, h7_shots: 5, h8_shots: 5,
                  	h9_shots: 6, h10_shots: 9, h11_shots: 8, h12_shots: 4,
	                 	h13_shots: 6, h14_shots: 9, h15_shots: 5, h16_shots: 4,
	                 	h17_shots: 4, h18_shots: 4}, handicap: 18,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 1, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 3, h8_putts: 3,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 2, h14_putts: 3, h15_putts: 2, h16_putts: 1,
	                 	h17_putts: 1, h18_putts: 2 },
	                 	score: 102, putts: 36)
# Third
david.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_third.strftime("%F"), tee_time: fifteen_fri_third.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 10, h2_shots: 5, h3_shots: 5, h4_shots: 6,
	                  h5_shots: 3, h6_shots: 6, h7_shots: 5, h8_shots: 5,
                  	h9_shots: 9, h10_shots: 6, h11_shots: 5, h12_shots: 4,
	                 	h13_shots: 6, h14_shots: 6, h15_shots: 6, h16_shots: 6,
	                 	h17_shots: 4, h18_shots: 7}, handicap: 20,
	                 putts_card: {
	                 	h1_putts: 4, h2_putts: 3, h3_putts: 1, h4_putts: 3,
	                 	h5_putts: 2, h6_putts: 3, h7_putts: 2, h8_putts: 3,
	                 	h9_putts: 3, h10_putts: 3, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 3, h14_putts: 3, h15_putts: 3, h16_putts: 3,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 104, putts: 48)
albino.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_third.strftime("%F"), tee_time: fifteen_fri_third.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 7, h2_shots: 3, h3_shots: 7, h4_shots: 8,
	                  h5_shots: 4, h6_shots: 5, h7_shots: 6, h8_shots: 6,
                  	h9_shots: 5, h10_shots: 4, h11_shots: 6, h12_shots: 3,
	                 	h13_shots: 6, h14_shots: 5, h15_shots: 4, h16_shots: 7,
	                 	h17_shots: 5, h18_shots: 6}, handicap: 14,
	                 putts_card: {
	                 	h1_putts: 1, h2_putts: 1, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 3, h6_putts: 2, h7_putts: 3, h8_putts: 3,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 3, h14_putts: 3, h15_putts: 1, h16_putts: 3,
	                 	h17_putts: 1, h18_putts: 2 },
	                 	score: 97, putts: 38)
joel.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_third.strftime("%F"), tee_time: fifteen_fri_third.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 8, h2_shots: 4, h3_shots: 5, h4_shots: 4,
	                  h5_shots: 3, h6_shots: 4, h7_shots: 5, h8_shots: 5,
                  	h9_shots: 5, h10_shots: 2, h11_shots: 5, h12_shots: 4,
	                 	h13_shots: 7, h14_shots: 5, h15_shots: 5, h16_shots: 6,
	                 	h17_shots: 2, h18_shots: 4}, handicap: 7,
	                 putts_card: {
	                 	h1_putts: 3, h2_putts: 2, h3_putts: 1, h4_putts: 2,
	                 	h5_putts: 1, h6_putts: 1, h7_putts: 2, h8_putts: 1,
	                 	h9_putts: 2, h10_putts: 0, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 3, h14_putts: 1, h15_putts: 2, h16_putts: 1,
	                 	h17_putts: 1, h18_putts: 1 },
	                 	score: 83, putts: 29)
pat.rounds.create!(tournament_id: bandon_2015.id, round_num: 1, course: trails,
	                 date_played: fifteen_fri_third.strftime("%F"), tee_time: fifteen_fri_third.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 8, h2_shots: 8, h3_shots: 7, h4_shots: 8,
	                  h5_shots: 3, h6_shots: 5, h7_shots: 10, h8_shots: 6,
                  	h9_shots: 7, h10_shots: 5, h11_shots: 6, h12_shots: 5,
	                 	h13_shots: 6, h14_shots: 6, h15_shots: 7, h16_shots: 8,
	                 	h17_shots: 5, h18_shots: 6}, handicap: 32,
	                 putts_card: {
	                 	h1_putts: 3, h2_putts: 2, h3_putts: 2, h4_putts: 3,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 3, h14_putts: 2, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 116, putts: 40)

# Round Two
fifteen_sat = DateTime.new(2015, 2, 7)
fifteen_sat_first = DateTime.new(2015, 2, 7, 10, 30, 00)
fifteen_sat_sec = DateTime.new(2015, 2, 7, 10, 40, 00)
fifteen_sat_third = DateTime.new(2015, 2, 7, 10, 50, 00)
# First
payne.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_first.strftime("%F"), tee_time: fifteen_sat_first.strftime("%H:%M"),
 									 shots_card: {
	                 	h1_shots: 4, h2_shots: 4, h3_shots: 6, h4_shots: 6,
	                  h5_shots: 5, h6_shots: 6, h7_shots: 6, h8_shots: 5,
                    h9_shots: 7, h10_shots: 4, h11_shots: 5, h12_shots: 4,
	                 	h13_shots: 6, h14_shots: 6, h15_shots: 4, h16_shots: 7,
	                 	h17_shots: 5, h18_shots: 8}, handicap: 14,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 1, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 1, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 2, h14_putts: 2, h15_putts: 2, h16_putts: 3,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 98, putts: 35)
cory.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_first.strftime("%F"), tee_time: fifteen_sat_first.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 7, h2_shots: 4, h3_shots: 10, h4_shots: 10,
	                  h5_shots: 9, h6_shots: 3, h7_shots: 9, h8_shots: 7,
                    h9_shots: 6, h10_shots: 5, h11_shots: 6, h12_shots: 6,
	                 	h13_shots: 7, h14_shots: 7, h15_shots: 5, h16_shots: 6,
	                 	h17_shots: 5, h18_shots: 8}, handicap: 21,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 1, h10_putts: 2, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 3, h14_putts: 2, h15_putts: 2, h16_putts: 3,
	                 	h17_putts: 2, h18_putts: 3 },
	                 	score: 120, putts: 38)
jack.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_first.strftime("%F"), tee_time: fifteen_sat_first.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 6, h2_shots: 7, h3_shots: 7, h4_shots: 6,
	                  h5_shots: 8, h6_shots: 5, h7_shots: 6, h8_shots: 4,
                    h9_shots: 6, h10_shots: 7, h11_shots: 5, h12_shots: 5,
	                 	h13_shots: 10, h14_shots: 5, h15_shots: 3, h16_shots: 9,
	                 	h17_shots: 7, h18_shots: 10}, handicap: 25,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 1,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 2, h14_putts: 2, h15_putts: 2, h16_putts: 1,
	                 	h17_putts: 3, h18_putts: 3 },
	                 	score: 116, putts: 37)
jeremy.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_first.strftime("%F"), tee_time: fifteen_sat_first.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 6, h2_shots: 4, h3_shots: 5, h4_shots: 5,
	                  h5_shots: 5, h6_shots: 3, h7_shots: 6, h8_shots: 6,
                    h9_shots: 7, h10_shots: 6, h11_shots: 4, h12_shots: 4,
	                 	h13_shots: 6, h14_shots: 6, h15_shots: 6, h16_shots: 4,
	                 	h17_shots: 5, h18_shots: 6}, handicap: 13,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 1,
	                 	h9_putts: 2, h10_putts: 3, h11_putts: 1, h12_putts: 2,
	                 	h13_putts: 2, h14_putts: 3, h15_putts: 3, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 1 },
	                 	score: 94, putts: 36)
# Second
greg.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_sec.strftime("%F"), tee_time: fifteen_sat_sec.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 7, h2_shots: 7, h3_shots: 7, h4_shots: 8,
	                  h5_shots: 6, h6_shots: 4, h7_shots: 8, h8_shots: 6,
                    h9_shots: 7, h10_shots: 6, h11_shots: 6, h12_shots: 5,
	                 	h13_shots: 7, h14_shots: 4, h15_shots: 3, h16_shots: 6,
	                 	h17_shots: 5, h18_shots: 6}, handicap: 23,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 1, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 1, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 3, h14_putts: 1, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 108, putts: 35)
dan.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_sec.strftime("%F"), tee_time: fifteen_sat_sec.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 8, h2_shots: 3, h3_shots: 7, h4_shots: 7,
	                  h5_shots: 5, h6_shots: 3, h7_shots: 5, h8_shots: 6,
                    h9_shots: 7, h10_shots: 4, h11_shots: 3, h12_shots: 5,
	                 	h13_shots: 6, h14_shots: 5, h15_shots: 4, h16_shots: 6,
	                 	h17_shots: 7, h18_shots: 6}, handicap: 18,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 1,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 1, h12_putts: 3,
	                 	h13_putts: 2, h14_putts: 2, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 3 },
	                 	score: 97, putts: 36)
david.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_sec.strftime("%F"), tee_time: fifteen_sat_sec.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 3, h2_shots: 4, h3_shots: 7, h4_shots: 5,
	                  h5_shots: 5, h6_shots: 5, h7_shots: 8, h8_shots: 7,
                    h9_shots: 7, h10_shots: 6, h11_shots: 5, h12_shots: 4,
	                 	h13_shots: 6, h14_shots: 6, h15_shots: 4, h16_shots: 5,
	                 	h17_shots: 6, h18_shots: 9}, handicap: 20,
	                 putts_card: {
	                 	h1_putts: 1, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 1,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 2, h14_putts: 2, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 102, putts: 34)
albino.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_sec.strftime("%F"), tee_time: fifteen_sat_sec.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 5, h2_shots: 3, h3_shots: 7, h4_shots: 6,
	                  h5_shots: 5, h6_shots: 4, h7_shots: 5, h8_shots: 5,
                    h9_shots: 5, h10_shots: 6, h11_shots: 5, h12_shots: 4,
	                 	h13_shots: 5, h14_shots: 5, h15_shots: 3, h16_shots: 5,
	                 	h17_shots: 5, h18_shots: 7}, handicap: 14,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 1, h14_putts: 2, h15_putts: 1, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 94, putts: 35)
# Third
damon.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_third.strftime("%F"), tee_time: fifteen_sat_third.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 5, h2_shots: 4, h3_shots: 11, h4_shots: 9,
	                  h5_shots: 8, h6_shots: 8, h7_shots: 6, h8_shots: 6,
                    h9_shots: 6, h10_shots: 5, h11_shots: 6, h12_shots: 6,
	                 	h13_shots: 11, h14_shots: 7, h15_shots: 7, h16_shots: 8,
	                 	h17_shots: 8, h18_shots: 8}, handicap: 32,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 1,
	                 	h5_putts: 2, h6_putts: 3, h7_putts: 2, h8_putts: 1,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 1, h14_putts: 2, h15_putts: 3, h16_putts: 3,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 129, putts: 36)
pat.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_third.strftime("%F"), tee_time: fifteen_sat_third.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 6, h2_shots: 4, h3_shots: 7, h4_shots: 7,
	                  h5_shots: 8, h6_shots: 4, h7_shots: 7, h8_shots: 7,
                    h9_shots: 8, h10_shots: 6, h11_shots: 6, h12_shots: 2,
	                 	h13_shots: 7, h14_shots: 9, h15_shots: 9, h16_shots: 7,
	                 	h17_shots: 7, h18_shots: 6}, handicap: 32,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 1,
	                 	h13_putts: 2, h14_putts: 3, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 117, putts: 36)
bryan.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_third.strftime("%F"), tee_time: fifteen_sat_third.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 5, h2_shots: 3, h3_shots: 7, h4_shots: 5,
	                  h5_shots: 4, h6_shots: 4, h7_shots: 6, h8_shots: 5,
                    h9_shots: 6, h10_shots: 5, h11_shots: 4, h12_shots: 4,
	                 	h13_shots: 7, h14_shots: 4, h15_shots: 6, h16_shots: 7,
	                 	h17_shots: 6, h18_shots: 6}, handicap: 8,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 1, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 3, h11_putts: 1, h12_putts: 2,
	                 	h13_putts: 3, h14_putts: 2, h15_putts: 2, h16_putts: 3,
	                 	h17_putts: 3, h18_putts: 3 },
	                 	score: 94, putts: 38)
joel.rounds.create!(tournament_id: bandon_2015.id, round_num: 2, course: bandon,
	                 date_played: fifteen_sat_third.strftime("%F"), tee_time: fifteen_sat_third.strftime("%H:%M"),
	                 shots_card: {
	                 	h1_shots: 4, h2_shots: 4, h3_shots: 6, h4_shots: 6,
	                  h5_shots: 4, h6_shots: 4, h7_shots: 5, h8_shots: 8,
                    h9_shots: 6, h10_shots: 4, h11_shots: 3, h12_shots: 4,
	                 	h13_shots: 7, h14_shots: 5, h15_shots: 8, h16_shots: 5,
	                 	h17_shots: 4, h18_shots: 4}, handicap: 7,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 1, h12_putts: 2,
	                 	h13_putts: 2, h14_putts: 3, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 1, h18_putts: 1 },
	                 	score: 91, putts: 34)

# Round Three
fifteen_sun = DateTime.new(2015, 2, 8)
fifteen_sun_first = DateTime.new(2015, 2, 8, 10, 50, 00)
fifteen_sun_sec = DateTime.new(2015, 2, 8, 11, 00, 00)
fifteen_sun_third = DateTime.new(2015, 2, 8, 11, 10, 00)
# First
greg.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_first.strftime("%F"), tee_time: fifteen_sun_first.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 6, h2_shots: 6, h3_shots: 5, h4_shots: 6,
	                  h5_shots: 6, h6_shots: 5, h7_shots: 7, h8_shots: 6,
                    h9_shots: 5, h10_shots: 5, h11_shots: 3, h12_shots: 7,
	                 	h13_shots: 6, h14_shots: 6, h15_shots: 6, h16_shots: 7,
	                 	h17_shots: 7, h18_shots: 10}, handicap: 23,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 5, h6_putts: 2, h7_putts: 3, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 1, h12_putts: 2,
	                 	h13_putts: 2, h14_putts: 3, h15_putts: 3, h16_putts: 2,
	                 	h17_putts: 3, h18_putts: 3 },
	                 	score: 111, putts: 41)
albino.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_first.strftime("%F"), tee_time: fifteen_sun_first.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 6, h2_shots: 5, h3_shots: 5, h4_shots: 6,
	                  h5_shots: 4, h6_shots: 5, h7_shots: 5, h8_shots: 4,
                    h9_shots: 6, h10_shots: 5, h11_shots: 3, h12_shots: 8,
	                 	h13_shots: 5, h14_shots: 7, h15_shots: 8, h16_shots: 6,
	                 	h17_shots: 5, h18_shots: 5}, handicap: 14,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 3, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 3, h10_putts: 2, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 2, h14_putts: 3, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 3, h18_putts: 2 },
	                 	score: 97, putts: 41)
jack.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_first.strftime("%F"), tee_time: fifteen_sun_first.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 6, h2_shots: 5, h3_shots: 7, h4_shots: 6,
	                  h5_shots: 5, h6_shots: 6, h7_shots: 5, h8_shots: 6,
                    h9_shots: 5, h10_shots: 5, h11_shots: 5, h12_shots: 7,
	                 	h13_shots: 5, h14_shots: 6, h15_shots: 6, h16_shots: 8,
	                 	h17_shots: 5, h18_shots: 7}, handicap: 25,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 3, h4_putts: 2,
	                 	h5_putts: 3, h6_putts: 2, h7_putts: 2, h8_putts: 3,
	                 	h9_putts: 1, h10_putts: 2, h11_putts: 3, h12_putts: 2,
	                 	h13_putts: 1, h14_putts: 2, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 3 },
	                 	score: 105, putts: 39)
joel.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_first.strftime("%F"), tee_time: fifteen_sun_first.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 5, h2_shots: 4, h3_shots: 6, h4_shots: 5,
	                  h5_shots: 4, h6_shots: 4, h7_shots: 6, h8_shots: 3,
                    h9_shots: 5, h10_shots: 3, h11_shots: 4, h12_shots: 5,
	                 	h13_shots: 6, h14_shots: 3, h15_shots: 5, h16_shots: 6,
	                 	h17_shots: 4, h18_shots: 5}, handicap: 7,
	                 putts_card: {
	                 	h1_putts: 3, h2_putts: 2, h3_putts: 2, h4_putts: 3,
	                 	h5_putts: 2, h6_putts: 1, h7_putts: 2, h8_putts: 0,
	                 	h9_putts: 3, h10_putts: 2, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 2, h14_putts: 1, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 3, h18_putts: 1 },
	                 	score: 84, putts: 35)
# Second
jeremy.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_sec.strftime("%F"), tee_time: fifteen_sun_sec.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 4, h2_shots: 6, h3_shots: 5, h4_shots: 5,
	                  h5_shots: 4, h6_shots: 5, h7_shots: 4, h8_shots: 4,
                    h9_shots: 4, h10_shots: 4, h11_shots: 4, h12_shots: 5,
	                 	h13_shots: 3, h14_shots: 3, h15_shots: 5, h16_shots: 7,
	                 	h17_shots: 3, h18_shots: 7}, handicap: 13,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 3, h3_putts: 2, h4_putts: 3,
	                 	h5_putts: 3, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 3, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 1, h14_putts: 1, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 82, putts: 38)
bryan.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_sec.strftime("%F"), tee_time: fifteen_sun_sec.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 5, h2_shots: 6, h3_shots: 5, h4_shots: 6,
	                  h5_shots: 4, h6_shots: 4, h7_shots: 5, h8_shots: 5,
                    h9_shots: 4, h10_shots: 4, h11_shots: 4, h12_shots: 5,
	                 	h13_shots: 5, h14_shots: 5, h15_shots: 5, h16_shots: 6,
	                 	h17_shots: 5, h18_shots: 7}, handicap: 8,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 1, h4_putts: 2,
	                 	h5_putts: 2, h6_putts: 2, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 1, h14_putts: 2, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 3, h18_putts: 2 },
	                 	score: 90, putts: 35)
pat.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_sec.strftime("%F"), tee_time: fifteen_sun_sec.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 4, h2_shots: 6, h3_shots: 7, h4_shots: 9,
	                  h5_shots: 5, h6_shots: 6, h7_shots: 6, h8_shots: 7,
                    h9_shots: 5, h10_shots: 4, h11_shots: 4, h12_shots: 8,
	                 	h13_shots: 10, h14_shots: 5, h15_shots: 6, h16_shots: 7,
	                 	h17_shots: 5, h18_shots: 6}, handicap: 32,
	                 putts_card: {
	                 	h1_putts: 1, h2_putts: 3, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 3, h6_putts: 2, h7_putts: 3, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 2, h12_putts: 3,
	                 	h13_putts: 2, h14_putts: 2, h15_putts: 2, h16_putts: 3,
	                 	h17_putts: 3, h18_putts: 2 },
	                 	score: 107, putts: 42)
payne.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_sec.strftime("%F"), tee_time: fifteen_sun_sec.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 5, h2_shots: 5, h3_shots: 7, h4_shots: 5,
	                  h5_shots: 4, h6_shots: 4, h7_shots: 6, h8_shots: 5,
                    h9_shots: 6, h10_shots: 4, h11_shots: 4, h12_shots: 5,
	                 	h13_shots: 6, h14_shots: 3, h15_shots: 6, h16_shots: 4,
	                 	h17_shots: 5, h18_shots: 7}, handicap: 14,
	                 putts_card: {
	                 	h1_putts: 3, h2_putts: 1, h3_putts: 2, h4_putts: 2,
	                 	h5_putts: 3, h6_putts: 1, h7_putts: 2, h8_putts: 2,
	                 	h9_putts: 2, h10_putts: 2, h11_putts: 3, h12_putts: 2,
	                 	h13_putts: 2, h14_putts: 1, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 3, h18_putts: 2 },
	                 	score: 91, putts: 37)
# Third
damon.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_third.strftime("%F"), tee_time: fifteen_sun_third.strftime("%H:%M"),
	                  shots_card: {}, putts_card: {}, score: nil, putts: nil)
cory.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_third.strftime("%F"), tee_time: fifteen_sun_third.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 5, h2_shots: 6, h3_shots: 7, h4_shots: 7,
	                  h5_shots: 6, h6_shots: 6, h7_shots: 6, h8_shots: 5,
                    h9_shots: 5, h10_shots: 3, h11_shots: 4, h12_shots: 7,
	                 	h13_shots: 5, h14_shots: 5, h15_shots: 9, h16_shots: 6,
	                 	h17_shots: 4, h18_shots: 8}, handicap: 21,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 2, h3_putts: 3, h4_putts: 3,
	                 	h5_putts: 1, h6_putts: 2, h7_putts: 2, h8_putts: 1,
	                 	h9_putts: 3, h10_putts: 2, h11_putts: 3, h12_putts: 3,
	                 	h13_putts: 3, h14_putts: 2, h15_putts: 2, h16_putts: 1,
	                 	h17_putts: 1, h18_putts: 3 },
	                 	score: 104, putts: 39)
dan.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_third.strftime("%F"), tee_time: fifteen_sun_third.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 4, h2_shots: 6, h3_shots: 7, h4_shots: 6,
	                  h5_shots: 4, h6_shots: 5, h7_shots: 7, h8_shots: 7,
                    h9_shots: 4, h10_shots: 4, h11_shots: 3, h12_shots: 6,
	                 	h13_shots: 9, h14_shots: 5, h15_shots: 7, h16_shots: 5,
	                 	h17_shots: 5, h18_shots: 7}, handicap: 18,
	                 putts_card: {
	                 	h1_putts: 2, h2_putts: 1, h3_putts: 3, h4_putts: 2,
	                 	h5_putts: 3, h6_putts: 2, h7_putts: 2, h8_putts: 3,
	                 	h9_putts: 1, h10_putts: 2, h11_putts: 2, h12_putts: 2,
	                 	h13_putts: 2, h14_putts: 3, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 96, putts: 38)
david.rounds.create!(tournament_id: bandon_2015.id, round_num: 3, course: pacific,
	                 date_played: fifteen_sun_third.strftime("%F"), tee_time: fifteen_sun_third.strftime("%H:%M"),
	                  shots_card: {
	                 	h1_shots: 4, h2_shots: 6, h3_shots: 6, h4_shots: 5,
	                  h5_shots: 5, h6_shots: 4, h7_shots: 6, h8_shots: 6,
                    h9_shots: 7, h10_shots: 5, h11_shots: 6, h12_shots: 5,
	                 	h13_shots: 6, h14_shots: 4, h15_shots: 6, h16_shots: 7,
	                 	h17_shots: 4, h18_shots: 6}, handicap: 20,
	                 putts_card: {
	                 	h1_putts: 1, h2_putts: 3, h3_putts: 3, h4_putts: 1,
	                 	h5_putts: 2, h6_putts: 1, h7_putts: 2, h8_putts: 3,
	                 	h9_putts: 3, h10_putts: 3, h11_putts: 3, h12_putts: 1,
	                 	h13_putts: 3, h14_putts: 2, h15_putts: 2, h16_putts: 2,
	                 	h17_putts: 2, h18_putts: 2 },
	                 	score: 98, putts: 39)



























