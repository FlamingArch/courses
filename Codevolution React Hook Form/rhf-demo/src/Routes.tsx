import "./App.css";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import YouTubeForm from "./components/YouTubeForm";
import YupYouTubeForm from "./components/YupYouTubeForm";
import ZodYouTubeForm from "./components/ZodYouTubeForm";
import MUILoginForm from "./components/MUILoginForm";

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<YouTubeForm />} />
          <Route path="/yup" element={<YupYouTubeForm />} />
          <Route path="/zod" element={<ZodYouTubeForm />} />
          <Route path="/mui" element={<MUILoginForm />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
