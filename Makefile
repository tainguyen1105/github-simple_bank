postgres:
	docker run --name postgres16 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=281204 -p 5432:5432 -d postgres:16-alpine

createdb:
	docker exec -it postgres16 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres16 dropdb simple_bank

migrateup:
	migrate -path /Users/quyen/Tai/backend_master_class/simplebank/db/migration -database "postgresql://root:281204@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path /Users/quyen/Tai/backend_master_class/simplebank/db/migration -database "postgresql://root:281204@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY:	postgres	createdb	dropdb	migrateup	migratedown		sqlc	test