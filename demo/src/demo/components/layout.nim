import karax/[karaxdsl, vdom]

import navbar, footer


proc render*(content: VNode): VNode =
  buildHtml(tdiv):
    navbar.render()

    main:
      content

    footer.render()

