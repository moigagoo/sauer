#? stdtmpl
#proc content*(pages: openArray[string]): string =
type Page* = enum
  #for page in pages:
  $page
  #end for

