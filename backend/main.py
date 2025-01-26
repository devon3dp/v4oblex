from fastapi import FastAPI
from bitcoin import BitcoinManager
from ethereum import EthereumManager
from solana import SolanaManager
from analytics import AnalyticsManager

app = FastAPI()

bitcoin_manager = BitcoinManager()
ethereum_manager = EthereumManager()
solana_manager = SolanaManager()
analytics_manager = AnalyticsManager()

@app.get("/api/gas-price")
async def get_gas_price():
    return analytics_manager.get_gas_prices()

@app.post("/api/transaction")
async def process_transaction(data: dict):
    chain = data.get("chain")
    if chain == "bitcoin":
        return bitcoin_manager.process_transaction(data)
    elif chain == "ethereum":
        return ethereum_manager.process_transaction(data)
    elif chain == "solana":
        return solana_manager.process_transaction(data)
    return {"error": "Unsupported chain"}
