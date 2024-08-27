export default {
	'*.{ts,tsx,js,jsx}': ['prettier --write', 'eslint --fix'],
	'**/*.ts?(x)': () => 'tsc -p tsconfig.json --noEmit'
}
