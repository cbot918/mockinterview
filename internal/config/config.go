package config

import (
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	DB_DRIVER   string
	DB_USER     string
	DB_PASSWORD string
	DB_HOST     string
	DB_PORT     string
	DB_NAME     string
	PORT        string
}

func NewConfig() (*Config, error) {

	if err := godotenv.Load(); err != nil {
		return nil, err
	}

	return &Config{
		DB_DRIVER:   os.Getenv("DB_DRIVER"),
		DB_USER:     os.Getenv("DB_USER"),
		DB_PASSWORD: os.Getenv("DB_PASSWORD"),
		DB_HOST:     os.Getenv("DB_HOST"),
		DB_PORT:     os.Getenv("DB_PORT"),
		DB_NAME:     os.Getenv("DB_NAME"),
		PORT:        os.Getenv("PORT"),
	}, nil
}

// type Config struct {
// 	DB struct {
// 		Username string
// 		Password string
// 		Host     string
// 		Port     string
// 		DB_NAME  string
// 	}
// }
