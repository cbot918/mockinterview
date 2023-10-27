package controller

import (
	"fmt"
	db "mockinterview/db/sqlc"
	"mockinterview/internal/model"
	"mockinterview/internal/service"

	"github.com/gofiber/fiber/v2"
)

type Controller struct {
	S *service.Service
}

func NewController(store db.Store) *Controller {

	return &Controller{
		S: service.NewService(store),
	}
}

func (ctr *Controller) Singup(c *fiber.Ctx) error {
	// handle request
	req := &model.SignupRequest{}
	if err := c.BodyParser(req); err != nil {
		return c.JSON(err)
	}

	retUser, err := ctr.S.SignupService(req)
	if err != nil {
		return c.JSON(fiber.Map{"error": err.Error()})
	}

	fmt.Println(retUser)

	// handle response
	// res := &model.SignupResponse{
	// 	Email: req.Email,
	// 	Name:  req.Name,
	// }
	return c.JSON(retUser)
}

// func (ctr *Controller) Insert(c *fiber.Ctx) error {
// 	return ctr.S.InsertService()
// }
