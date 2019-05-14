# Installation

Run `pod install` to fetch the latests libraries. If it doesn't work try to delete `themoviedb.xcworkspace` and run `pod install` again.

# Architecture brief

According to the task a simple and clean architectural solution was chosen. Application module consists of `Presenter` responsible for module business login, `View->ViewController` responsible only for presentation, `ViewModel` responsible for data and actions handlins, `Router` (for some module) to easily navigate to another screen. Each module use dependency services for easily accessing common services of the application and for easily replacing them with mocked services. Communication between `Presenter` and `View->ViewController` layers happens by `ViewHandler`. It's a super light and easy to read structure with closures which are accessible from view layers (instead of typical protocol conformance which needs a lot of code and makes readability and tests implementing a bit harder).

# What to improve

 1. Add `TestStorageService` and `TestNetworkService` which conform to base protocols (`StorageService`, `NetworkService`) for implementing tests.
 2. Create general lightweight `TableViewController` which takes `ViewModel` as parameter and draw table view as `childViewController` in some container  to avoid spreading the same `UITableView` dependencies.
 3. Implement tests for existing presenters (is not finished due to the lack of time, examples available [here](https://github.com/D3VN23/home24/blob/master/Home24TestTests/ArticleSelectionPresenterTests.swift) or on request).
 4. Make `Router` as initialiser of module when more layers come instead of initialiing controller with direct presenter passing.
 5. Add errors handlers.
