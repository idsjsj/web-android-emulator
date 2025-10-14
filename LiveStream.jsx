import React, { useRef, useEffect } from "react";

export default function LiveStream({ offerUrl }) {
  const videoRef = useRef(null);

  useEffect(() => {
    const startStream = async () => {
      const pc = new RTCPeerConnection();
      const videoEl = videoRef.current;

      pc.ontrack = (event) => {
        videoEl.srcObject = event.streams[0];
      };

      const offer = await pc.createOffer();
      await pc.setLocalDescription(offer);

      const response = await fetch(offerUrl, {
        method: "POST",
        body: offer.sdp,
        headers: { "Content-Type": "application/sdp" },
      });
      const answer = await response.text();

      await pc.setRemoteDescription({
        type: "answer",
        sdp: answer,
      });
    };

    startStream();
  }, [offerUrl]);

  return (
    <video
      ref={videoRef}
      autoPlay
      playsInline
      controls
      style={{ width: "100%", height: "100%", background: "black" }}
    />
  );
}
