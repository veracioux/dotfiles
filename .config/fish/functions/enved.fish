function enved --argument envvar
    set tmp (mktemp /tmp/envvar-XXXXXXXXX)
    bass echo \$"$envvar" > "$tmp"
    "$EDITOR" "$tmp"
    bass export "$envvar"=(cat "$tmp")
    /usr/bin/rm -f "$tmp"
end
