function joinStringsWithSpace(...parts: string[]): string {
    return parts.join(" ");
}

function joinClassNames(...classNames: string[]): string {
    return joinStringsWithSpace(...classNames);
}


export { joinClassNames }