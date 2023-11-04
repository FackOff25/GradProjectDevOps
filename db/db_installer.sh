#installs DB. Requres installed and running postgresql
DB_NAME=goexploredb
DB_USER=goexplore
DB_USER_PASS=x
su postgres <<EOF
createdb  $DB_NAME;
psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_USER_PASS';"

psql -U postgres -d  $DB_NAME -c "CREATE TABLE IF NOT EXISTS user ( 
	id							uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
	username					VARCHAR(45),
	pwd_hash					VARCHAR(64),
	amusement_park_rating		FLOAT(3,2) DEFAULT 1.0,
	aquarium_rating				FLOAT(3,2) DEFAULT 1.0,
	art_gallery_rating			FLOAT(3,2) DEFAULT 1.0,
	bar_rating					FLOAT(3,2) DEFAULT 1.0,
	mosque_rating				FLOAT(3,2) DEFAULT 1.0,
	movie_theater_rating		FLOAT(3,2) DEFAULT 1.0,
	bowling_alley_rating		FLOAT(3,2) DEFAULT 1.0,
	museum_rating				FLOAT(3,2) DEFAULT 1.0,
	cafe_rating					FLOAT(3,2) DEFAULT 1.0,
	night_club_rating			FLOAT(3,2) DEFAULT 1.0,
	park_rating					FLOAT(3,2) DEFAULT 1.0,
	casino_rating				FLOAT(3,2) DEFAULT 1.0,
	cemetery_rating				FLOAT(3,2) DEFAULT 1.0,
	church_rating				FLOAT(3,2) DEFAULT 1.0,
	city_hall_rating			FLOAT(3,2) DEFAULT 1.0,
	restaurant_rating			FLOAT(3,2) DEFAULT 1.0,
	shopping_mall_rating		FLOAT(3,2) DEFAULT 1.0,
	stadium_rating				FLOAT(3,2) DEFAULT 1.0,
	synagogue_rating			FLOAT(3,2) DEFAULT 1.0,
	tourist_attraction_rating	FLOAT(3,2) DEFAULT 1.0,
	hindu_temple_rating			FLOAT(3,2) DEFAULT 1.0,
	zoo_rating					FLOAT(3,2) DEFAULT 1.0
);"

psql -U postgres -d  $DB_NAME -c "CREATE TABLE IF NOT EXISTS place ( 
	id							uuid DEFAULT uuid_generate_v4 () PRIMARY KEY,
	place_id					TEXT NOT NULL,
	types						TEXT NOT NULL
);"

psql -U postgres -d  $DB_NAME -c "CREATE TABLE IF NOT EXISTS users_place ( 
	user_id						uuid NOT NULL REFERENCES user(id) ON DELETE CASCADE,
	place_id					uuid NOT NULL REFERENCES place(id) ON DELETE CASCADE,
	like_mark					BOOLEAN NOT NULL,
	visited_mark				BOOLEAN NOT NULL,
	CONSTRAINT					user_place_pkey PRIMARY KEY(user_id, place_id)
);"

psql -U postgres -d  $DB_NAME -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public to $DB_USER;"
psql -U postgres -d  $DB_NAME -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public to $DB_USER;"
echo "Postgres User '$DB_USER' and database '$DB_NAME' created."
EOF