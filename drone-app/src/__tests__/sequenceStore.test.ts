import { describe, it, expect, beforeEach } from 'vitest'

import { loadState, saveState } from "../sequenceStore";
import type { AppState } from "../sequenceStore";
const KEY = "intonation-app-state";

describe("sequenceStore", () => {
    beforeEach(() => {
        // Puliamo localStorage prima di ogni test
        localStorage.clear();
    });

    it("loadState() ritorna lo stato di default se non c'è nulla", () => {
        const state = loadState();

        expect(state).toEqual({
            sequence: [],
            bpm: 120,
            loop: false,
            octave: 4,
        });
    });

    it("loadState() ritorna lo stato salvato in localStorage", () => {
        const saved: AppState = {
            sequence: ["C4", "D4"],
            bpm: 140,
            loop: true,
            octave: 5,
        };

        localStorage.setItem(KEY, JSON.stringify(saved));

        const state = loadState();
        expect(state).toEqual(saved);
    });

    it("saveState() salva correttamente in localStorage", () => {
        const state: AppState = {
            sequence: ["A4"],
            bpm: 100,
            loop: false,
            octave: 3,
        };

        saveState(state);

        const raw = localStorage.getItem(KEY);
        expect(raw).not.toBeNull();
        expect(JSON.parse(raw!)).toEqual(state);
    });
});
