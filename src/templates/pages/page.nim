#? stdtmpl
#proc content*(pageName: string): string =
import karax/[karaxdsl, vdom]
import kraut/context


proc render*(context: Context): VNode =
  buildHtml(tdiv):
    h1: text "${pageName}"

