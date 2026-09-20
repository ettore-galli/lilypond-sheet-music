import { useEffect, useRef } from "react";

export function useWakeLock() {
    const wakeLockRef = useRef<WakeLockSentinel>(null);

    useEffect(() => {
        async function requestWakeLock() {
            try {
                if ("wakeLock" in navigator) {
                    wakeLockRef.current = await navigator.wakeLock.request("screen");
                }
            } catch (err) {
                console.error("WakeLock error:", err);
            }
        }

        requestWakeLock();

        return () => {
            wakeLockRef.current?.release?.();
        };

    }, []);
}
