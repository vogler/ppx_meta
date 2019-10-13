# ppx_reflect
OCaml ppx extension for reflection/introspection.
Others:
- https://github.com/janestreet/typerep

## identifiers
Name of identifier as string:

~~~ocaml
let%id foo = declare Int
~~~

~~~ocaml
let foo = declare Int "foo"
~~~

Github uses lang-attribute for syntax-highlighting
| ppx | output |
|-----|--------|
|<pre lang="ocaml">foo [@bla]</pre>| `foo bla`|
