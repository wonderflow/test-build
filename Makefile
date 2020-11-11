# Project Setup
PROJECT_NAME := test-build
PROJECT_REPO := github.com/wonderflow/$(PROJECT_NAME)

PLATFORMS ?= linux_amd64 linux_arm64
include build/makelib/common.mk

# Setup Go
GO_STATIC_PACKAGES = $(GO_PROJECT)/cmd/api $(GO_PROJECT)/cmd/installer
GO_LDFLAGS += -X $(GO_PROJECT)/pkg/version.Version=$(VERSION)
GO_TEST_FLAGS += -race
GO_COVER_MODE = atomic
GO_CGO_ENABLED=1
include build/makelib/golang.mk

