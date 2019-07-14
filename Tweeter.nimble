# Package

version       = "0.1.0"
author        = "kai"
description   = "A simple Twitter clone developed in Nim in Action"
license       = "MIT"
srcDir        = "src"
bin           = @["Tweeter"]
skipExt       = @["nim"]


# Dependencies

requires "nim >= 0.13.1"
requires "jester >= 0.0.1"