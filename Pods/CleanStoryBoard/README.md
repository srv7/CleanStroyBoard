# CleanStoryBoard

## What's this
`CleanStoryBoard` is very simple, it saves you from instantiating storyboards using string literals and you can leverage autocomplete feature to get storyboard instances. No scope for typos !

## Installation
`pod 'CleanStoryBoard'`

## Usage
1. define an enum, e.g. `Storyboards`  
    ```
    enum Storyboards: String {
            case Main
            case Home
            case Feed
            case Account
        }
    ```

2. extension the struct `Storyboard`,  add static properties, just like below: 
    ```
    extension Storyboard { 
        static let Main = Storyboard(rawValue: Storyboards.Main.rawValue)
        static let Home = Storyboard(rawValue: Storyboards.Home.rawValue) static let Feed = Storyboard(rawValue: Storyboards.Feed.rawValue)
        static let Account = Storyboard(rawValue: "Account") // not recommended
    }
    ```
    as you see, you can create a `Account` by user String literals `Account`, but it's not recommended, using the enum is high recommanded.

3. assign identifiers to ViewControllers in your storyBoards, just be same as Class Name, then you can initialize your ViewController as below:
    ```
    let n1 = HomeNavigationController.instance(from: Storyboard.Home)
    let n2 = FeedNavigationController.instance(from: .Feed)
    let n3 = AccountNavigationController.instance(from: .Account)
    ```

## License
CleanStoryBoard is released under an MIT license. See [License.md](https://github.com/srv7/CleanStroyBoard/blob/master/LICENSE) for more information.