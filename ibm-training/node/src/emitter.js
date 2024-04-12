import { EventEmitter } from "events";
import { readFile } from "fs";

class FileSearch extends EventEmitter {
  constructor(pattern) {
    super();
    this.pattern = pattern;
    this.files = [];
  }

  addFile(file) {
    this.files.push(file);
    return this;
  }

  search() {
    this.files.forEach((file) => {
      this.emit("start");
      readFile(file, "utf-8", (err, data) => {
        if (err) return this.emit("error", err);
        this.emit("fileRead", file);
        const match = data.match(this.pattern);
        if (match) match.forEach((elem) => this.emit("found", file, elem));
      });
    });
    return this;
  }
}

export default FileSearch;
