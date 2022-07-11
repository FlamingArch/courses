import "./styles.css";

const date = new Date();
const currentTime = date.getHours();

let greeting = "";

const customStyle = {
  color: "red",
};

if (currentTime < 12) {
  greeting = "Good Morning";
  customStyle.color = "red";
} else if (currentTime < 18) {
  greeting = "Good Afternoon";
  customStyle.color = "green";
} else if (currentTime < 24) {
  greeting = "Good Night";
  customStyle.color = "blue";
}

function Heading() {
    return <h1 className="heading" style={customStyle}>
    {greeting}
  </h1>
}

export default Heading