:warning: Yeah.. sorry, no TDD yet.. 

The thing is, mocking in crystal is far from being easy..
Mocks seem to be definitly doable but the current implementation being used just breaks existing static typings.. so.. Still needs a lot more research

I take all help I can get..

# Description

A simple CLI app that retrieves book information details from Google Books API.

Eventually the app will be able to filter results by:

* author name
* book title
* free form text that can match any book detail

(any combination of these factors allowed)

A session with the app can look like this:

```
$ ./books -a Tolkien
-------------------------------------------------------------
 Title:     J.R.R. Tolkien and His Literary Resonances
 Authors:   George Clark, Daniel Timmons
 Publisher: Greenwood Publishing Group
 ISBN:      9780313308451
-------------------------------------------------------------
 Title:     Tolkien and the Study of His Sources
 Authors:   Jason Fisher
 Publisher: McFarland
 ISBN:      9780786487288
```

# Dependencies

* Crystal Lang

# Building

* `crystal deps`
* `crystal build -o books src/app.cr`

From this point on, just use `./books` at will
