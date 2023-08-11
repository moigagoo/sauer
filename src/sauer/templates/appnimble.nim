#? stdtmpl
#proc content*(packageName: string): string =
requires "karax >= 1.3.0", "kraut >= 1.0.3"

taskRequires "serve", "static_server >= 2.2.1"


${"# Tasks"}

task make, "Build the app":
  exec findExe("karun") & " src/${packageName}.nim"

task serve, "Serve the app with a local server":
  echo "The app is served at: http://localhost:1337/app.html#/"
  echo()
  exec findExe("static_server")

