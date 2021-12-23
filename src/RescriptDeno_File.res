// https://doc.deno.land/deno/stable/~/Deno.File

type t

@scope("Deno") @new
external make: int => t = "File"

@get
external rid: t => int = "rid"

@send
external close: t => unit = "close"

@send
external read: (t, Js.TypedArray2.Uint8Array.t) => Promise.t<option<int>> = "read"

@send
external readSync: (t, Js.TypedArray2.Uint8Array.t) => Promise.t<int> = "readSync"

@send
external seek: (t, int, RescriptDeno_IO.seekMode) => Promise.t<int> = "seek"

@send
external seekSync: (t, int, RescriptDeno_IO.seekMode) => int = "seekSync"

%%private(
  @send
  external _stat: t => Promise.t<RescriptDeno_FileInfo.nativeFileInfo> = "stat"

  @send
  external _statSync: t => RescriptDeno_FileInfo.nativeFileInfo = "statSync"
)

let stat = t => t->_stat->Promise.thenResolve(RescriptDeno_FileInfo.convert)

let statSync = t => t->_statSync->RescriptDeno_FileInfo.convert

@send
external truncate: (t, int) => Promise.t<unit> = "truncate"

@send
external truncateSync: (t, int) => unit = "truncateSync"

@send
external write: (t, Js.TypedArray2.Uint8Array.t) => Promise.t<int> = "write"

@send
external writeSync: (t, Js.TypedArray2.Uint8Array.t) => int = "writeSync"
