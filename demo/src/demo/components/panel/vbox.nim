import karax/[kbase, vstyles]

import ../component


type
  Direction* = enum
    ttb, btt 
  Alignment* = enum
    left, center, right
  VBox* = object of Component
    flex*: Natural = 1
    direction* = ttb


proc initVBox*(flex: Natural = 1, direction = ttb, alignment = left, customStyle = style()): VBox =
  let
    flexDirection = case direction
      of ttb:
        "column"
      of btt:
        "column-reverse"
    alignItems = case alignment
      of left:
        "normal"
      of center:
        "center"
      of right:
        "end"
    defaultStyle = style {
      StyleAttr.display: kstring "flex",
      StyleAttr.flex: kstring $flex,
      StyleAttr.flexDirection: kstring flexDirection,
      StyleAttr.alignItems: kstring alignItems
    }

  VBox(flex: flex, style: defaultStyle.merge(customStyle))

