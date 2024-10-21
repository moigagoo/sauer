#? stdtmpl
#proc content*(pages: openArray[tuple[pattern, moduleName: string]]): string =
import kraut


routes:
  #for (pattern, moduleName) in pages:
  "${pattern}": ${moduleName}
  #end for
