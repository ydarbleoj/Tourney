class ImportCsv

 def update
    filename = File.join Rails.root, "public/csv_files/jbs.csv"
    import(filename)
  end

  def import(params)

    CSV.foreach(params) do |row|
      first_name, last_name, gender, handicap, email = row
      user = User.create(
        first_name: first_name,
        last_name: last_name,
        gender: gender,
        handicap: handicap.nil? ? 0 : handicap,
        email: email.nil? ? first_name + last_name + '@mail.com' : email,
        password: 'rjbstourney',
        password_confirmation: 'rjbstourney')

      @tournament = Tournament.where(name: 'Royal JBS Tournament').first
      @tournament_rounds = @tournament.tournament_rounds.first
      # Build user scorecard for Tournament
      @scorecard = @tournament_rounds.scorecards.create(user_id: user.id, new_course_id: 1)
      (1..18).each { |x| @scorecard.user_scores.create(number: x) }

    end

  end

end