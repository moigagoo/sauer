import std/[os, strutils, strformat]

import climate/context

import ../utils
import ../templates/app
import ../templates/app/[pages, routes]
import ../templates/app/pages/page


const
  usageText = """Available commands:
    sauer init                initialize new Sauer project in the current directory
    sauer pages new           add new page
    sauer routes update       update routes
  """


proc info*(context: Context): int =
  echo "Welcome to Sauer!"

  if context.cmdOptions.hasKey("version") or context.cmdOptions.hasKey("v"):
    echo() 
    echo "Version: 0.1.0"

  if context.cmdOptions.hasKey("help") or context.cmdOptions.hasKey("h"):
    echo() 
    echo usageText

proc init*(context: Context): int =
  echo "Initializing new Sauer project..."

  let
    packageName = packageName()
    nimbleFilePath = packageName.addFileExt("nimble")
    appFilePath = "src" / packageName.addFileExt("nim")
    dirs = [
      "src" / packageName / "pages"
    ]
    files = {
      "src" / packageName / "pages.nim": pages.content(["index"]),
      "src" / packageName / "routes.nim": routes.content({"/": "index"}),
      "src" / packageName / "pages" / "index.nim": page.content("index")
    }
    requirements = [
      "requires \"karax >= 1.2.3\"",
      "requires \"kraut >= 1.0.0\"",
      "requires \"sauer >= 1.0.1\""
    ]

  for dir in dirs:
    echo(fmt"Creating directory {dir}".indent(4))
    createDir(dir)

  for (file, content) in files:
    echo(fmt"Creating file {file}".indent(4))
    file.writeFile(content)

  echo(fmt"Adding requirements to {nimbleFilePath}:".indent(4))

  let nimbleFile = nimbleFilePath.open(fmAppend)

  for requirement in requirements:
    echo(requirement.indent(8))
    nimbleFile.writeLine(requirement)

  close nimbleFile

  echo fmt"Patching {appFilePath}...".indent(4)

  appFilePath.writeFile(app.content(packageName))

  echo "Done!"

