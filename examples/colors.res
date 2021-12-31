// see https://deno.land/std/examples/colors.ts

@scope("import.meta") @val
external main: bool = "main"

if main {
  open RescriptDeno.Std.Fmt.Color

  "Hello world!"->bold->red->italic->bgBlue->Js.log
}
