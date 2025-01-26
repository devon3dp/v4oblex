import React, { useState } from "react";

function AnimatedGUI() {
  const [walletAddress, setWalletAddress] = useState("");

  const generateWallet = () => {
    setWalletAddress("0xGeneratedWalletAddress123");
  };

  return (
    <div>
      <h2>Wallet Generator</h2>
      <button onClick={generateWallet}>Generate Wallet</button>
      {walletAddress && <p>Your Wallet Address: {walletAddress}</p>}
    </div>
  );
}

export default AnimatedGUI;
