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

user_favorite1 = user.user_favorites.build(favorite_type: 'sport', favorite_id: sport1.id)
user_favorite1.save

user_favorite2 = user.user_favorites.build(favorite_type: 'league', favorite_id: league1.id)
user_favorite2.save


