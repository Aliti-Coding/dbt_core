# build the project
run this command to start the docker container: docker-compose up --build




## Enter database
docker exec -it 6fa15270a5f9 psql -U dw_user -d dw
exit db terminal = q

SELECT schema_name
FROM information_schema.schemata;q



packages for sqfluff
pip install sqlfluff-templater-dbt