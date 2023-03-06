import std/os


proc packageName*: string =
  ## Determine the Nimble package name from the .nimble file name in the current directory.

  for filename in walkFiles("*.nimble"):
    return splitFile(filename).name

