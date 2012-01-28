#lang scribble/manual

@(require planet/scribble)
@(require (for-label racket/base)
          (for-label unstable/contract)
          (for-label "../taglib.rkt"))

@title{Taglib Bindings for Racket}
@author[(author+email "Asumu Takikawa" "asumu@racket-lang.org")]

This package contains a set of Racket bindings for the Taglib library for
reading and writing metadata for popular audio formats. The bindings are for
the C library, which only supports the limited abstract API of Taglib.

Requires the taglibc library in order to function.

@defmodule[(planet asumu/taglib)]

@defstruct[tag ([title string?]
                [artist string?]
                [album string?]
                [comment string?]
                [genre string?]
                [year exact-nonnegative-integer?]
                [track exact-nonnegative-integer?])]{

Represents the Tag class in taglib. Contains common metadata.
}

@defstruct[audioproperties ([length exact-nonnegative-integer?]
                            [bitrate exact-nonnegative-integer?]
                            [samplerate exact-nonnegative-integer?]
                            [channels exact-nonnegative-integer?])]{

Represents the AudioProperties class in taglib. Contains audio properties.
}

@defproc[(get-metadata [path path-string?])
         (option/c (list/c tag/c audio-properties/c))]{
  Extracts the metadata and audio properties of the audio file at the given
  path. If unsuccessful, the function returns @racket[#f].
}
