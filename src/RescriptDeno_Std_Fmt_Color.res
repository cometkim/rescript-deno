type rgb = {
  r: int,
  g: int,
  b: int,
}

@module("https://deno.land/std/fmt/colors.ts")
external setEnabled: bool => unit = "setColorEnabled"

@module("https://deno.land/std/fmt/colors.ts")
external getEnabled: unit => bool = "getColorEnabled"

@module("https://deno.land/std/fmt/colors.ts")
external bold: string => string = "bold"

@module("https://deno.land/std/fmt/colors.ts")
external reset: string => string = "reset"

@module("https://deno.land/std/fmt/colors.ts")
external dim: string => string = "dim"

@module("https://deno.land/std/fmt/colors.ts")
external italic: string => string = "italic"

@module("https://deno.land/std/fmt/colors.ts")
external underline: string => string = "underline"

@module("https://deno.land/std/fmt/colors.ts")
external inverse: string => string = "inverse"

@module("https://deno.land/std/fmt/colors.ts")
external hidden: string => string = "hidden"

@module("https://deno.land/std/fmt/colors.ts")
external strikethrough: string => string = "strikethrough"

@module("https://deno.land/std/fmt/colors.ts")
external black: string => string = "black"

@module("https://deno.land/std/fmt/colors.ts")
external red: string => string = "red"

@module("https://deno.land/std/fmt/colors.ts")
external green: string => string = "green"

@module("https://deno.land/std/fmt/colors.ts")
external yellow: string => string = "yellow"

@module("https://deno.land/std/fmt/colors.ts")
external blue: string => string = "blue"

@module("https://deno.land/std/fmt/colors.ts")
external magenta: string => string = "magenta"

@module("https://deno.land/std/fmt/colors.ts")
external cyan: string => string = "cyan"

@module("https://deno.land/std/fmt/colors.ts")
external white: string => string = "white"

@module("https://deno.land/std/fmt/colors.ts")
external gray: string => string = "gray"

@module("https://deno.land/std/fmt/colors.ts")
external brightBlack: string => string = "brightBlack"

@module("https://deno.land/std/fmt/colors.ts")
external brightRed: string => string = "brightRed"

@module("https://deno.land/std/fmt/colors.ts")
external brightGreen: string => string = "brightGreen"

@module("https://deno.land/std/fmt/colors.ts")
external brightYellow: string => string = "brightYellow"

@module("https://deno.land/std/fmt/colors.ts")
external brightBlue: string => string = "brightBlue"

@module("https://deno.land/std/fmt/colors.ts")
external brightMagenta: string => string = "brightMagenta"

@module("https://deno.land/std/fmt/colors.ts")
external brightCyan: string => string = "brightCyan"

@module("https://deno.land/std/fmt/colors.ts")
external brightWhite: string => string = "brightWhite"

@module("https://deno.land/std/fmt/colors.ts")
external bgBlack: string => string = "bgBlack"

@module("https://deno.land/std/fmt/colors.ts")
external bgRed: string => string = "bgRed"

@module("https://deno.land/std/fmt/colors.ts")
external bgGreen: string => string = "bgGreen"

@module("https://deno.land/std/fmt/colors.ts")
external bgYellow: string => string = "bgYellow"

@module("https://deno.land/std/fmt/colors.ts")
external bgBlue: string => string = "bgBlue"

@module("https://deno.land/std/fmt/colors.ts")
external bgMagenta: string => string = "bgMagenta"

@module("https://deno.land/std/fmt/colors.ts")
external bgCyan: string => string = "bgCyan"

@module("https://deno.land/std/fmt/colors.ts")
external bgWhite: string => string = "bgWhite"

@module("https://deno.land/std/fmt/colors.ts")
external bgBrightBlack: string => string = "bgBrightBlack"

@module("https://deno.land/std/fmt/colors.ts")
external bgBrightRed: string => string = "bgBrightRed"

@module("https://deno.land/std/fmt/colors.ts")
external bgBrightGreen: string => string = "bgBrightGreen"

@module("https://deno.land/std/fmt/colors.ts")
external bgBrightYellow: string => string = "bgBrightYellow"

@module("https://deno.land/std/fmt/colors.ts")
external bgBrightBlue: string => string = "bgBrightBlue"

@module("https://deno.land/std/fmt/colors.ts")
external bgBrightMagenta: string => string = "bgBrightMagenta"

@module("https://deno.land/std/fmt/colors.ts")
external bgBrightCyan: string => string = "bgBrightCyan"

@module("https://deno.land/std/fmt/colors.ts")
external bgBrightWhite: string => string = "bgBrightWhite"

@module("https://deno.land/std/fmt/colors.ts")
external rgb8: (string, int) => string = "rgb8"

@module("https://deno.land/std/fmt/colors.ts")
external bgRgb8: (string, int) => string = "bgRgb8"

@module("https://deno.land/std/fmt/colors.ts")
external rgb24: (string, rgb) => string = "rgb24"

@module("https://deno.land/std/fmt/colors.ts")
external bgRgb24: (string, rgb) => string = "bgRgb24"

@module("https://deno.land/std/fmt/colors.ts")
external stripColor: string => string = "stripColor"
