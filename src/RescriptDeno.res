// See https://github.com/denoland/deno/blob/v1.11.3/cli/dts/lib.deno.ns.d.ts

@scope("Deno") @val external args: array<string> = "args"

@scope("Deno") @val external pid: int = "pid"

@scope("Deno") @val external ppid: int = "pid"

@scope("Deno") @val external noColor: bool = "noColor"

// https://doc.deno.land/builtin/stable#Deno.chdir
@scope("Deno") @val external chdir: (~dir: string) => unit = "chdir"

// https://doc.deno.land/builtin/stable#Deno.chmod
@scope("Deno") @val external chmod: (~path: string, ~mode: int) => Promise.t<unit> = "chmod"

// https://doc.deno.land/builtin/stable#Deno.chmodSync
@scope("Deno") @val external chmodSync: (~path: string, ~mode: int) => unit = "chmod"

// https://doc.deno.land/builtin/stable#Deno.chown
@scope("Deno") @val
external chown: (~path: string, ~uid: option<int>, ~gid: option<int>) => Promise.t<unit> = "chown"

// https://doc.deno.land/builtin/stable#Deno.chownSync
@scope("Deno") @val
external chownSync: (~path: string, ~uid: option<int>, ~gid: option<int>) => unit = "chownSync"

// https://doc.deno.land/builtin/stable#Deno.close
@scope("Deno") @val external close: (~rid: int) => unit = "close"

// https://doc.deno.land/builtin/stable#Deno.cwd
@scope("Deno") @val external cwd: unit => string = "cwd"

// https://doc.deno.land/builtin/stable#Deno.execPath
@scope("Deno") @val external execPath: unit => string = "execPath"

// https://doc.deno.land/builtin/stable#Deno.exit
@scope("Deno") @val external exit: (~code: int) => unit = "exit"

// https://doc.deno.land/builtin/stable#Deno.fdatasync
@scope("Deno") @val external fdatasync: (~rid: int) => Promise.t<unit> = "fdatasync"

// https://doc.deno.land/builtin/stable#Deno.fdatasyncSync
@scope("Deno") @val external fdatasyncSync: (~rid: int) => unit = "fdatasyncSync"

// https://doc.deno.land/builtin/stable#Deno.FileInfo
module FileInfo = RescriptDeno_FileInfo

%%private(
  @scope("Deno") @val
  external _fstat: (~rid: int) => Promise.t<FileInfo.nativeFileInfo> = "fstat"

  @scope("Deno") @val external _fstatSync: (~rid: int) => FileInfo.nativeFileInfo = "fstatSync"
)

// https://doc.deno.land/builtin/stable#Deno.fstat
let fstat = (~rid) => _fstat(~rid)->Promise.thenResolve(FileInfo.convert)

// https://doc.deno.land/builtin/stable#Deno.fstatSync
let fstatSync = (~rid) => _fstatSync(~rid)->FileInfo.convert

// https://doc.deno.land/builtin/stable#Deno.fsync
@scope("Deno") @val external fsync: (~rid: int) => Promise.t<unit> = "fsync"

// https://doc.deno.land/builtin/stable#Deno.fsyncSync
@scope("Deno") @val external fsyncSync: (~rid: int) => unit = "fsyncSync"

// https://doc.deno.land/builtin/stable#Deno.ftruncate
@scope("Deno") @val external ftruncate: (~rid: int, ~len: int) => Promise.t<unit> = "ftruncate"

// https://doc.deno.land/builtin/stable#Deno.ftruncateSync
@scope("Deno") @val external ftruncateSync: (~rid: int, ~len: int) => unit = "ftruncate"

// https://doc.deno.land/builtin/stable#Deno.InspectOptions
type inspectOptions

