module.exports = {
  '*.{graphql,json,md,yml}': ['prettier-eslint --list-different --write', 'git add -f'],
  '*.{js,jsx,mjs,ts,tsx}': ['eslint --fix --quiet', 'git add -f'],
  //   "*.{js,ts}": [
  //     "yarn test --bail --collectCoverage=false --passWithNoTests --findRelatedTests"
  //   ],
  //   "*.{ts,tsx}": [
  //     () => "tsc --pretty --noEmit"
  //   ]
};
