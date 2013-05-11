Taglib Bindings for Racket
==========================

This package contains a set of Racket bindings for the
[Taglib](http://developer.kde.org/~wheeler/taglib.html) library for
reading metadata for popular audio formats. The bindings are for the C
library, which only supports the limited abstract API of Taglib.

Requires the taglibc library.

This package has been tested on Debian GNU/Linux. If you have taglibc
installed and this FFI binding cannot find it, please e-mail me about
your setup so that I can improve the library.

```racket
 (require taglib)
```

```racket
(struct tag (title artist album comment genre year track)
        #:extra-constructor-name make-tag)
  title : string?
  artist : string?
  album : string?
  comment : string?
  genre : string?
  year : exact-nonnegative-integer?
  track : exact-nonnegative-integer?
```

Represents the Tag class in taglib. Contains common metadata.

```racket
(struct audio-properties (length bitrate samplerate channels)
        #:extra-constructor-name make-audio-properties)
  length : exact-nonnegative-integer?
  bitrate : exact-nonnegative-integer?
  samplerate : exact-nonnegative-integer?
  channels : exact-nonnegative-integer?
```

Represents the AudioProperties class in taglib. Contains audio
properties.

```racket
(get-metadata path)
 -> (option/c (list/c tag/c audio-properties/c))
  path : path-string?
```

Extracts the metadata and audio properties of the audio file at the
given path. If unsuccessful, the function returns `#f`.


