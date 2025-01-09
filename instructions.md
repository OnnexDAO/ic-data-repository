# IC-DataRepository Core Instructions

## Schema Management

### Defining a Schema

A schema defines the structure of your data. Each schema consists of fields with
specific types and attributes.

```motoko
{
  name = "User";
  fields = [
    { name = "id"; type = #Text; key = true },
    { name = "email"; type = #Text; unique = true },
    { name = "name"; type = #Text; indexed = true }
  ];
}
```

### Field Types

Available field types:

- `#Text`: String values
- `#Number`: Numeric values
- `#Bool`: Boolean values
- `#Array`: List of values of a specific type
- `#Option`: Optional values
- `#Relationship`: References to other entities

### Field Attributes

Each field can have the following attributes:

- `key`: Primary identifier field (only one per schema)
- `unique`: Value must be unique across all records
- `indexed`: Field is indexed for faster querying
- `optional`: Field can be null/undefined
- `default`: Default value if none provided

## Data Store Operations

### Creating Records

```motoko
let newUser = {
  id = "user1";
  email = "user@example.com";
  name = "John Doe";
};

let result = await store.create("User", newUser);
```

### Reading Records

Single record by key:

```motoko
let user = store.findOne("User", { id = "user1" });
```

Multiple records with filtering:

```motoko
let users = store.findMany("User", {
  filter = ?{
    field = "name";
    op = #StartsWith;
    value = "John"
  }
});
```

### Updating Records

```motoko
let updates = {
  name = "John Smith"
};

let result = store.update("User", "user1", updates);
```

### Deleting Records

```motoko
let result = store.delete("User", "user1");
```

## Data Integrity

### Validation Rules

- All required fields must be present
- Field types must match schema definition
- Unique constraints are enforced
- Relationships must reference valid entities
- Custom validation rules can be defined

### Transaction Handling

All operations that modify data are atomic:

- Either complete successfully or fail entirely
- No partial updates
- Data consistency is maintained
- Concurrent access is handled safely

### Error Handling

Common error scenarios:

- Record not found
- Unique constraint violation
- Invalid field type
- Missing required field
- Validation failure
- Reference integrity violation

## Memory Management

### Stable Storage

Data is persisted in stable memory:

- Survives canister upgrades
- Automatically managed
- Optimized for IC architecture
- Handles large datasets efficiently

### Memory Optimization

- Indexes are stored separately
- Cached data uses temporary memory
- Large fields are stored efficiently
- Memory usage is monitored
- Automatic cleanup of unused data

## Build Integration

### Schema File

Create a `schema.mo` file in your project:

```motoko
module {
  public let schemas = [
    // Your schema definitions here
  ];
}
```

### Project Configuration

Add to your `dfx.json`:

```json
{
  "canisters": {
    "data_store": {
      "type": "motoko",
      "main": "path/to/your/schema.mo"
    }
  }
}
```

## Best Practices

1. Define clear schema structures
2. Use appropriate field types
3. Index frequently queried fields
4. Handle errors appropriately
5. Monitor memory usage
6. Maintain data integrity
7. Use transactions for related changes
8. Document schema changes

## Limitations

- Maximum field size: 2MB
- Maximum records per query: 10,000
- Maximum indexed fields per schema: 10
- Maximum relationships per record: 100
- Maximum schema size: 4MB
