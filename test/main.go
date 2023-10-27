package main

import "fmt"

func main() {
	fmt.Println(c())
}

func c() (i int) {
	i = 1
	defer func() { i++ }()
	return
}
