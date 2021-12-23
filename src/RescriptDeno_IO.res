module type Reader = {
  let read: Js.TypedArray2.Uint8Array.t => Promise.t<option<int>>
}

module type ReaderSync = {
  let readSync: Js.TypedArray2.Uint8Array.t => option<int>
}

module type Writer = {
  let write: Js.TypedArray2.Uint8Array.t => Promise.t<int>
}

module type WriterSync = {
  let writeSync: Js.TypedArray2.Uint8Array.t => int
}

module type Closer = {
  let close: unit => unit
}

type seekMode =
  | @as(0) Start
  | @as(1) Current
  | @as(2) End

module type Seeker = {
  let seek: (int, seekMode) => Promise.t<int>
}

module type SeekerSync = {
  let seekSync: (int, seekMode) => int
}
