# bitter

> Making the world a bitter place.

Complete iOS feature set:

- pretty intro
    + either a simple page view controller with pictures
    + or a really nice RazzleDazzle intro, time permitting
    + also use the intro to enable camera/location permissions
- log in with Facebook & Twitter, saved to the db
    + auto-suggest people to follow based on Twitter mutual followers and Facebook friends that also use the app
    + can add email/password later, but fuck that
- Main map view
    + upvote button to upboat your current location
    + press and hold to bring up the camera, release to take a picture
        * alternatively tap to bring up camera, tap to take picture
    + upload picture to s3, send s3 url to database along with upvote
    + Realm-powered live map updating with nearby bitters
        * filter by `All`, `Friends`, and `Mine`
- Profile View
    + either the picture from my last bitter or a map of my recent bitters at the top
    + link to my personal bitters (list view, detail view is a map w/info/photo)
    + link to my liked bitters
- Discoverability view (list) is necessary
    + We want "bitters around you" but also perhaps a
    + "Popular bitters from around the world" with surfaced content and pictures
        * kinda like worldview lmao
    + instagram-inspired with large photos/maps, doubletap to like them
- Material Design Icons, floating upvote button for that modern aesthetic


Random Notes for the Future:

- our refresh slider should _definitely_ be a stretching bitter logo mmmmm
- actually implement the MGLMapboxMetricsEnabled option in the app
- put all of the map attribution information in the settings of the app
- before open sourcing the app, remove my MapBox key from info.plist