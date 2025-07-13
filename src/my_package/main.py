import sys


def greet(name: str) -> str:
    """Greet someone by name.

    Parameters
    ----------
    name : str
        The name of the person to greet.

    Returns
    -------
    str
        A greeting message.
    """
    return f"Hello, {name}!"


def main(argv: list[str] | None = None) -> int:
    """Main entry point for the script.

    Parameters
    ----------
    argv : list[str] | None, optional
        Command line arguments, defaults to None.

    Returns
    -------
    int
        Exit status code.
    """
    if argv is None:
        argv = sys.argv[1:]

    if len(argv) != 1:
        print("Usage: my-package <name>")
        return 1

    name = argv[0]
    print(greet(name))
    return 0
