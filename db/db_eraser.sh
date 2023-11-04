#clear all tables with everything in it
DB_NAME=goexploredb
su postgres <<EOF
psql -U postgres  -d $DB_NAME -c "TRUNCATE TABLE users_place CASCADE;"
psql -U postgres  -d $DB_NAME -c "TRUNCATE TABLE user CASCADE;"
psql -U postgres  -d $DB_NAME -c "TRUNCATE TABLE place CASCADE;"
echo "Database '$DB_NAME' is above."
EOF
