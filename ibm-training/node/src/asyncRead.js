import fs from "fs/promises";

const readFile = async (fileName) => {
  return await fs.readFile(fileName, "utf-8");
};

const printEven = async () => {
  const data = await readFile("data");
  console.log(
    data
      .split("\n")
      .map(Number)
      .filter((i) => i % 2 == 0)
  );
};

printEven();
