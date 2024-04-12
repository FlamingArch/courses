import { createReadStream, createWriteStream } from "fs";
import { createGzip } from "zlib";

createReadStream("data/a.txt")
  .pipe(createGzip())
  .pipe(createWriteStream("a.gz"))
  .on("finish", () => console.log("✅ File Compressed"));
