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



def process_notes_line(line: str, intra_note_space: int = 2) -> str:
    number_of_leading_spaces = len(line) - len(line.lstrip())

    notes = [token.strip() for token in line.strip().split(" ")]
    max_width = (
        max(*[len(token) for token in notes]) if len(notes) > 1 else len(notes[0])
    )

    return (
        " " * number_of_leading_spaces
        + reduce(
            lambda line, note: line + note.ljust(max_width + intra_note_space, " "),
            [note for note in notes if note],
            "",
        ).strip()
        + "\n"
    )


def process_file(filename: str) -> List[str]:
    with open(filename, "r", encoding="utf-8") as input_file:
        return reduce(
            lambda content, line: content
            + [process_notes_line(line=line) if is_list_of_notes(line) else line],
            input_file,
            [],
        )


def output_processed_file(content: List[str]) -> List[str]:
    for line in content:
        sys.stdout.write(line)


if __name__ == "__main__":
    filename = sys.argv[1]
    processed: List[str] = process_file(filename=filename)
    output_processed_file(content=processed)
