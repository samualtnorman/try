export const tryCatch: {
	<T>(executor: () => T): T | undefined
	<TExecutorReturn, TOnErrorReturn>(
		executor: () => TExecutorReturn,
		onError: (error: unknown) => TOnErrorReturn
	): TExecutorReturn | TOnErrorReturn
} = (executor: () => unknown, onError?: (error: any) => unknown) => {
	try {
		return executor()
	} catch (error) {
		return onError?.(error)
	}
}
