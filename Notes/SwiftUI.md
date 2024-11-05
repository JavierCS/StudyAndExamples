# Swift UI



An app that uses the SwiftUI app life cycle has a structure that conforms to the `App` protocol where the structure's button returns one of more scenes.



## Commands

* `option + command + enter`: Show the Canvas.
* `command + control + click`: In the Selectable canvas mode to show the actions menu for your canvas items.
* `control + click`: Inside a UIElement declaration to show the SwiftUI Inspector



## Labels

**`@main`**: Identifies the app's entry point.



## Controls



* `VStack`: Stack's elements vertically.

  ``````swift
  // By default, stacks center their contents along their axis
  VStack(alignment: .leading) {
  	Text("Turtle Rock")
  		.font(.title)
  	Text("Joshua Tree National Park")
  }
  ``````

* `HStack`: Stack´s elements horizontally.

  ``````swift
  HStack {
  	Text("Joshua Tree National Park")
  		.font(.subheadline)
  	Text("California")
  		.font(.subheadline)
  }
  ``````

* `Spacer`: Expands to make its containig view use all of the space of its parent view.

  ``````swift
  HStack {
  	Text("Joshua Tree National Park")
  		.font(.subheadline)
  	Spacer()
  	Text("California")
  		.font(.subheadline)
  }
  ``````

* `Image`: Draw images.

  ``````swift
  Image("turtlerock")
  ``````

* `Divider`: A visual element that can be used to separate other content.

  ``````swift
  VStack {
    SomeContentView()
    Divider()
    OtherContentView()
  }
  ``````

  



## Modifiers

* `.padding()`: Adds an equal padding amount to specific edges of this view. You can give a view more space around their outer edges.

  ``````swift
  SomeView()
  	.padding()
  ``````

* `.clipShape()`: Clips the view into a shape.

  ``````swift
  Image("turtlerock")
  	.clipShape(Circle())
  ``````

* `.overlay()`: Layers the views that you specify in front of this view. 

  ``````swift
  Image("turtlerock")
  	.clipShape(Circle())
  	.overlay {
  		Circle()
  			.stroke(.gray, lineWidth: 4)
  	}
  ``````

* `.shadow()`: Adds a shadow to this view.

  ``````swift
  Image("turtlerock")
  	.clipShape(Circle())
  	.overlay {
  		Circle()
  			.stroke(.gray, lineWidth: 4)
  	}
  	.shadow(radius: 10)
  ``````

* `.frame()`: Positions this view within an invisible frame with the specified size.

  ``````swift
  MapView()
  	.frame(height: 300)
  ``````

* `.offset()`: Offset this view by the specified horizontal and vertical distances.

  ``````swift
  CircleImage()
  	.offset(y: -130)
  ``````

  

### Shape Modifiers

* `.stroke()`: Traces the outline of this shape with a color or gradient.

``````swift
Image("turtlerock")
	.clipShape(Circle())
	.overlay {
		Circle()
			.stroke(.gray, lineWidth: 4)
	}
``````

### Text Modifiers

* `.font()`: Changes the text's font.

  ``````swift
  Text("Hello, world!")
  	.font(.title)
  ``````

* `.foregroundColor()`: Changes the text´s color. This function will be deprecated, so you must use the `.foregroundStyle()` modifier.

  ``````swift
  // Using `.foregroundColor()`
  Text("Hello, world!")
  	.foregroundColor(.blue)
  
  // Using `.foregroundStyle()`
  Text("Hello, world!")
  	.foregroundStyle(.blue)
  ``````



## MapKit

