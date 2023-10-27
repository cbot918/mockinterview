package main

import (
	"log"

	db "mockinterview/db/sqlc"
	"mockinterview/internal/config"
	"mockinterview/internal/http"
	"mockinterview/internal/util"

	"github.com/gofiber/fiber/v2"
)

func main() {

	cfg, err := config.NewConfig()
	if err != nil {
		log.Fatal(err)
	}

	sql, err := util.NewDB(cfg)
	if err != nil {
		log.Fatal(err)
	}

	store := db.NewStore(sql)

	f := fiber.New()
	api := http.NewAPI(cfg, f, store)

	log.Fatal(api.App.Listen(cfg.PORT))
}
