# Try
Try it.

## Examples
### Read File Without Crashing if It Doesn’t Exist
```js
import { readFileSync } from "fs"
import { tryCatch } from "@samual/try"

const stringOrUndefined = tryCatch(() => readFileSync("./foo.txt", { encoding: "utf8" }))
```

### Fallback
```js
import { tryCatch } from "@samual/try"

const foo = tryCatch(() => callback(), error => 0)
```
