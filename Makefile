# postgres://postgres:password@localhost:5432/example?sslmode=disable
URL="postgres://postgres:12345@localhost:3343/mockinterview?sslmode=disable"
# URL="mysql://root:12345@tcp(localhost:3306)/test"

.PHONY: mig-inst mig-init mig-up mig-down
mig-inst:
	go install github.com/golang-migrate/migrate/v4/cmd/migrate@latest

mig-init:
	migrate create -ext sql -dir db/migrations -seq create_users_table

mig-add:
	migrate create -ext sql -dir db/migrations -seq $(name)

mig-up:
	migrate -database $(URL) -path db/migrations up

mig-down:
	migrate -database $(URL) -path db/migrations down

.PHONY: mysql
mysql-cli:
	docker run --rm --network bridge -it mysql mysql -h 172.17.0.3 -u root -p