%%private(
  @obj
  external makeInspectOptions: (
    ~colors: option<bool>=?,
    ~compact: option<bool>=?,
    ~depth: option<int>=?,
    ~iterableLimit: option<int>=?,
    ~showProxy: option<bool>=?,
    ~sorted: option<bool>=?,
    ~trailingComma: option<bool>=?,
    ~getters: option<bool>=?,
    ~showHidden: option<bool>=?,
    unit,
  ) => inspectOptions = ""

  @scope("Deno") @val external _inspect: ('a, inspectOptions) => string = "inspect"
)

// https://doc.deno.land/builtin/stable#Deno.inspect
let inspect = (
  value,
  ~colors=?,
  ~compact=?,
  ~depth=?,
  ~iterableLimit=?,
  ~showProxy=?,
  ~sorted=?,
  ~trailingComma=?,
  ~getters=?,
  ~showHidden=?,
  (),
) =>
  _inspect(
    value,
    makeInspectOptions(
      ~colors,
      ~compact,
      ~depth,
      ~iterableLimit,
      ~showProxy,
      ~sorted,
      ~trailingComma,
      ~getters,
      ~showHidden,
      (),
    ),
  )

// https://doc.deno.land/builtin/stable#Deno.isatty
@scope("Deno") @val external isatty: (~rid: int) => bool = "isatty"

type signal<'a> = [<
  | #SIGABRT
  | #SIGALRM
  | #SIGBUS
  | #SIGCHLD
  | #SIGCONT
  | #SIGEMT
  | #SIGFPE
  | #SIGHUP
  | #SIGILL
  | #SIGINFO
  | #SIGINT
  | #SIGIO
  | #SIGKILL
  | #SIGPIPE
  | #SIGPROF
  | #SIGPWR
  | #SIGQUIT
  | #SIGSEGV
  | #SIGSTKFLT
  | #SIGSTOP
  | #SIGSYS
  | #SIGTERM
  | #SIGTRAP
  | #SIGTSTP
  | #SIGTTIN
  | #SIGTTOU
  | #SIGURG
  | #SIGUSR1
  | #SIGUSR2
  | #SIGVTALRM
  | #SIGWINCH
  | #SIGXCPU
  | #SIGXFSZ
] as 'a

// TODO: https://doc.deno.land/builtin/stable#Deno.iter

// TODO: https://doc.deno.land/builtin/stable#Deno.iterSync

