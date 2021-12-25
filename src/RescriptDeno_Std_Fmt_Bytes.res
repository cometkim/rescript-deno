type prettyBytesOptions

%%private(
  @obj
  external makePrettyBytesOptions: (
    ~bits: option<bool>=?,
    ~binary: option<bool>=?,
    ~signed: option<bool>=?,
    ~locale: option<array<string>>=?,
    ~minimumFractionDigits: option<int>=?,
    ~maximumFractionDigits: option<int>=?,
    unit,
  ) => prettyBytesOptions = ""

  @module("https://deno.land/std/fmt/bytes.ts")
  external _prettyBytes: (int, prettyBytesOptions) => string = "prettyBytes"
)

let prettyBytes = (
  num,
  ~bits=?,
  ~binary=?,
  ~signed=?,
  ~locale=?,
  ~minimumFractionDigits=?,
  ~maximumFractionDigits=?,
  (),
) =>
  makePrettyBytesOptions(
    ~bits,
    ~binary,
    ~signed,
    ~locale,
    ~minimumFractionDigits,
    ~maximumFractionDigits,
    (),
  )->_prettyBytes(num, _)
