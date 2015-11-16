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
    + upvote button to upboat your current location (Picture REQUIRED) 
    + press and hold to bring up the camera, release to take a picture
        * alternatively tap to bring up camera, tap to take picture
        * Make sure cannot select pic from library
    + upload picture to s3, send s3 url to database along with upvote
    + Realm-powered live map updating with nearby bitters
        * filter by `All`, `Friends` or `Friend`, and `Mine`
    + All map functionality should live in one view 
    + Upboat other uboats
    + Implemant Decay Algo 
        * Example: Biter will decay win x days unless there is y action
    + Possible build:
        * Basic photo editor / text inserter (*can skip for first interation)
- Profile View
    + either the picture from my last bitter or a map of my recent bitters at the top (Solid feature) 
    + link to my personal bitters (list view, detail view is a map w/info/photo)
    + Follow a user
    + Private / Public user
    + link to my liked bitters
    + number of upboats
    + number of karam (other people's upboat) 
- Discoverability view (list) is necessary
    + We want "bitters around you" but also perhaps a
    + "Popular bitters from around the world" with surfaced content and pictures
        * kinda like worldview lmao
    + instagram-inspired with large photos/maps, doubletap to like them
        * Could potentialy be like titled instagram view
    + also should be able to filter by friends or global
    + 
- Material Design Icons, floating upvote button for that modern aesthetic


Random Notes for the Future:

- our refresh slider should _definitely_ be a stretching bitter logo mmmmm
    * Could be lemon going down on juicer
- actually implement the MGLMapboxMetricsEnabled option in the app
- put all of the map attribution information in the settings of the app
- before open sourcing the app, remove my MapBox key from info.plist
- Do we want to open source / should make sure we don't open source any auth tokens for back end
