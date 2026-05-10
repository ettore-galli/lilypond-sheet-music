import pygame
import sys
import time


def play_midi_by_beat(file_path, start_beat=0.0):
    try:
        pygame.mixer.init()
        pygame.mixer.music.load(file_path)

        print(f"File: {file_path}")
        print(f"Salto al beat: {start_beat}")

        # Facciamo partire la riproduzione
        pygame.mixer.music.play()

        # Sui MIDI, set_pos sposta il cursore ai "beat" (quarti)
        # Questo comando è solitamente più supportato di play(start=...)
        try:
            pygame.mixer.music.set_pos(start_beat)
        except pygame.error:
            print(
                "Avviso: Il salto per beat non è supportato su questa configurazione."
            )

        print("In riproduzione... Premi CTRL+C per fermare.")

        while pygame.mixer.music.get_busy():
            time.sleep(1)

    except KeyboardInterrupt:
        print("\nStop richiesto dall'utente.")
        pygame.mixer.music.stop()
    finally:
        pygame.mixer.quit()


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Utilizzo: python player.py <file_midi> [beat_di_inizio]")
        print("Esempio: python player.py song.mid 16 (parte dalla battuta 5 in 4/4)")
    else:
        percorso = sys.argv[1]
        beat_inizio = float(sys.argv[2]) if len(sys.argv) > 2 else 0.0
        play_midi_by_beat(percorso, beat_inizio)
