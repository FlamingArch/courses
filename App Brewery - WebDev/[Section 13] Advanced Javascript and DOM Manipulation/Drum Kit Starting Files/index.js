function playAudio(key) {
  let audio = new Audio();
  switch (key) {
    case "w":
      audio.src = "./sounds/tom-1.mp3";
      audio.play();
      break;
    case "a":
      audio.src = "./sounds/tom-2.mp3";
      audio.play();
      break;
    case "s":
      audio.src = "./sounds/tom-3.mp3";
      audio.play();
      break;
    case "d":
      audio.src = "./sounds/tom-4.mp3";
      audio.play();
      break;
    case "j":
      audio.src = "./sounds/snare.mp3";
      audio.play();
      break;
    case "k":
      audio.src = "./sounds/crash.mp3";
      audio.play();
      break;
    case "l":
      audio.src = "./sounds/kick-bass.mp3";
      audio.play();
      break;
  }
}

document.querySelectorAll(".drum").forEach((element) => {
  element.addEventListener("click", function () {
    const buttonContent = element.innerHTML;
    playAudio(buttonContent);
    buttonAnimation(buttonContent);
  });
});

addEventListener("keydown", function (e) {
  playAudio(e.key);
  buttonAnimation(buttonContent);
});

function buttonAnimation(key) {
  document.querySelector(`.${key}`).classList.add("pressed");
  setTimeout(() => {
    document.querySelector(`.${key}`).classList.remove("pressed");
  }, 200);
}
