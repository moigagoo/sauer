import karax/[karaxdsl, vstyles, vdom]


type Component* = object of RootObj
  kind* = VNodeKind.tdiv
  style*: VStyle


proc render*(component: Component): VNode =
  var node = newVNode(component.kind)

  node.style = component.style

  buildHtml:
    node

proc render*(component: Component, container: VNode): VNode =
  container.kind = component.kind
  container.style = component.style
  
  result = container

