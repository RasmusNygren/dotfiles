import argparse
import json
import pathlib
import subprocess
from os import PathLike


def _symlink(target: PathLike, name: PathLike, force: bool = False) -> None:
    subprocess.check_call([
        "ln",
        "-sn" + ("f" if force else ""),
        str(target),
        str(name),
    ])


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-f",
        "--force",
        action='store_true',
        help="force symlinks",
    )

    args = parser.parse_args()

    with open("symlinks.json") as f:
        data = json.load(f)

    for target, name in data["symlinks"].items():
        abs_target = pathlib.Path(target).expanduser().absolute()
        abs_name = pathlib.Path(name).expanduser().absolute()
        _symlink(abs_target, abs_name, args.force)

    return 0

    
if __name__ == "__main__":
    SystemExit(main())
