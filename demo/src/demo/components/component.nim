import karax/[karaxdsl, vstyles, vdom]


type Component* = object of RootObj
  kind* = VNodeKind.tdiv
  style*: VStyle
  events*: EventHandlers


proc render*(component: Component): VNode =
  var node = newVNode(component.kind)

  node.style = component.style

  buildHtml:
    node

proc render*(component: Component, container: VNode): VNode =
  if container.style.isNil: 
    container.style = style()

  container.kind = component.kind
  container.style = component.style.merge(container.style)
  container.events.add(component.events)
  
  result = container