// https://doc.deno.land/builtin/stable#Deno.kill
@scope("Deno") @val external kill: (~pid: int, ~signal: signal<'a>) => unit = "kill"

// https://doc.deno.land/builtin/stable#Deno.link
@scope("Deno") @val
external link: (~oldpath: string, ~newpath: string) => Promise.t<unit> = "link"

// https://doc.deno.land/builtin/stable#Deno.linkSync
@scope("Deno") @val external linkSync: (~oldpath: string, ~newpath: string) => unit = "linkSync"

%%private(
  @scope("Deno") @val
  external _lstat: (~path: string) => Promise.t<FileInfo.nativeFileInfo> = "lstat"

  @scope("Deno") @val
  external _lstatSync: (~path: string) => FileInfo.nativeFileInfo = "lstatSync"
)

// https://doc.deno.land/builtin/stable#Deno.lstat
let lstat = (~path) => _lstat(~path)->Promise.thenResolve(FileInfo.convert)

// https://doc.deno.land/builtin/stable#Deno.lstatSync
let lstatSync = (~path) => _lstatSync(~path)->FileInfo.convert

// https://doc.deno.land/builtin/stable#Deno.MakeTempOptions
type makeTempOptions

%%private(
  @obj
  external makeMakeTempOptions: (
    ~dir: option<string>=?,
    ~prefix: option<string>=?,
    ~suffix: option<string>=?,
  ) => makeTempOptions = ""

  @scope("Deno") @val
  external _makeTempDir: makeTempOptions => Promise.t<string> = "makeTempDir"

  @scope("Deno") @val
  external _makeTempDirSync: makeTempOptions => string = "makeTempDirSync"

  @scope("Deno") @val
  external _makeTempFile: makeTempOptions => Promise.t<string> = "makeTempFile"

  @scope("Deno") @val
  external _makeTempFileSync: makeTempOptions => string = "makeTempFileSync"
)

// https://doc.deno.land/builtin/stable#Deno.makeTempDir
let makeTempDir = (~dir=?, ~prefix=?, ~suffix=?, ()) =>
  makeMakeTempOptions(~dir, ~prefix, ~suffix)->_makeTempDir

// https://doc.deno.land/builtin/stable#Deno.makeTempDirSync
let makeTempDirSync = (~dir=?, ~prefix=?, ~suffix=?, ()) =>
  makeMakeTempOptions(~dir, ~prefix, ~suffix)->_makeTempDirSync

// https://doc.deno.land/builtin/stable#Deno.makeTempFile
let makeTempFile = (~dir=?, ~prefix=?, ~suffix=?, ()) =>
  makeMakeTempOptions(~dir, ~prefix, ~suffix)->_makeTempFile

// https://doc.deno.land/builtin/stable#Deno.makeTempFileSync
let makeTempFileSync = (~dir=?, ~prefix=?, ~suffix=?, ()) =>
  makeMakeTempOptions(~dir, ~prefix, ~suffix)->_makeTempFileSync

// https://doc.deno.land/builtin/stable#Deno.MemoryUsage
type memoryUsage = {
  rss: int,
  heapTotal: int,
  heapUsed: int,
  \"external": int,
}

// https://doc.deno.land/builtin/stable#Deno.memoryUsage
@scope("Deno") @val external memoryUsage: unit => memoryUsage = "memoryUsage"

// https://doc.deno.land/deno/stable/~/Deno.readFile
@scope("Deno") @val
external readFile: (string, unit) => Promise.t<Js.TypedArray2.Uint8Array.t> = "readFile"

// https://doc.deno.land/deno/stable/~/Deno.readFileSync
@scope("Deno") @val external readFileSync: string => Js.TypedArray2.Uint8Array.t = "readFileSync"

// https://doc.deno.land/deno/stable/~/Deno.readTextFile
@scope("Deno") @val external readTextFile: (string, unit) => Promise.t<string> = "readTextFile"

// https://doc.deno.land/deno/stable/~/Deno.readTextFileSync
@scope("Deno") @val external readTextFileSync: string => string = "readTextFileSync"

module IO = RescriptDeno_IO

module Stdout = {
  type t

  @scope("Deno") @val
  external stdout: t = "stdout"

  @get
  external rid: t => int = "rid"

  @send
  external write: (t, Js.TypedArray2.Uint8Array.t) => Promise.t<int> = "write"

  @send
  external writeSync: (t, Js.TypedArray2.Uint8Array.t) => int = "writeSync"

  @send
  external close: t => unit = "close"

  module AsModule = {
    let write = stdout->write
    let writeSync = stdout->writeSync
    let close = stdout->close
  }
}

module Stdin = {
  type t

  @scope("Deno") @val
  external stdin: t = "stdin"

  @get
  external rid: t => int = "rid"

  @send
  external read: (t, Js.TypedArray2.Uint8Array.t) => Promise.t<option<int>> = "read"

  @send
  external readSync: (t, Js.TypedArray2.Uint8Array.t) => option<int> = "readSync"

  @send
  external close: t => unit = "close"

  module AsModule = {
    let read = stdin->read
    let readSync = stdin->readSync
    let close = stdin->close
  }
}

module Stderr = {
  type t

  @scope("Deno") @val
  external stderr: t = "stderr"

  @get
  external rid: t => int = "rid"

  @send
  external write: (t, Js.TypedArray2.Uint8Array.t) => Promise.t<int> = "write"

  @send
  external writeSync: (t, Js.TypedArray2.Uint8Array.t) => int = "writeSync"

  @send
  external close: t => unit = "close"

  module AsModule = {
    let write = stderr->write
    let writeSync = stderr->writeSync
    let close = stderr->close
  }
}

let stdout = Stdout.stdout
let stdin = Stdin.stdin
let stderr = Stderr.stderr

module File = RescriptDeno_File

type openOptions

%%private(
  @obj
  external makeOpenOptions: (
    ~append: option<bool>=?,
    ~create: option<bool>=?,
    ~createNew: option<bool>=?,
    ~mode: option<int>=?,
    ~read: option<bool>=?,
    ~truncate: option<bool>=?,
    ~write: option<bool>=?,
    unit,
  ) => openOptions = ""

  @scope("Deno") @val
  external _open: (string, openOptions) => Promise.t<RescriptDeno_File.t> = "open"

  @scope("Deno") @val
  external _openSync: (string, openOptions) => RescriptDeno_File.t = "openSync"
)

let open_ = (
  path,
  ~append=?,
  ~create=?,
  ~createNew=?,
  ~mode=?,
  ~read=true,
  ~truncate=?,
  ~write=?,
  (),
) =>
  makeOpenOptions(
    ~append,
    ~create,
    ~createNew,
    ~mode,
    ~read=Some(read),
    ~truncate,
    ~write,
    (),
  )->_open(path, _)

let openSync = (
  path,
  ~append=?,
  ~create=?,
  ~createNew=?,
  ~mode=?,
  ~read=true,
  ~truncate=?,
  ~write=?,
  (),
) =>
  makeOpenOptions(
    ~append,
    ~create,
    ~createNew,
    ~mode,
    ~read=Some(read),
    ~truncate,
    ~write,
    (),
  )->_openSync(path, _)

module Env = RescriptDeno_Env

@scope("Deno") @val external env: Env.t = "env"

module Std = RescriptDeno_Std
