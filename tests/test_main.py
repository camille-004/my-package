"""Tests for the my_package module."""

import pytest

from my_package.main import greet, main


def test_greet() -> None:
    """Test the greet function."""
    assert greet("Alice") == "Hello, Alice!"
    assert greet("Bob") == "Hello, Bob!"


def test_main(capsys: pytest.CaptureFixture[str]) -> None:
    """Test the main function."""
    result = main(["Alice"])
    captured = capsys.readouterr()

    assert result == 0
    assert captured.out == "Hello, Alice!\n"


def test_main_no_args(capsys: pytest.CaptureFixture[str]) -> None:
    """Test main function with no arguments."""
    result = main([])
    captured = capsys.readouterr()

    assert result == 1
    assert captured.out == "Usage: my-package <name>\n"
