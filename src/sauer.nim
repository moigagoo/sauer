import climate

import sauer/commands/[sauer, pages]


const commands = {
  "init": sauer.init,
  "pages new": pages.new,
  "pages list": pages.list
}


quit parseCommands(commands, defaultHandler = sauer.help)

