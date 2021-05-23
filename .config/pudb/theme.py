palette.update({
    "header": (add_setting("black", "bold"), "light blue", "standout"),
    "variables": ("h15", "default"),

    "background": ("black", "dark magenta"),
    "label": ("black", "light blue"),
    "group head": (add_setting("dark red", "bold"), "light gray"),
    "hotkey": (add_setting("black", "underline"), "light magenta", "underline"),
    "focused sidebar": (add_setting("black", "bold"), "light blue", "standout"),

    # {{{ variables view
    "var label": (add_setting("h14", "bold"), "default"),
    "var value": ("h15", "default"),
    "focused var label": (add_setting("black", "bold"), "brown"),
    "focused var value": ("black", "brown"),
    # }}}

    "stack": ("dark red", "default"),

    "frame name": ("white", "default"),
    "frame class": ("dark blue", "default"),
    "frame location": ("light cyan", "default"),

    "current frame name": (add_setting("white", "bold"), "default"),
    "current frame class": ("dark blue", "default"),
    "current frame location": ("light cyan", "default"),

    "focused frame name": ("black", "light blue"),
    "focused frame class": (add_setting("white", "bold"), "dark green"),
    "focused frame location": ("dark blue", "dark green"),

    "focused current frame name": ("black", "light blue"),
    "focused current frame class": (
        add_setting("white", "bold"), "dark green"),
    "focused current frame location": ("dark blue", "dark green"),

    "search box": ("default", "default"),

    "source": ("h15", "default"),
    "highlighted source": ("white", "light cyan"),
    "current source": (add_setting("light magenta", "bold"), "h16"),
    "current focused source": (add_setting("black", "bold"), "brown"),

    "line number": ("light gray", "default"),
    "keyword": (add_setting("h12", "bold"), "default"),
    "name": ("h14", "default"),
    "literal": ("h3", "default"),
    "string": ("dark red", "default"),
    "doublestring": ("dark red", "default"),
    "singlestring": ("h3", "default"),
    "docstring": ("light red", "default"),
    "backtick": ("light green", "default"),
    "punctuation": ("white", "default"),
    "comment": ("dark green", "default"),
    "classname": ("dark cyan", "default"),
    "funcname": ("light cyan", "default"),

    # {{{ breakpoint

    "breakpoint": ("white", "default"),
    "disabled breakpoint": ("dark gray", "default"),
    "focused breakpoint": ("black", "dark green"),
    "focused disabled breakpoint": ("dark gray", "dark green"),
    "current breakpoint": (add_setting("white", "bold"), "default"),
    "disabled current breakpoint": (
        add_setting("dark gray", "bold"), "default"),
    "focused current breakpoint": (
        add_setting("white", "bold"), "dark green", "bold"),
    "focused disabled current breakpoint": (
        add_setting("dark gray", "bold"), "dark green", "bold"),

    "breakpoint marker": ("light magenta", "default"),

    "breakpoint source": ("h9", "default"),
    "breakpoint focused source": (add_setting("black", "bold"), "light magenta"),
    "current breakpoint source": (add_setting("black", "bold"), "light red"),
    "current breakpoint focused source": (add_setting("black", "bold"), "light red"),
    # }}}

    # {{{ shell

    "command line edit": ("white", "default"),
    "command line prompt": (add_setting("white", "bold"), "default"),

    "command line output": (add_setting("white", "bold"), "default"),
    "command line input": (add_setting("white", "bold"), "default"),
    "command line error": (add_setting("light red", "bold"), "default"),

    "focused command line output": ("black", "dark green"),
    "focused command line input": (
            add_setting("white", "bold"), "dark green"),
    "focused command line error": ("black", "dark green"),

    "command line clear button": (add_setting("white", "bold"), "default"),
    "command line focused button": ("black", "light gray"),  # White
    # }}}

})

# vim: foldmethod=marker
