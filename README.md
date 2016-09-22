![](https://img.shields.io/badge/build-pass-brightgreen.svg?style=flat-square)
![](https://img.shields.io/badge/platform-WatchOS2-ff69b4.svg?style=flat-square)
![](https://img.shields.io/badge/Require-XCode%208-lightgrey.svg?style=flat-square)


# WatchOS2-NewUI-AlertController-Example
WatchOS 2 Experiments - New UI Components - Alert Controller Style

## Example

![](https://raw.githubusercontent.com/Sweefties/WatchOS2-NewUI-AlertController-Example/master/source/Apple_Watch_template-AlertController.jpg)

## Requirements

- >= XCode 7 beta 5~.
- >= Swift 2.

Tested on WatchOS2 Simulator.

## Important

this is the Xcode 8 / Swift 3 updated project.

## Usage

To run the example project, clone the repo.

### Extra Simple!


Configure your Storyboard :

  - Drag and drop Button to Interface Controller
  - connect your WKInterfaceButton `DefaultAlert` to your Interface Controller class
  - connect IBAction
  - put function code to controller class.

```swift
func showAlertWithStyle(style: WKAlertControllerStyle) {
        // init the Alert Actions
        let cancel = WKAlertAction(title: "Cancel title", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            print("cancel")
        })

        let action = WKAlertAction(title: "Action title", style: WKAlertActionStyle.Default, handler: { () -> Void in
            print("default action method..")
        })

        let destructive = WKAlertAction(title: "Destructive title", style: WKAlertActionStyle.Destructive, handler: { () -> Void in
            print("destructive")
        })
        // populate an array of actions
        var actions = NSArray()
        if style == WKAlertControllerStyle.SideBySideButtonsAlert {
            actions = [action, cancel]
        }else{
            actions = [action, cancel, destructive]
        }
        // presented Alert Controller
        self.presentAlertControllerWithTitle("Your title", message: "Your message", preferredStyle: style, actions: actions as! [WKAlertAction])
    }
```

  - Call the function by IBAction

```swift
// MARK: - IB Actions
    @IBAction func showAlert() {
        self.showAlertWithStyle(WKAlertControllerStyle.Alert)
    }
```


Build and Run!
