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
