# Toyhash
An experiment in hashing data structures.

**NOTE**: **Toyhash** is not, and will never be, secure. This is an experiment.

## Importing
**Toyhash** exports a function.
```lua
Toyhash = require('toyhash')
```

## Usage
To hash a value, call `Toyhash`.  
`Toyhash(any) -> String[12]`
```lua
local Hash = Toyhash('hello world')
```

## Example
```lua
Toyhash = require('toyhash')
local Hash = Toyhash { 'hello', 'world' , {a = 1, b = 2} }
print(Hash)
```
