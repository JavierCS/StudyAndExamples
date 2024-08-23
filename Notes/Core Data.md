# Core Data

Core Data is an Apple framework used on iOS, macOS, watchOS, and tvOS platforms for managing data storage in applications. It is a fundamental part of the MVC (Model-View-Controller) architecture and is used to manage the data model in applications. 

## Key Features

1. **Data Persistence**:
   - Core Data allows applications to persist data in SQLite databases, XML files, binary files, or in-memory stores.

2. **Data Model**:
   - It uses an object model to manage data instead of direct SQL operations.
   - The data model is defined through a data model file (`.xcdatamodeld`) that describes entities, attributes, and relationships.

3. **Object Management**:
   - Provides a managed object context (`NSManagedObjectContext`) to handle and track changes in data.
   - Data is manipulated using instances of `NSManagedObject`, which represent entities from the data model.

4. **Queries and Filtering**:
   - Offers the ability to perform data queries and filtering using `NSFetchRequest` and `NSPredicate`.

5. **Change Management**:
   - Core Data automatically tracks and manages changes to managed objects.
   - Supports save, undo, and redo operations.

6. **Data Migration**:
   - Facilitates the migration of data schemas when there are changes in the data model.
   - Supports both lightweight and custom migrations.

7. **Optimization and Performance**:
   - Includes optimization techniques such as lazy loading and caching.
   - Provides control over memory usage and query performance.

8. **iCloud Integration**:
   - Enables data synchronization across devices using iCloud.

## Basic Usage

1. **Configure the Data Model**:
   - Create a data model file in Xcode.
   - Define entities, attributes, and relationships.

2. **Configure the Core Data Stack**:
   - Set up the `NSPersistentContainer`, which encapsulates the **Core Data Stack**, including the `NSManagedObjectContext`, `NSPersistentStoreCoordinator`, and the `NSManagedObjectModel`.

3. **Create and Manage Objects**:
   - Create instances of `NSManagedObject` to represent data.
   - Save and retrieve data using the managed object context.

4. **Perform Queries**:
   - Use `NSFetchRequest` to fetch data from the database.
   - Filter and sort results using `NSPredicate` and `NSSortDescriptor`.

Core Data is a powerful tool for data management in Apple applications, providing a structured and efficient way to handle data persistence and modeling.

## The Core data stack

1. `NSPersistantContainer`: Class that simplifies the **Core Data Stack** management providing an unified and high-level for managing the Core Data core components:

   	- `NSManagedObjectContext`

   	- `NSManagedObjectModel`

   	- `NSPersistentStoreCoordinator`

2. `NSManagedObjectContext`: Class that act as stratchpad or workspace for interactig with managed objects witch represent records in your **Core Data Model**. The context is responsible for:
   1. Objects lifecycle: Create, Fetch and Delete
   2. Change tracking: Observing changes and Undo / Redo changes
   3. Saving Changes: Persisting changes pushing the changes to the persistence store or Propagating changes through hierarchy of contexts allowing staged saving and concurrency management.
   4. Concurrency Management: Handles concurrency with two main types of contexts:
      1. Main Queue Context: Used for UI operations.
      2. Background Context: Used for non-UI operations like data imports, exports or batch updates.
3. `NSManagedObjectModel`: Represents the schema or blueprint of your **Core Data Model** describing the structure of the managed objects (entities) and their relationships, attributes and properties. In the **Core Data Stack** the `NSManagedObjectModel` is responsible of:
   1. Schema Definition: Define Entities, Attributes and Relationships.
   2. Model Loading: Define the Model Initialization, Model Versioning and Migration.
   3. Validations: Define Constraints and Validation Rules on attributes and relationships to ensure data integrity.
4. `NSPersistentStoreCoordinator`: It's a component that manages the reading and writing of data to the persistent store and ensure the data consistency and integrity.

