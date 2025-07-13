.PHONY: help install install-dev test lint format check clean build

help:
	@echo "Available targets:"
	@echo "  install           - Install the package"
	@echo "  install-dev       - Install the package in development mode"
	@echo "  sync              - Synchronize dependencies"
	@echo "  add <package>     - Add a new dependency"
	@echo "  add-dev <package> - Add a new development dependency"
	@echo "  test              - Run tests"
	@echo "  lint              - Run linters"
	@echo "  format            - Format the code"
	@echo "  check             - Check the code quality"
	@echo "  clean             - Clean up build artifacts"
	@echo "  build             - Build the package"
	@echo "  setup-dev         - Set up the development environment"
	@echo "  pre-commit        - Run pre-commit hooks"

install:
	@echo "Installing the package..."
	uv pip install -e .

install-dev:
	@echo "Installing the package in development mode..."
	uv pip install -e .[dev]

sync:
	@echo "Synchronizing dependencies..."
	uv sync

add:
	@echo "Adding a new dependency..."
	uv add $(PACKAGE)

add-dev:
	@echo "Adding a new development dependency..."
	uv add --dev $(PACKAGE)

test:
	@echo "Running tests..."
	uv run pytest

lint:
	@echo "Running linters..."
	uv run ruff check src tests

format:
	@echo "Formatting the code..."
	uv run ruff format src tests

check: lint
	@echo "Checking the code quality..."
	uv run mypy src
	uv run pytest

clean:
	@echo "Cleaning up build artifacts..."
	rm -rf build/
	rm -rf dist/
	rm -rf src/*.egg-info
	rm -rf .coverage
	rm -rf htmlcov/
	rm -rf .pytest_cache/
	rm -rf .mypy_cache/
	rm -rf .ruff_cache/
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -exec rm -rf {} +

build:
	@echo "Building the package..."
	uv build

setup-dev:
	@echo "Setting up development environment..."
	uv sync --dev
	uv run pre-commit install

pre-commit:
	@echo "Running pre-commit hooks..."
	uv run pre-commit run --all-files
