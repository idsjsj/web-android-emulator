import express from "express";
import fetch from "node-fetch";
import cors from "cors";

const app = express();
app.use(cors());
app.use(express.text({ type: "application/sdp" }));

// Offer -> Android VM or WebRTC endpoint 중계
app.post("/offer", async (req, res) => {
  try {
    const response = await fetch("http://android-vm:8080/offer", {
      method: "POST",
      headers: { "Content-Type": "application/sdp" },
      body: req.body,
    });
    const answer = await response.text();
    res.type("application/sdp").send(answer);
  } catch (err) {
    console.error("Signaling error:", err);
    res.status(500).send("Failed to connect to Android VM");
  }
});

const PORT = process.env.PORT || 8081;
app.listen(PORT, () => console.log(`✅ Signaling server running on port ${PORT}`));
