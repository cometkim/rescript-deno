@unboxed
type rec arg = Unknown('a): arg

@module("https://deno.land/std/fmt/printf.ts") @variadic
external sprintf: (string, array<arg>) => string = "sprintf"

@module("https://deno.land/std/fmt/printf.ts") @variadic
external printf: (string, array<arg>) => unit = "printf"
