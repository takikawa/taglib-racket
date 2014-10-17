#lang scribble/manual

@(require (for-label racket/base
                     racket/contract
                     taglib))

@title{Taglib Bindings for Racket}
@author[(author+email "Asumu Takikawa" "asumu@racket-lang.org")]

This package contains a set of Racket bindings for the
@hyperlink["http://developer.kde.org/~wheeler/taglib.html"]{Taglib} library for
reading metadata for popular audio formats. The bindings are for the C library,
which only supports the limited abstract API of Taglib.

Requires the taglibc library.

This package has been tested on Debian GNU/Linux. If
you have taglibc installed and this FFI binding cannot find it, please
e-mail me about your setup so that I can improve the library.

@defmodule[taglib]

@defstruct[tag ([title string?]
                [artist string?]
                [album string?]
                [comment string?]
                [genre string?]
                [year exact-nonnegative-integer?]
                [track exact-nonnegative-integer?])]{

Represents the Tag class in taglib. Contains common metadata.
}

@defstruct[audio-properties ([length exact-nonnegative-integer?]
                             [bitrate exact-nonnegative-integer?]
                             [samplerate exact-nonnegative-integer?]
                             [channels exact-nonnegative-integer?])]{

Represents the AudioProperties class in taglib. Contains audio properties.
}

@defproc[(get-metadata [path path-string?])
         (or/c (list/c tag? audio-properties?) #f)]{
  Extracts the metadata and audio properties of the audio file at the given
  path. If unsuccessful, the function returns @racket[#f].
}
