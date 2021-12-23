// https://doc.deno.land/builtin/stable#Deno.FileInfo
type nativeFileInfo = {
  isFile: bool,
  isDirectory: bool,
  isSymlink: bool,
  size: int,
  mtime: option<Js.Date.t>,
  atime: option<Js.Date.t>,
  birthtime: option<Js.Date.t>,
  dev: option<int>,
  ino: option<int>,
  mode: option<int>,
  nlink: option<int>,
  uid: option<int>,
  gid: option<int>,
  rdev: option<int>,
  blksize: option<int>,
  blocks: option<int>,
}

type fileInfo = {
  size: int,
  mtime: option<Js.Date.t>,
  atime: option<Js.Date.t>,
  birthtime: option<Js.Date.t>,
  dev: option<int>,
  ino: option<int>,
  mode: option<int>,
  nlink: option<int>,
  uid: option<int>,
  gid: option<int>,
  rdev: option<int>,
  blksize: option<int>,
  blocks: option<int>,
}

type t =
  | File(fileInfo)
  | Directory(fileInfo)
  | Symlink(fileInfo)

let convert = fileInfo =>
  switch fileInfo {
  | {
      isFile: true,
      isDirectory: false,
      isSymlink: false,
      size,
      mtime,
      atime,
      birthtime,
      dev,
      ino,
      mode,
      nlink,
      uid,
      gid,
      rdev,
      blksize,
      blocks,
    } =>
    File({
      size: size,
      mtime: mtime,
      atime: atime,
      birthtime: birthtime,
      dev: dev,
      ino: ino,
      mode: mode,
      nlink: nlink,
      uid: uid,
      gid: gid,
      rdev: rdev,
      blksize: blksize,
      blocks: blocks,
    })
  | {
      isFile: false,
      isDirectory: true,
      isSymlink: false,
      size,
      mtime,
      atime,
      birthtime,
      dev,
      ino,
      mode,
      nlink,
      uid,
      gid,
      rdev,
      blksize,
      blocks,
    } =>
    Directory({
      size: size,
      mtime: mtime,
      atime: atime,
      birthtime: birthtime,
      dev: dev,
      ino: ino,
      mode: mode,
      nlink: nlink,
      uid: uid,
      gid: gid,
      rdev: rdev,
      blksize: blksize,
      blocks: blocks,
    })
  | {
      isFile: false,
      isDirectory: false,
      isSymlink: true,
      size,
      mtime,
      atime,
      birthtime,
      dev,
      ino,
      mode,
      nlink,
      uid,
      gid,
      rdev,
      blksize,
      blocks,
    } =>
    Symlink({
      size: size,
      mtime: mtime,
      atime: atime,
      birthtime: birthtime,
      dev: dev,
      ino: ino,
      mode: mode,
      nlink: nlink,
      uid: uid,
      gid: gid,
      rdev: rdev,
      blksize: blksize,
      blocks: blocks,
    })
  | _ => Js.Exn.raiseTypeError("invariant file info")
  }
