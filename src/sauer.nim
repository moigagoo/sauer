import climate

import sauer/commands/[sauer, pages]


const commands = {
  "init": sauer.init,
  "make": sauer.make,
  "serve": sauer.serve,
  "pages new": pages.new,
  "pages list": pages.list
}


quit parseCommands(commands, defaultHandler = sauer.help)

