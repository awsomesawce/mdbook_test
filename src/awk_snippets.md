# Awk snippets

This is a demonstration of how to display awesome documentation using `mdbook`.

## Snippet

This is an awk snippet for creating an html page with the argument specified.

```awk
BEGIN { print "<html>\n<head><title>Awk-generated HTML</title></head>\n<body bgcolor=\"#ffffff\">\n<pre>" }
{ print $0 }
END { print "</pre>\n</body>\n</html>" }
```

I used the `:read` command to read the file directly into the buffer!  It beats copy-pasting!
