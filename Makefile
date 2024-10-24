.PHONY: setup
setup:
	docker compose up -d postgres mysql
	docker compose exec --env PGPASSWORD=postgres postgres dropdb -Upostgres positioning_test || true
	docker compose exec --env PGPASSWORD=postgres postgres createdb -Upostgres positioning_test || true
	docker compose exec mysql mysql -uroot -proot --execute 'drop database if exists positioning_test; create database if not exists positioning_test;'

.PHONY: bash
bash:
	docker compose run --rm gem bash
