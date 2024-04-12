import FileSearch from "./emitter.js";

const fileSearch = new FileSearch(/a/g);

fileSearch
  .addFile("./data/a.txt")
  .addFile("./data/b.txt")
  .addFile("./data/c.txt");

fileSearch
  .on("start", () => console.log("🎬 Started."))
  .on("fileRead", (data) => console.log("🕵️‍♀️ Reading: ", data))
  .on("found", (data, result) => console.log("🟢 Found: ", data, result));

fileSearch.search();
