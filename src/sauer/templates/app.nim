#? stdtmpl
#proc content*(packageName: string): string =
import karax/karax

import kraut

import ${packageName}/routes


setRenderer(routeRenderer(routes.routes))

