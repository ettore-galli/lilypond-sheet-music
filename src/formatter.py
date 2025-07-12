import sys
import re

from typing import List
from functools import reduce


def is_list_of_notes(line: str) -> bool:
    # Ignora righe vuote e commenti
    if not line.strip() or line.strip().startswith("%"):
        return False
    # Esclude direttive LilyPond
    if line.strip().startswith("\\"):
        return False
    # Cerca almeno una nota o pausa
    note_pattern = r"\b([a-g](is|es)?'*\d*\.*|r\d*\.*)\b"
    return bool(re.search(note_pattern, line))


def process_notes_line(line: str, max_width: int, intra_note_space: int = 2) -> str:
    number_of_leading_spaces = len(line) - len(line.lstrip())

    notes = [token.strip() for token in line.strip().split(" ")]

    return (
        " " * number_of_leading_spaces
        + reduce(
            lambda line, note: line + note.ljust(max_width + intra_note_space, " "),
            [note for note in notes if note],
            "",
        ).strip()
        + "\n"
    )


def open_file(filename: str):
    return open(filename, "r", encoding="utf-8")


def get_note_line_width(line: str) -> int:

    notes = [token.strip() for token in line.strip().split(" ")]
    return max(*[len(token) for token in notes]) if len(notes) > 1 else len(notes[0])


def maximum_token_width(file_content: List[str]) -> int:
    return max(
        *[get_note_line_width(line) for line in file_content if is_list_of_notes(line)]
    )


def process_file(filename: str) -> List[str]:
    with open_file(filename) as input_file:
        file_content = [line for line in input_file]
        max_width = maximum_token_width(file_content=file_content)
        return reduce(
            lambda content, line: content
            + [
                (
                    process_notes_line(line=line, max_width=max_width)
                    if is_list_of_notes(line)
                    else line
                )
            ],
            file_content,
            [],
        )


def output_processed_file(content: List[str]) -> List[str]:
    for line in content:
        sys.stdout.write(line)


if __name__ == "__main__":
    filename = sys.argv[1]
    processed: List[str] = process_file(filename=filename)
    output_processed_file(content=processed)
