module {
  "name": "colors",
  "description": "jq module to colorize output",
  "homepage": "https://github.com/pschmitt/colors.jq",
  "license": "GPL3",
  "author": "Philipp Schmitt",
  "repository": {
    "type": "git",
    "url": "https://github.com/pschmitt/colors.jq"
  }
};

# Helper
def esc(seq): "\u001b[" + seq + "m";

# Color and style definitions
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
def reset:
{
  "all":           esc("0"), # alias
  "reset":         esc("0"),
  "bold":          esc("21"),
  "dim":           esc("22"),
  "underline":     esc("24"),
  "blink":         esc("25"),
  "reverse":       esc("27"),
  "hidden":        esc("28"),
  "strikethrough": esc("29")
};

def color:
{
  "black":        esc("30"),
  "red":          esc("31"),
  "green":        esc("32"),
  "yellow":       esc("33"),
  "blue":         esc("34"),
  "magenta":      esc("35"),
  "cyan":         esc("36"),
  "lightgray":    esc("37"),
  "default":      esc("39"),
  "darkgray":     esc("90"),
  "lightred":     esc("91"),
  "lightgreen":   esc("92"),
  "lightyellow":  esc("93"),
  "lightblue":    esc("94"),
  "lightmagenta": esc("95"),
  "lightcyan":    esc("96"),
  "white":        esc("97"),
};

def bgcolor:
{
  "black":        esc("40"),
  "red":          esc("41"),
  "green":        esc("42"),
  "yellow":       esc("43"),
  "blue":         esc("44"),
  "magenta":      esc("45"),
  "cyan":         esc("46"),
  "lightgray":    esc("47"),
  "darkgray":     esc("100"),
  "lightred":     esc("101"),
  "lightgreen":   esc("102"),
  "lightyellow":  esc("103"),
  "lightblue":    esc("104"),
  "lightmagenta": esc("105"),
  "lightcyan":    esc("106"),
  "white":        esc("107"),
};

def style:
{
  "reset":         esc("0"), # alias
  "bold":          esc("1"),
  "dim":           esc("2"),
  "italic":        esc("3"),
  "underline":     esc("4"),
  "blink":         esc("5"),
  "reverse":       esc("7"),
  "hidden":        esc("8"),
  "strikethrough": esc("9")
};

# Helper
def colorize(s): (s | tostring) + reset.all;

# Actual functions
# Colors
def black(s):        colorize(color.black        + s);
def red(s):          colorize(color.red          + s);
def green(s):        colorize(color.green        + s);
def yellow(s):       colorize(color.yellow       + s);
def blue(s):         colorize(color.blue         + s);
def magenta(s):      colorize(color.magenta      + s);
def cyan(s):         colorize(color.cyan         + s);
def lightgray(s):    colorize(color.lightgray    + s);
def darkgray(s):     colorize(color.darkgray     + s);
def lightred(s):     colorize(color.lightred     + s);
def lightgreen(s):   colorize(color.lightgreen   + s);
def lightyellow(s):  colorize(color.lightyellow  + s);
def lightblue(s):    colorize(color.lightblue    + s);
def lightmagenta(s): colorize(color.lightmagenta + s);
def lightcyan(s):    colorize(color.lightcyan    + s);
def white(s):        colorize(color.white        + s);

# BG Colors
def bgblack(s):        colorize(bgcolor.black        + s);
def bgred(s):          colorize(bgcolor.red          + s);
def bggreen(s):        colorize(bgcolor.green        + s);
def bgyellow(s):       colorize(bgcolor.yellow       + s);
def bgblue(s):         colorize(bgcolor.blue         + s);
def bgmagenta(s):      colorize(bgcolor.magenta      + s);
def bgcyan(s):         colorize(bgcolor.cyan         + s);
def bglightgray(s):    colorize(bgcolor.lightgray    + s);
def bgdarkgray(s):     colorize(bgcolor.darkgray     + s);
def bglightred(s):     colorize(bgcolor.lightred     + s);
def bglightgreen(s):   colorize(bgcolor.lightgreen   + s);
def bglightyellow(s):  colorize(bgcolor.lightyellow  + s);
def bglightblue(s):    colorize(bgcolor.lightblue    + s);
def bglightmagenta(s): colorize(bgcolor.lightmagenta + s);
def bglightcyan(s):    colorize(bgcolor.lightcyan    + s);
def bgwhite(s):        colorize(bgcolor.white        + s);

# Styles
def reset(s):         colorize(reset.all           + s);
def bold(s):          colorize(style.bold          + s);
def dim(s):           colorize(style.dim           + s);
def italic(s):        colorize(style.italic        + s);
def underline(s):     colorize(style.underline     + s);
def blink(s):         colorize(style.blink         + s);
def reverse(s):       colorize(style.reverse       + s);
def hidden(s):        colorize(style.hidden        + s);
def strikethrough(s): colorize(style.strikethrough + s);

# Styles + colors
def styled_color(style_code; color_code; s):
  colorize(style_code + color_code + s);

def bold_color(color_code; s):
  styled_color(style.bold; color_code; s);

def bold_red(s):     bold_color(color.red    ; s);
def bold_blue(s):    bold_color(color.blue   ; s);
def bold_green(s):   bold_color(color.green  ; s);
def bold_yellow(s):  bold_color(color.yellow ; s);
def bold_magenta(s): bold_color(color.magenta; s);
def bold_cyan(s):    bold_color(color.cyan   ; s);
def bold_white(s):   bold_color(color.white  ; s);
def bold_black(s):   bold_color(color.black  ; s);
