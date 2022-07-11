let randomNumber1 = Math.round(Math.random() * 5) + 1;
let randomNumber2 = Math.round(Math.random() * 5) + 1;

// let img1 =
document
  .getElementsByClassName("img1")[0]
  .setAttribute("src", `./images/dice${randomNumber1}.png`);
document
  .getElementsByClassName("img2")[0]
  .setAttribute("src", `./images/dice${randomNumber2}.png`);

document.getElementsByTagName("h1")[0].innerHTML =
  randomNumber1 > randomNumber2
    ? `🚩 Player 1 wins!`
    : (randomNumber1 < randomNumber2 ?  `Player 2 wins! 🚩` : "Draw");
