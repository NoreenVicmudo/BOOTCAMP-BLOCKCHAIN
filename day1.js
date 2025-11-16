import express from "express";
import crypto from "crypto";

const app = express();
app.use(express.json());

// CORS middleware to allow cross-origin requests
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    if (req.method === 'OPTIONS') {
        return res.sendStatus(200);
    }
    next();
});

app.use(express.static("public"));

// Blockchain storage
const blockchain = [];

// Simple hash function
function calculateHash(data, previousHash) {
    const dataString = `${data}${previousHash}`;
    const hash = crypto.createHash("sha256").update(dataString).digest("hex");
    // Return a simplified hash format like "HASH-XXXXXX"
    return `HASH-${hash.substring(0, 6).toUpperCase()}`;
}

// ===== GET ALL BLOCKS =====
app.get("/api/blocks", (req, res) => {
    res.json(blockchain);
});

// ===== ADD BLOCK =====
app.post("/api/addBlock", (req, res) => {
    const { data } = req.body;

    if (!data) {
        return res.status(400).json({ error: "Data is required" });
    }

    // Get previous hash (0000 for first)
    const previousHash = blockchain.length === 0 ? "0000" : blockchain[blockchain.length - 1].hash;

    // Calculate hash for new block
    const hash = calculateHash(data, previousHash);

    const newBlock = {
        id: blockchain.length + 1,
        data,
        previousHash,
        hash
    };

    blockchain.push(newBlock);
    res.status(201).json(newBlock);
});

app.listen(3000, () => {
    console.log("Server running at http://localhost:3000");
});
