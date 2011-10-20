#lang scribble/manual

@(require (for-label racket/base))
@(require (for-label "../taglib.rkt"))

@title{Taglib Bindings for Racket}

This package contains a set of Racket bindings for the Taglib library for
reading and writing metadata for popular audio formats. The bindings are for
the C library, which only supports the limited abstract API of Taglib.

Requires the taglibc library in order to function.

@defmodule[(planet asumu/taglib)]

@defproc[(get-tags [path path-string?]) (or/c tag? #f)]{
  Given a path, produces a tag struct containing the media tag data for the
  file at that path.
}
