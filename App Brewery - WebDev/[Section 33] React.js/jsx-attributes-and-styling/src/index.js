import React from "react";
import ReactDOM from "react-dom";
import "./styles.css";

const img = "https://picsum.photos/200";

ReactDOM.render(
  <div>
    <h1 className="heading" contentEditable="true" spellCheck="false">
      My Favourite Foods
    </h1>
    <img src={img + "?grayscale"} alt="random" />
    <img
      className="food-img"
      src="https://unsplash.com/photos/QE_UTZZGDD8/download?force=true&w=640"
      alt="bacon"
    />
    <img
      className="food-img"
      src="https://unsplash.com/photos/jiYKRs83pKs/download?force=true&w=640"
      alt="jamon"
    />
    <img
      className="food-img"
      src="https://unsplash.com/photos/wEBg_pYtynw/download?force=true&w=640"
      alt="noodles"
    />
  </div>,
  document.getElementById("root")
);
