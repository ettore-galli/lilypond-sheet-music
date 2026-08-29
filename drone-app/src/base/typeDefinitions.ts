export type TimerCallback = () => void;

export interface ITimer {
    setTimeout(cb: TimerCallback, ms: number): void;
}


export const noteNamesMap: Record<string, string> = {
    C: "C",
    Csharp: "C#",
    D: "D",
    DSharp: "D#",
    E: "E",
    F: "F",
    FSharp: "F#",
    G: "G",
    GSharp: "G#",
    A: "A",
    ASharp: "A#",
    B: "B",
};


type NoteIntervals = Record<string, number>;

export const noteIntervalsMap: NoteIntervals = {
    [noteNamesMap.A]: 0,
    [noteNamesMap.ASharp]: 1,
    [noteNamesMap.B]: 2,
    [noteNamesMap.C]: 3,
    [noteNamesMap.Csharp]: 4,
    [noteNamesMap.D]: 5,
    [noteNamesMap.DSharp]: 6,
    [noteNamesMap.E]: 7,
    [noteNamesMap.F]: 8,
    [noteNamesMap.FSharp]: 9,
    [noteNamesMap.G]: 10,
    [noteNamesMap.GSharp]: 11,
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