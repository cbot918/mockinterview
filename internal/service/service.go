package service

import (
	"context"
	"database/sql"
	"fmt"
	db "mockinterview/db/sqlc"
	"mockinterview/internal/model"
	"mockinterview/internal/util"
	"strings"
)

type Service struct {
	S db.Store
}

func NewService(store db.Store) *Service {
	return &Service{
		S: store,
	}
}

func (s *Service) SignupService(user *model.SignupRequest) (db.User, error) {
	var retUser db.User
	var err error

	// check if user exists
	canInsertUser := false
	_, err = s.S.GetUser(context.Background(), user.Email)
	if err != nil {
		if err == sql.ErrNoRows {
			canInsertUser = true
		} else {
			return db.User{}, err
		}
	}

	// if insertable
	if canInsertUser {
		hashedPassword, err := util.HashPassword(user.Password)
		if err != nil {
			return db.User{}, err
		}
		retUser, err = s.S.CreateUser(context.Background(), db.CreateUserParams{
			Email:    user.Email,
			Password: string(hashedPassword),
			Name:     strings.Split(user.Email, "@")[0],
		})
		if err != nil {
			return db.User{}, err
		}

		fmt.Printf("%#+v\n", retUser)
		return retUser, nil
	}

	return db.User{}, fmt.Errorf("create user failed")
}

// func (s *Service) InsertService() error {
// 	return s.R.InsertRepository()
// }
