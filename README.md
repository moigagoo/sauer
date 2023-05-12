# Sauer

**Sauer** is a command-line scaffolder for Kraut-powered Karax SPAs.


# Installation

Install Sauer with Nimble:

```
$ nimble install -y sauer
```

or add to your .nimble file:

```
requires "sauer >= 1.0.0"
```


## Usage

1. Generate a new Nim project with `nimble init`.
2. In the project directory, run `sauer init`.
3. Build the app by running `nimble make` or `sauer make`.
4. See the app in action by running `nimble serve` or `sauer serve` and opening `http://localhost:1337/app.html#/"` in your browser.
5. To add a new page, run `sauer page new mynewpage --route="#/my/new/location/"` and rebuild the app. You should now see your page on `http://localhost:1337/app.html#/my/new/location/`.
6. To add a page with URL params, use placeholders: `sauer page new cat --route="#/cats/{catName}/"`

