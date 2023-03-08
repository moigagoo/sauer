import karax/[karaxdsl, vdom]

import navbar, footer


template render*(body: untyped): untyped =
  buildHtml(tdiv):
    navbar.render()

    main:
      body

    footer.render()

