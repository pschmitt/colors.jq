# 🎨 colors.jq

This [jq](https://stedolan.github.io/jq/) module provides some low-level
functions for colorizing the output.

It is intended to be used in conjunction with jq's raw output mode, which does
not do any coloring on its own.

# 💠 Installation

Grab [./colors.jq](./colors.jq) and put it in jq's
[include path](https://stedolan.github.io/jq/manual/#Modules)

# 🔨 Usage

The following snippet assumes that you cloned this repository in the current
directory:

```shell
echo '{"test": "✅ this should be green, bold and blinking"}' | \
  jq -L "$PWD/colors.jq" -r '
    import "colors" as c;
    c::blink(c::bold(c::green(.test)))'
```

# 💫 Bonus: ZSH wrapper function

For your convenience here's a little shell (zsh only!) function that alleviates
the pain of importing the module at every run:

```shell
jqcolor () {
	local help
	zparseopts -D -E h=help -help=help

	if [[ -n "$help" ]]
	then
		jq --help
		return
	fi

	local filter="import \"colors\" as c; ${@[-1]}"

  # Remove last arg (ie the original filter)
	set -- ${@[1,-2]}
	jq -L "${XDG_CONFIG_HOME}/jq" $@ $filter
}
```

Once loaded you can:

```shell
echo '{"test": "make this red"}' | \
  jqcolor -r "c::red(.test)"
```
