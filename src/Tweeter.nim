import asyncdispatch, times

import jester

routes:
  get "/":
    resp "Hello World!"

runForever()