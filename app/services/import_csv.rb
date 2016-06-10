class ImportCsv

 def update
    filename = File.join Rails.root, "public/csv_files/jbs_last.csv"
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
        password: 'password',
        password_confirmation: 'password')

      @tournament = Tournament.where(name: 'Royal JBS Tournament').first
      @tournament_rounds = @tournament.tournament_rounds.first
      # Build user scorecard for Tournament
      @scorecard = @tournament_rounds.scorecards.create(user_id: user.id, new_course_id: 1)

    end

  end

end