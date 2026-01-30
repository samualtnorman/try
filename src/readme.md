<%
if (!process.env.FULL_ERROR) {
	process.on(`uncaughtException`, error => {
		console.error(error.message)
		process.exit(1)
	})
}

const { readFileSync } = await import("fs")
const { expectTruthy } = await import(`@sn/assert`)
const { TARGET, JSR_NAME } = process.env
const packageJson = JSON.parse(readFileSync("./package.json", { encoding: "utf8" }))
const PackageName = TARGET == `jsr` ? expectTruthy(JSR_NAME, `Missing JSR_NAME`) : packageJson.name
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
