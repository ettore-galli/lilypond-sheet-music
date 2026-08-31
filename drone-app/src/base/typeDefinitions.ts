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
    [noteNamesMap.C]: 0,
    [noteNamesMap.Csharp]: 1,
    [noteNamesMap.D]: 2,
    [noteNamesMap.DSharp]: 3,
    [noteNamesMap.E]: 4,
    [noteNamesMap.F]: 5,
    [noteNamesMap.FSharp]: 6,
    [noteNamesMap.G]: 7,
    [noteNamesMap.GSharp]: 8,
    [noteNamesMap.A]: 9,
    [noteNamesMap.ASharp]: 10,
    [noteNamesMap.B]: 11,
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