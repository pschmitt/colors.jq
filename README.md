# 🎨 colors.jq

This [jq](https://stedolan.github.io/jq/) module provides some low-level 
functions for colorizing the output.

It is intended to be used in conjunction with jq's raw output mode, which does 
not do any coloring on its own.

# Installation

Grab [./colors.jq](./colors.jq) and put it in jq's 
[include path](https://stedolan.github.io/jq/manual/#Modules)

# Usage

The following snippet assumes that you cloned this repository in the current 
directory:

```shell
echo '{"test": "✅ this should be green, bold and blinking"}' | \
  jq -L "$PWD/colors.jq" -r '
    import "colors" as c;
    c::blink(c::bold(c::green(.test)))'
```
