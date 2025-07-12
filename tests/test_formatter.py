from pytest import mark
from src.formatter import is_list_of_notes, process_notes_line


@mark.parametrize(
    "line, expected_is_list_of_notes",
    [
        ("a'4. r4. r4. d'8 e'8 a'8            |", True),
        ('\\version "2.24.2"', False),
        ("melody =   {", False),
        ("  %       *       *       *       *       *       *       *       *", False),
        ('title = "Send in the Clowns (Tin Whistle in D)"', False),
        ("", False),
    ],
)
def test_is_list_of_notes(line, expected_is_list_of_notes):
    assert is_list_of_notes(line) is expected_is_list_of_notes


@mark.parametrize(
    "line, processed",
    [
        ("a'4. r4. r4. d'8 e'8 a'8            |", "a'4.  r4.   r4.   d'8   e'8   a'8   |"),
    ],
)
def test_process_notes_line(line, processed):
    assert process_notes_line(line) == processed
