import climate

import commands/[sauer, pages, routes]


const commands = {
  "init": sauer.init,
  "pages new": pages.new,
  "routes update": routes.update
}


quit parseCommands(commands, defaultHandler = sauer.info)

