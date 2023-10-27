package util

import (
	"database/sql"
	"fmt"
	"mockinterview/internal/config"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"
	"golang.org/x/crypto/bcrypt"
)

func NewDB(cfg *config.Config) (*sql.DB, error) {
	dsn := fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=disable",
		cfg.DB_USER,
		cfg.DB_PASSWORD,
		cfg.DB_HOST,
		cfg.DB_PORT,
		cfg.DB_NAME,
	)
	// postgres://postgres:12345@localhost:5432/autodb?sslmode=disable
	db, err := sql.Open(cfg.DB_DRIVER, dsn)
	if err != nil {
		return nil, err
	}
	err = db.Ping()
	if err != nil {
		return nil, err
	}

	return db, nil
}

func NewSQLx(cfg *config.Config) (*sqlx.DB, error) {
	dsn := fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=disable",
		cfg.DB_USER,
		cfg.DB_PASSWORD,
		cfg.DB_HOST,
		cfg.DB_PORT,
		cfg.DB_NAME,
	)
	// postgres://postgres:12345@localhost:5432/autodb?sslmode=disable
	db, err := sqlx.Open(cfg.DB_DRIVER, dsn)
	if err != nil {
		return nil, err
	}
	err = db.Ping()
	if err != nil {
		return nil, err
	}

	return db, nil
}

func HashPassword(raw string) ([]byte, error) {

	password := []byte(raw) // Convert your password to a byte slice

	return bcrypt.GenerateFromPassword(password, bcrypt.DefaultCost)
}
