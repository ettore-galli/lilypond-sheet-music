import pygame
import sys
import time


def play_midi(file_path):
    try:
        # Inizializza il mixer di pygame per la musica
        pygame.mixer.init()

        # Carica il file MIDI
        pygame.mixer.music.load(file_path)

        print(f"Riproduzione in corso: {file_path}")
        print("Premi CTRL+C per fermare la riproduzione.")

        # Inizia la riproduzione
        pygame.mixer.music.play()

        # Ciclo di attesa finché la musica è in esecuzione
        while pygame.mixer.music.get_busy():
            time.sleep(1)

    except pygame.error as e:
        print(f"Errore durante la riproduzione: {e}")
    except KeyboardInterrupt:
        # Intercetta il CTRL+C
        print("\nRiproduzione interrotta dall'utente. Arrivederci!")
        pygame.mixer.music.stop()
    finally:
        # Chiude correttamente il mixer
        pygame.mixer.quit()


if __name__ == "__main__":
    # Verifica se è stato passato un file come argomento
    if len(sys.argv) < 2:
        print("Utilizzo: python player.py <percorso_file_midi>")
    else:
        percorso = sys.argv[1]
        play_midi(percorso)
