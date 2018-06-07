user = User.create(username: 'bencaneba', password: 'password', first_name: 'Ben', last_name: 'Caneba', email: 'ben_caneba@kleinschmidt.com', phone: '9062314010')

sport1 = Sport.create(name: 'hockey')
sport2 = Sport.create(name: 'basketball')
sport3 = Sport.create(name: 'football')

league1 = sport1.leagues.build(name: 'NHL')
league1.save

team1 = league1.teams.build(name: 'Vegas Golden Knights', sport_id: 1)
team1.save
team2 = league1.teams.build(name: 'Washington Capitals', sport_id: 1)
team2.save


league2 = sport1.leagues.build(name: 'USHL')
league2.save

team3 = league2.teams.build(name: 'Cedar Rapids Rough Riders', sport_id: 1)
team3.save
team4 = league2.teams.build(name: 'Chicago Steel', sport_id: 1)
team4.save



league3 = sport2.leagues.build(name: 'NBA')
league3.save

team5 = league3.teams.build(name: 'Los Angeles Lakers', sport_id: 2)
team5.save
team6 = league3.teams.build(name: 'Detroit Pistons', sport_id: 2)
team6.save





match1 = league1.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team1.id, team2_id: team2.id)
match1.save

match2 = league2.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team3.id, team2_id: team4.id)
match2.save


match3 = league3.matches.build(match_datetime: Time.now.to_datetime, sport_id: 2, team1_id: team5.id, team2_id: team6.id)
match3.save

match4 = league3.matches.build(match_datetime: Time.now.to_datetime, sport_id: 2, team1_id: team5.id, team2_id: team6.id)
match4.save



user_favorite1 = user.user_favorites.build(favorite_type: 'sport', favorite_id: sport1.id)
user_favorite1.save

user_favorite2 = user.user_favorites.build(favorite_type: 'league', favorite_id: league1.id)
user_favorite2.save


