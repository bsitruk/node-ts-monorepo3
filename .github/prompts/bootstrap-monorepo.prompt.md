---
mode: "agent"
---

# Instructions

- Do not create a new root folder. Use the current folder.

# Task

- Scaffold a pnpm Typescript monorepo. It should contain a shared-lib and a simple node.js app using the shared lib.
- Use node 22.
- Run typescript natively using the --experimental-transform-types flag. It means there's shouldn't be any need to transpile the code to JavaScript or any "build" script.
- Use the recommended tsconfig.json configuration to run the app:

```json
{
  "compilerOptions": {
    "noEmit": true, // Optional - see note below
    "target": "esnext",
    "module": "nodenext",
    "rewriteRelativeImportExtensions": true,
    "erasableSyntaxOnly": true,
    "verbatimModuleSyntax": true
  }
}
```

- Use pnpm workspaces.
- Use the latest version of typescript.
- Create the script to run the project in dev mode.
- Create the required scripts to run the app in production, and the Dockerfile.
- Keep it simple.
