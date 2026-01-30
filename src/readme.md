<%
const { FULL_ERROR, TARGET, JSR_NAME } = process.env

if (!FULL_ERROR) {
	process.on("uncaughtException", error => {
		console.error(error.message)
		process.exit(1)
	})
}

const { readFileSync } = await import("fs")
const { assert } = await import("@sn/assert")
const packageJson = JSON.parse(readFileSync("./package.json", { encoding: "utf8" }))

assert(JSR_NAME, "Missing JSR_NAME")

const PackageName = TARGET == "jsr" ? JSR_NAME : packageJson.name
%>
# Try
Try it.

## Examples
### Read File Without Crashing if It Doesn’t Exist
```js
import { readFileSync } from "fs"
import { tryCatch } from "<%= PackageName %>"

const stringOrUndefined = tryCatch(() => readFileSync("./foo.txt", { encoding: "utf8" }))
```

### Fallback
```js
import { tryCatch } from "<%= PackageName %>"

const foo = tryCatch(() => callback(), error => 0)
```

---
<% if (TARGET == "git") { %>
This package is available on [JSR][jsr] and [NPM][npm].
<% } else if (TARGET == "jsr") { %>
This package is also [available on NPM][npm].
<% } else if (TARGET == "npm") { %>
This package is also [available on JSR][jsr].
<% } else throw Error("Invalid or missing TARGET.") %>

[npm]: https://www.npmjs.com/package/<%= packageJson.name %>

[jsr]: https://jsr.io/<%= JSR_NAME %>
