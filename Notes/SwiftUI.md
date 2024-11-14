# Swift UI



An app that uses the SwiftUI app life cycle has a structure that conforms to the `App` protocol where the structure's button returns one of more scenes.



## Commands

* `option + command + enter`: Show the Canvas.
* `command + control + click`: In the Selectable canvas mode to show the actions menu for your canvas items.
* `control + click`: Inside a UIElement declaration to show the SwiftUI Inspector



## Labels

**`@main`**: Identifies the app's entry point.



## Macros

**`#Preview`**: Creates a preview of a SwiftUI view.

``````swift
#Preview("Preview Name") {
	SomeView()
}

#Preview("Preview Two Name") {
	SomeView(state: .someState)
}

#Preview("Group") {
	Group {
		SomeView()
    SomeView(state: .someState)we
  }
}
``````



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
    OtherContentView()t
  }
  ``````

* `List`:

  ``````swift
  import SwiftUI
  import CoreLocation
  
  struct Landmark: Hashable, Codable, Identifiable {
      var id: Int
      var name: String
      var park: String
      var state: String
      var description: String
      
      private var imageName: String
      var image: Image {
          Image(imageName)
      }
      
      private var coordinates: Coordinates
      var locationCoordinate: CLLocationCoordinate2D {
          CLLocationCoordinate2D(
              latitude: coordinates.latitude,
              longitude: coordinates.longitude)
      }
      
      struct Coordinates: Hashable, Codable {
          var latitude: Double
          var longitude: Double
      }
  }
  
  struct LandmarkList: View {
      var body: some View {
          List(landmarks) { landmark in
              LandmarkRow(landmark: landmark)
          }
      }
  }
  ``````

* `NavigationSplitView`: A view that presents views in two or three columns, where selections in leading columns control presentations in subsequent columns.

  ``````swift
  import SwiftUI
  
  struct LandmarkList: View {
      var body: some View {
          NavigationSplitView {
              List(landmarks) { landmark in
              	LandmarkRow(landmark: landmark)
              }
              .navigationTitle("Landmarks")
          } detail: {
              Text("Select a Landmark")
          }
      }
  }
  ``````

* `NavigationLink`: A view that controls a navigation presentation.

  ``````swift
  List(landmarks) { landmark in
  	NavigationLink {
  		LandmarkDetail(landmark: landmark)
  	} label: {
  		LandmarkRow(landmark: landmark)
  	}
  }
  ``````

  Text that you pass as the label for a navigation link renders using the environment’s accent color, and images may render as template images. You can modify either behavior to best suit your design using the `.renderingMode()` modifier for images and the `.foregroundStyle()` modifier for texts.

* `ScrollView`: A scrollable view. The scroll view displays its content within the scrollable content region. 

  ``````swift
  import SwiftUI
  
  struct LandmarkDetail: View {
      var landmark: Landmark
      
      var body: some View {
          ScrollView {
              MapView(coordinate: landmark.locationCoordinate)
                  .frame(height: 300)
              
              CircleImage(image: landmark.image)
                  .offset(y: -130)
                  .padding(.bottom, -130)
              
              VStack(alignment: .leading) {
                  Text(landmark.name)
                      .font(.title)
                  HStack {
                      Text(landmark.park)
                      Spacer()
                      Text(landmark.state)
                  }
                  .font(.subheadline)
                  .foregroundStyle(.secondary)
                  Divider()
                  Text("About \(landmark.name)")
                      .font(.title2)
                  Text(landmark.description)
              }
              .padding()
          }
          .navigationTitle(landmark.name)
          .navigationBarTitleDisplayMode(.inline)
      }
  }
  ``````


* `Path`: The outline of a 2D shape.

  ``````
  ``````

* `GeometryReader`: A container view that defines its content as a function of its own size and coordinate space.

  ``````swift
  GeometryReader { geometry in
  	badgeSymbols
  		.scaleEffect(1.0 / 4.0, anchor: .top)
  		.position(x: geometry.size.width / 2, y: (3.0 / 4.0) * geometry.size.height)
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

* `.navigationTitle()`: Configures the view’s title for purposes of navigation, using a string.

  ``````swift
  SomeView()
  	.navigationTitle("SomeNavigationBarTitleForThisView")
  ``````

  

* `.navigationBarTitleDisplayMode()`: Configures the title display mode for this view.

  ``````swift
  SomeView()
  	.navigationBarTitleDisplayMode(.inline)
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

* `.fill()`: Turn the shape into a view.

  

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



### Image Modifiers

* `.resizable()`: Sets the mode by which SwiftUI resizes an image to fit its space.

  ``````swift
  Image("someImageName")
  	.resizable()
  ``````

  

## MapKit

``````swift
import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span:  MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView()
}

``````

