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


league4 = sport3.leagues.build(name: 'NFL')
league4.save

team7 = league4.teams.build(name: 'Seattle Seahawks', sport_id: 3)
team7.save
team8 = league4.teams.build(name: 'Chicago Bears', sport_id: 3)
team8.save


league5 = sport3.leagues.build(name: 'CFL')
league5.save

team9 = league5.teams.build(name: 'Saskatoon Bulls', sport_id: 3)
team9.save
team10 = league5.teams.build(name: 'Ontario MudSlingers', sport_id: 3)
team10.save




match1 = league1.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team1.id, team2_id: team2.id)
match1.save
match1 = league1.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team1.id, team2_id: team2.id)
match1.save
match1 = league1.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team1.id, team2_id: team2.id)
match1.save
match1 = league1.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team1.id, team2_id: team2.id)
match1.save
match1 = league1.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team1.id, team2_id: team2.id)
match1.save

match2 = league2.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team3.id, team2_id: team4.id)
match2.save
match2 = league2.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team3.id, team2_id: team4.id)
match2.save
match2 = league2.matches.build(match_datetime: Time.now.to_datetime, sport_id: 1, team1_id: team3.id, team2_id: team4.id)
match2.save


match3 = league3.matches.build(match_datetime: Time.now.to_datetime, sport_id: 2, team1_id: team5.id, team2_id: team6.id)
match3.save
match3 = league3.matches.build(match_datetime: Time.now.to_datetime, sport_id: 2, team1_id: team5.id, team2_id: team6.id)
match3.save


match4 = league4.matches.build(match_datetime: Time.now.to_datetime, sport_id: 3, team1_id: team7.id, team2_id: team8.id)
match4.save
match4 = league4.matches.build(match_datetime: Time.now.to_datetime, sport_id: 3, team1_id: team7.id, team2_id: team8.id)
match4.save
match4 = league4.matches.build(match_datetime: Time.now.to_datetime, sport_id: 3, team1_id: team7.id, team2_id: team8.id)
match4.save
match4 = league4.matches.build(match_datetime: Time.now.to_datetime, sport_id: 3, team1_id: team7.id, team2_id: team8.id)
match4.save

match5 = league4.matches.build(match_datetime: Time.now.to_datetime, sport_id: 3, team1_id: team7.id, team2_id: team8.id)
match5.save
match5 = league4.matches.build(match_datetime: Time.now.to_datetime, sport_id: 3, team1_id: team7.id, team2_id: team8.id)
match5.save

match6 = league5.matches.build(match_datetime: Time.now.to_datetime, sport_id: 3, team1_id: team9.id, team2_id: team10.id)
match6.save
match6 = league5.matches.build(match_datetime: Time.now.to_datetime, sport_id: 3, team1_id: team9.id, team2_id: team10.id)
match6.save
match6 = league5.matches.build(match_datetime: Time.now.to_datetime, sport_id: 3, team1_id: team9.id, team2_id: team10.id)
match6.save



user_favorite1 = user.user_favorites.build(favorite_type: 'sport', favorite_id: sport1.id)
user_favorite1.save

user_favorite2 = user.user_favorites.build(favorite_type: 'league', favorite_id: league1.id)
user_favorite2.save








