# ic-data-repository-storage-manager

This is the layer that handles the storage. It's responsible for storing and
retrieving data. This is where we would implement different storage strategies
to handle data persistence.

Examples of this are:

- CanDB
- Raw Stable Memory
- Raw Heap Memory
- RXMoDB

This may just be eliminated all together or just a wrapper around CanDB.
