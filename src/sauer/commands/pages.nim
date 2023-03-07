import std/[os, strutils, strformat]

import climate/context

import ../utils
import ../templates/app/pages/page


const
  usageText = """Usage:

    sauer pages new <name> --route=<route>
    sauer pages new <name> --default|-d

    --name                  unique page name, must be a valid Nim enum value 
    --route                 page route, can contain placehodlers, e.g. "/users/{userId}"
    --default|-d            generate route from name, i.e. if name is "users", the route is "#/users/".
  """


proc new*(context: Context): int =
  let
    nameArgPassed = len(context.cmdArguments) > 0
    routeOptPassed = context.cmdOptions.hasKey("route")
    defaultOptPassed = context.cmdOptions.hasKey("default") or context.cmdOptions.hasKey("d")

  if not (nameArgPassed and (routeOptPassed xor defaultOptPassed)):
    echo usageText
    return 1

  let
    name = context.cmdArguments[0]
    route =
      if routeOptPassed:
        normalizeRoute(context.cmdOptions["route"])
      else:
        normalizeRoute(name)
    packageName = packageName()
    pageFilePath = "src" / packageName / "pages" / name.addFileExt("nim")
    pagesFilePath = "src" / packageName / "pages.nim"
    routesFilePath = "src" / packageName / "routes.nim"

  echo(fmt"Adding page {name} to {route}...")

  echo(fmt"Creating page {pageFilePath}...".indent(4))
  pageFilePath.writeFile(page.content(name)) 

  echo(fmt"Patching {pagesFilePath}...".indent(4))
  let pagesFile = pagesFilePath.open(fmAppend)
  pagesFile.write(name.indent(2))
  close pagesFile

  echo(fmt"Patching {routesFilePath}...".indent(4))
  let routesFile = routesFilePath.open(fmAppend)
  routesFile.write(fmt""""{route}": {name}""".indent(2))
  close pagesFile

  echo "Done!"

proc list*(context: Context): int =
  var pageNames: seq[string]

  echo "Pages:"

  for filename in walkFiles("src" / packageName() / "pages" / "*.nim"):
    echo splitFile(filename).name.indent(4)

