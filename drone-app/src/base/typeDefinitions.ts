export type TimerCallback = () => void;

export interface ITimer {
    setTimeout(cb: TimerCallback, ms: number): void;
}


export const noteNamesMap: Record<string, string> = {
    C: "C",
    CSharp: "C#",
    DFlat: "Db",
    D: "D",
    DSharp: "D#",
    EFlat: "Eb",
    E: "E",
    F: "F",
    FSharp: "F#",
    GFlat: "Gb",
    G: "G",
    GSharp: "G#",
    AFlat: "Ab",
    A: "A",
    ASharp: "A#",
    BFlat: "Bb",
    B: "B",
    NoKey: ""
};


type NoteIntervals = Record<string, number>;

export const noteIntervalsMap: NoteIntervals = {
    [noteNamesMap.C]: -9,
    [noteNamesMap.CSharp]: -8,
    [noteNamesMap.D]: -7,
    [noteNamesMap.DSharp]: -6,
    [noteNamesMap.E]: -5,
    [noteNamesMap.F]: -4,
    [noteNamesMap.FSharp]: -3,
    [noteNamesMap.G]: -2,
    [noteNamesMap.GSharp]: -1,
    [noteNamesMap.A]: 0,
    [noteNamesMap.ASharp]: 1,
    [noteNamesMap.B]: 2,
}

export class SequencerNote {
    readonly noteName: string;
    readonly octave: number;


    constructor(noteName: string, octave: number) {
        this.noteName = noteName;
        this.octave = octave;
    }
}

export class AudioEngineNote {
    readonly freq: number;
    readonly duration: number;

    constructor(freq: number, duration: number) {
        this.freq = freq;
        this.duration = duration;
    }
}

export interface IAudioEngine {
    playFreq(note: AudioEngineNote): void;
}

export type NotePlayer = (note: AudioEngineNote) => void;