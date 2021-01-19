# stash_codingchallenge

Hello, 

* This is my implementation of the Achievements List. I followed the pattern given in the [Mindorks blog](https://blog.mindorks.com/building-ios-app-with-viper-architecture-8109acc72227). You will notice that it is not 100% identical as I drew inspiration from this example but very similar.

* I also added RxSwift between Presenter and View layers. Perhaps you are also using Combine or RxSwift to drive the UI. Obviously, using Rx is purely optional and one can always use the vanilla delegate pattern to communicate between different layers.

* You will notice that I added a DependencyFactory to provide dependencies and inject them into each component. I would like to note that dependency injection is an optional pattern to follow. In the blog I followed, they were also creating and injecting the dependencies within the WireFrame layer as they were instantiating the View Controller. I separated this concern into a Dependency Provider using the Factory pattern.

* I provided a few test cases to demonstrate how one can write unit tests in this demo project.

* I tried to keep it simple and straightforward. Hopefully it all makes sense.

* Thanks for reviewing the code challenge!

### Requirements to run
 * XCode 12.3
* Cocoapods 1.10 (earlier versions might also work)
* iOS 14
