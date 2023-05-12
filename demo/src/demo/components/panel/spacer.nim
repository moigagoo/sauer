import karax/[kbase, vstyles]

import ../component


type Spacer* = object of Component
  flex*: Natural


proc initSpacer*(flex: Natural, customStyle = style()): Spacer =
  let defaultStyle = style {
    StyleAttr.flex: kstring $flex
  }

  Spacer(flex: flex, style: defaultStyle.merge(customStyle))
     
