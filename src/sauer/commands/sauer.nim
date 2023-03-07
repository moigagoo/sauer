import std/[os, strutils, strformat]

import climate/context

import ../utils
import ../templates/app
import ../templates/appnimble
import ../templates/app/[pages, routes]
import ../templates/app/pages/[page, notfound]


const
  helpText = """Welcome to Sauer!

Version: 1.0.0

Available commands:
    sauer init                initialize new Sauer project in the current directory
    sauer pages new           add new page
    sauer pages list          list pages
"""


proc help*(context: Context): int =
  echo helpText

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
      "src" / packageName / "pages" / "index.nim": page.content("index"),
      "src" / packageName / "pages" / "notfound.nim": notfound.content()
    }

  for dir in dirs:
    echo(fmt"Creating directory {dir}".indent(4))
    createDir(dir)

  for (file, content) in files:
    echo(fmt"Creating file {file}".indent(4))
    file.writeFile(content)

  echo(fmt"Patching {nimbleFilePath}...".indent(4))
  let nimbleFile = nimbleFilePath.open(fmAppend)
  nimbleFile.write(appnimble.content(packageName))
  close nimbleFile

  echo(fmt"Patching {appFilePath}...".indent(4))
  appFilePath.writeFile(app.content(packageName))

  echo "Done!"

