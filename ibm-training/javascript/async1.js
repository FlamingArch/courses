const fetchData = () => {
  return new Promise((resolve, reject) => {
    fetch("https://jsonplaceholder.typicode.com/users")
      .then((data) =>
        data
          .json()
          .then((json) => resolve(json))
          .catch((err) => reject(`Error Decoding JSON: ${err}`))
      )
      .catch((err) => reject(err));
  });
};

const getNames = (data) => data.map((e) => e.name);
const intoCommaSeparated = (data) => data.reduce((a, i) => `${a}, ${i}`);

fetchData().then((data) => console.log(intoCommaSeparated(getNames(data))));
