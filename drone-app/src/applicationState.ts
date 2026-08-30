export interface AppState {
  sequence: string[];
  bpm: number;
  loop: boolean;
  octave: number;
}

const KEY = "intonation-app-state";

export function loadState(): AppState {
  const raw = localStorage.getItem(KEY);
  if (!raw) {
    return { sequence: [], bpm: 120, loop: false, octave: 4 };
  }
  return JSON.parse(raw);
}

export function saveState(state: AppState) {
  localStorage.setItem(KEY, JSON.stringify(state));
}
