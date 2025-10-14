import React from "react";
import LiveStream from "./components/LiveStream";

function App() {
  const webrtcOfferUrl = "http://localhost:8081/offer";

  return (
    <div
      style={{
        backgroundColor: "#111",
        color: "#fff",
        height: "100vh",
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <h1 style={{ marginBottom: "10px", fontFamily: "monospace" }}>
        Android Live Emulator
      </h1>
      <div
        style={{
          width: "400px",
          height: "700px",
          borderRadius: "20px",
          overflow: "hidden",
          boxShadow: "0 0 20px rgba(0,0,0,0.6)",
        }}
      >
        <LiveStream offerUrl={webrtcOfferUrl} />
      </div>
    </div>
  );
}

export default App;
