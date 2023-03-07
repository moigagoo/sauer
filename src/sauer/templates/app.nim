#? stdtmpl
#proc content*(packageName: string): string =
import karax/karax

import kraut

import ${packageName}/routes
import ${packageName}/pages/notfound


let renderer = routeRenderer(routes.routes, defaultRenderer = notfound.render)

setRenderer(renderer)

