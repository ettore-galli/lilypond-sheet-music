import type { ITimer, TimerCallback } from "./base/typeDefinitions";


class Timer implements ITimer{
    setTimeout(cb: TimerCallback, ms: number): void {
        setTimeout(cb, ms);
    }
}

 

