import climate/context


proc new*(context: Context): int =
  if not context.cmdOptions.hasKey("name"):
    echo "name param required"
    return 1

  let
    pageName = context.cmdOptions["name"]
     

  echo "Add page " & pageName

