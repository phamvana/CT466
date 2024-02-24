import logo from "./logo.jpg";
import "./App.css";

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>NHƯ STUDIO</h1>
        <h2>Phường 2 - Thành phố Cà Mau</h2>
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
      <h1> Bài học đầu tiên về reactjs</h1>
    </div>
  );
}

export default App;
