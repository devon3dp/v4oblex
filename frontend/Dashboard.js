import React from "react";
import GasPriceSlider from "./GasPriceSlider";
import WalletMonitor from "./WalletMonitor";
import TransactionHistory from "./TransactionHistory";
import AnimatedGUI from "./AnimatedGUI";

function Dashboard() {
  return (
    <div>
      <h1>Oblex Dashboard</h1>
      <GasPriceSlider />
      <WalletMonitor />
      <TransactionHistory />
      <AnimatedGUI />
    </div>
  );
}

export default Dashboard;
