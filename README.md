# AutoSrollingTab :computer:

AutoScrollingTabs is and application in which realised the feature of auto scrolling sections when user selecting tab. Or tab item movement when user scrolls the list.

## Features :rocket:

- You can scroll the list and see the changes in of list names at the top
- You can tap on the list name at the top
- By tapping on the list name the list is automatically scrolled to the items which are responsible for this name

> The goal of this application is 
> to make dynamic and interesting scrollView which is at the same time very easy to use

## Preview :eyes:

https://user-images.githubusercontent.com/72884798/224055750-66825aa1-ffe9-41ee-b26e-b3138408102b.mp4

## Tech :books:
- ScrollViewReader: This is a SwiftUI view that enables scrolling to a specific position within a scroll view. In this code, the ScrollViewReader is used 
- The extension on [ModelData] adds a computed property type to the array of ModelData instances. The type property returns the type of the first product in the array, or .horses if the array is empty.
- The OffsetKey struct conforms to the PreferenceKey protocol and defines a default value of .zero. It also provides a static reduce method that updates the key's value based on a new value.
- The extension on View adds a method offset that takes a coordinate space and a completion closure. It returns a modified version of the view that overlays a GeometryReader with a clear color. The GeometryReader captures the size and position of the view in the specified coordinate space and updates the OffsetKey preference. The completion closure is called whenever the preference value changes.
- The second extension on View adds a method checkAnimationEnd that takes a VectorArithmetic value and a completion closure. It returns a modified version of the view that uses the AnimationEndCallback modifier. The AnimationEndCallback struct conforms to Animatable and ViewModifier protocols, and its animatableData property tracks the value of the VectorArithmetic. The checkIfFinished() method is called whenever the animatableData property changes, and it compares it with the endValue. If the values match, the completion closure is called on the main thread.

>The OffsetKey preference key and GeometryReader combo allow tracking the position of views in different coordinate spaces, while the AnimationEndCallback allows detecting when a specific animation has ended.

## Installation :cd:

To install the project you need the latest version of Xcode and a real device. The application uses a camera module, it won't work in the simulator or preview.

## How to run and use :page_facing_up:
To run the application you need the latest verison of Xcode and the simulator or realDevice which is supports iOS 16. To run the application symply download or clone the project and click run button in the Xcode. Now you are able to scroll the list, tap whenewer you want and see how the application behave. 

## Requirements :bee:
- iOS 16
- Xcode 14.2
