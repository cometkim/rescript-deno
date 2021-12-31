// see https://deno.land/std/examples/cat.ts

module Deno = RescriptDeno

let catFile = filename => {
  Deno.open_(filename, ())->Promise.thenResolve(file => {
    Deno.Std.Stream.copy(
      ~src=module(
        {
          let read = file->Deno.File.read
        }
      ),
      ~dst=module(Deno.Stdout.AsModule),
      (),
    )->Promise.thenResolve(_ => {
      file->Deno.File.close
    })
  })
}

Deno.args
->Belt.Array.reduce(Promise.resolve(), (promise, filename) =>
  promise->Promise.thenResolve(_ => catFile(filename)->ignore)
)
->ignore
