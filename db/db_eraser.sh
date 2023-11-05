#clear all tables with everything in it
DB_NAME=goexploredb
su postgres <<EOF
psql -U postgres  -d $DB_NAME -c "TRUNCATE TABLE users_places CASCADE;"
psql -U postgres  -d $DB_NAME -c "TRUNCATE TABLE users CASCADE;"
psql -U postgres  -d $DB_NAME -c "TRUNCATE TABLE places CASCADE;"
echo "Database '$DB_NAME' is above."
EOF
