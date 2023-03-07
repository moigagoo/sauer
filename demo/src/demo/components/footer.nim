import karax/[karaxdsl, kbase, vstyles, vdom]


proc render*: VNode =
  buildHtml:
    tdiv(style = {width: "100%", height: "200px", position: "fixed", bottom: "0", background: "aliceblue"}):
      ul:
        li: text "About us"
        li: text "Contact us"

