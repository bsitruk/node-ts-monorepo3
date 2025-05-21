import { greet, sum } from "@node-ts-monorepo/shared-lib";

console.log(greet("World"));
console.log(`The sum of 2 and 3 is ${sum(2, 3)}`);

console.log("App is running...");

// Keep the app running to simulate a server
setInterval(() => {
  console.log(`Current time: ${new Date().toISOString()}`);
}, 5000);
