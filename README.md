# stash_codingchallenge

Hello, this is my implementation of Achievements List. I followed the pattern given in the [Mindorks blog](https://blog.mindorks.com/building-ios-app-with-viper-architecture-8109acc72227). I would like to note that since this was only one screen example, there was no need to implement any router functionality but I do appreciate that Routing is responsible for navigation across the app.

I also added RxSwift between the layer of Presenter and View just to see if it also makes sense to mix-in reactive programming elements with VIPER. Obviously, using Rx is purely optional and one can always use the "delegate" pattern to communicate between different layers.

You will notice that I added a DependencyFactory to provide dependencies and inject them into each component. I would like to note that there are several dependency injection frameworks out there for Swift. Dependency injection is an optional pattern to follow. Instead of using a 3rd party tool, I just manually created a Dependency Provider using the Factory pattern. However, over the years, I have found out that using dependency injection of some kind encourages modular programming and it looks like it might go well together with VIPER since it also encourages similar programming patterns.

I provided a few test cases to demonstrate how one can write unit tests in this demo project.

I tried to keep it simple and straightforward. Hopefully it all makes sense.

Thanks for reviewing the code challenge!

### Requirements to run
XCode 12.3
Cocoapods 1.10 (earlier versions might also work)
iOS 14 emulator
