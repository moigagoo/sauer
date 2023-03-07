import std/[os, strutils]


proc packageName*: string =
  ## Determine the Nimble package name from the .nimble file name in the current directory.

  for filename in walkFiles("*.nimble"):
    return splitFile(filename).name

proc normalizeRoute*(route: string): string =
  ## Ensure the pattern starts with "#/" and ends with "/".

  result = route

  if result.startsWith("#"): result.removePrefix('#')
  if result.startsWith("/"): result.removePrefix('/')
  if result.endsWith("/"): result.removeSuffix('/')

  result = "#/" & result & "/"

proc pageNames*: seq[string] =
  ## Get page names by walking files in "src/<appName>/pages/" directory.

  for filename in walkFiles("src" / packageName() / "pages" / "*.nim"):
    result.add splitFile(filename).name

