type argParsingOptions

@obj
external makeArgParsingOptions: (
  ~\"--": option<bool>=?,
  ~alias: option<{..}>=?,
  ~boolean: option<{..}>=?,
  ~default: option<{..}>=?,
  ~stopEarly: option<bool>=?,
  ~string: option<array<string>>=?,
  unit,
) => argParsingOptions = ""

%%private(
  @module("https://deno.land/std/flags/mod.ts")
  external _parse: (array<string>, argParsingOptions) => {..} = "parse"
)

let parse = (args, ~\"--"=?, ~alias=?, ~boolean=?, ~default=?, ~stopEarly=?, ~string=?, ()) =>
  makeArgParsingOptions(~\"--", ~alias, ~boolean, ~default, ~stopEarly, ~string, ())->_parse(
    args,
    _,
  )
