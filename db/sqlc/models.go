// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0

package db

import (
	"database/sql"
	"time"
)

type Match struct {
	ID       int32
	ViewerID int32
	VieweeID int32
	WeekID   int32
}

type Skill struct {
	ID       int32
	ViewerID sql.NullInt32
	VieweeID sql.NullInt32
	// 1:conversation 2:react 3:vue 4:backend
	Skill int32
}

type User struct {
	ID        int32
	Email     string
	Password  string
	Name      string
	CreatedAt time.Time
}

type Viewee struct {
	VieweeID int32
	UserID   int32
	// 1:entry 2:junior 3:mid 4:senior
	Level       int32
	Description sql.NullString
	VieweeName  string
}

type Viewer struct {
	ViewerID int32
	UserID   int32
	// 1:entry 2:junior 3:mid 4:senior
	Level       int32
	AcceptCount int32
	Description sql.NullString
	ViewerName  string
}

type Week struct {
	ID    int32
	Time  time.Time
	Title string
}
