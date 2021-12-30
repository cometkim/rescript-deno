// TODO: https://deno.land/std/streams/conversion.ts
//
// rescript
// - [Iterable]
// - [IterableIterator]
// - [AsyncIterable]
// - [AsyncIterableIterator]
// rescript-webapi
// - [WritableStream]
// - [ReadableStreamDefaultReader]
// - [WritableStreamDefaultWriter]

// @module("https://deno.land/std/streams/mod.ts")

@module("https://deno.land/std/streams/mod.ts")
external readAll: module(RescriptDeno_IO.Reader) => Promise.t<Js.TypedArray2.Uint8Array.t> =
  "readAll"

@module("https://deno.land/std/streams/mod.ts")
external readAllSync: module(RescriptDeno_IO.ReaderSync) => Js.TypedArray2.Uint8Array.t =
  "readAllSync"

@module("https://deno.land/std/streams/mod.ts")
external writeAll: module(RescriptDeno_IO.Writer) => Promise.t<unit> = "writeAll"

@module("https://deno.land/std/streams/mod.ts")
external writeAllSync: module(RescriptDeno_IO.WriterSync) => unit = "writeAllSync"

type copyOptions

%%private(
  @obj
  external makeCopyOptions: (~bufSize: option<int>=?) => copyOptions = ""

  @module("https://deno.land/std/streams/mod.ts")
  external _copy: (
    ~src: module(RescriptDeno_IO.Reader),
    ~dst: module(RescriptDeno_IO.Writer),
    ~options: copyOptions,
  ) => Promise.t<int> = "copy"
)

let copy = (~src, ~dst, ~bufSize=?, ()) => makeCopyOptions(~bufSize)->_copy(~src, ~dst, ~options=_)

// TODO: https://deno.land/std/streams/delimiter.ts
//
// rescript-webapi
// - [TransformStream]

// https://deno.land/std/streams/merge.ts
@module("https://deno.land/std/streams/mod.ts") @variadic
external mergeReadableStreams: array<Webapi.ReadableStream.t> => Webapi.ReadableStream.t =
  "mergeReadableStreams"

// https://deno.land/std/streams/merge.ts
@module("https://deno.land/std/streams/mod.ts") @variadic
external zipReadableStreams: array<Webapi.ReadableStream.t> => Webapi.ReadableStream.t =
  "zipReadableStreams"
