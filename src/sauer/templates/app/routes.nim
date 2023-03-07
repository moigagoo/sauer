#? stdtmpl
#proc content*(pages: openArray[tuple[pattern, moduleName: string]]): string =
import kraut/sugar


routes:
  #for (pattern, moduleName) in pages:
  "${pattern}": ${moduleName}
  #end for
