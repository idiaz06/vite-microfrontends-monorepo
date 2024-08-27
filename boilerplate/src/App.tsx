import Button from "remoteApp/Button";
const App = () => {
  console.log("🚀 ~ Button:", Button);
  return (
    <div>
      <h1>App MAIN</h1>
      {!!Button && <Button />}
    </div>
  );
};

export default App;
