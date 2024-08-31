import std/[os, osproc, strutils, strformat, browsers, with, tables, times]

import climate

import ../utils
import ../templates/app
import ../templates/appnimble
import ../templates/app/[pages, routes, state]
import ../templates/app/pages/page


const
  helpText = """Welcome to Sauer!

Version: 1.1.0

Available commands:
    sauer init                initialize new Sauer project in the current directory
    sauer make                build the app
    sauer serve [--browse|-b] serve the app [and open it in the default browser]
    sauer pages new           add new page
    sauer pages list          list pages
"""


proc help*(context: Context): int =
  ## Show help text.

  echo helpText


proc init*(context: Context): int =
  ## Initialize new Sauer project.

  echo "Initializing new Sauer project..."

  let
    packageName = packageName()
    nimbleFilePath = packageName.addFileExt("nimble")
    appFilePath = "src" / packageName.addFileExt("nim")
    files = {
      "src" / packageName / "pages.nim": pages.content(["notfound", "index"]),
      "src" / packageName / "routes.nim": routes.content({"/": "index"}),
      "src" / packageName / "state.nim": state.content(),
      "src" / packageName / "pages" / "index.nim": page.content("index"),
      "src" / packageName / "pages" / "notfound.nim": page.content("notfound")
    }

  createDir("src" / packageName / "pages")

  for (file, content) in files:
    echo(fmt"Creating {file}".indent(4))
    file.writeFile(content)

  echo(fmt"Patching {appFilePath}".indent(4))
  appFilePath.writeFile(app.content(packageName))

  echo(fmt"Patching {nimbleFilePath}".indent(4))
  let nimbleFile = nimbleFilePath.open(fmAppend)
  nimbleFile.write(appnimble.content(packageName))
  close nimbleFile

  echo "Done!"


proc make*(context: Context): int =
  ## Invoke `nimble make`.

  var
    modTimes: Table[string, Time]
    period: float = 1

  discard execShellCmd("nimble make")

  with context:
    opt("serve", "s"):
      let server = startProcess("nimble serve", options = {poEvalCommand})
    opt("period", "p"):
      period = parseFloat(val)
    opt("watch", "w"):
      for file in walkDirRec("src"):
        modTimes[file] = getLastModificationTime(file)

      while true:
        for file in walkDirRec("src"):
          let modTime = getLastModificationTime(file)

          if modTime > modTimes[file]:
            discard execShellCmd("nimble make")
            modTimes[file] = modTime

        sleep (period * 1000).toInt


proc serve*(context: Context): int =
  ## Invoke `nimble serve` and open the default browser.

  if context.cmdOptions.hasKey("browse") or context.cmdOptions.hasKey("b"):
    openDefaultBrowser("http://localhost:1337/app.html#/")

  execShellCmd("nimble serve")

