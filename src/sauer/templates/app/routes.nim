#? stdtmpl
#import std/[strutils, sequtils]
#proc content*(pages: openArray[tuple[route, pageName: string]]): string =
import pages/[${pages.mapIt(it.pageName).join(", ")}]


const routes* = {
  #for (route, pageName) in pages:
  "${route}": ${pagename}.render,
  #end for
}

