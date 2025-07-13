"""Allow my_package to be executed as `python -m my_package`."""

from .main import main

if __name__ == "__main__":
    import sys

    sys.exit(main())
