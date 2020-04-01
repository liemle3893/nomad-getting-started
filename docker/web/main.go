package main

import (
	"errors"
	"fmt"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"io/ioutil"
	"net/http"
	"os"
	"strings"
)

func main() {
	// Echo instance
	e := echo.New()

	// Middleware
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	// Routes
	e.GET("/env", envHandler)
	e.GET("/healthz", healthChecker)
	e.GET("/metrics", metricHandler)
	e.GET("/file", fileHandler)

	// Start server
	e.Logger.Fatal(e.Start(":1323"))
}

// Handler
func envHandler(ctx echo.Context) error {

	var envs string

	for _, pair := range os.Environ() {
		variable := strings.SplitN(pair, "=", 2)[0]
		envs += fmt.Sprintf("%-50s: %s\n", variable, os.Getenv(variable))
	}

	return ctx.String(http.StatusOK, envs)
}

func healthChecker(ctx echo.Context) error {
	return ctx.String(http.StatusOK, "OK")
}

func metricHandler(ctx echo.Context) error {
	return ctx.String(http.StatusOK, "some metrics")
}

var (
	ErrFileNotFound = errors.New("File not found")
)

func fileHandler(ctx echo.Context) error {
	file := ctx.QueryParam("file")
	if len(file) == 0 {
		return ErrFileNotFound
	}
	content, err := ioutil.ReadFile(file)
	if err != nil {
		return err
	}
	return ctx.String(http.StatusOK, string(content))
}
