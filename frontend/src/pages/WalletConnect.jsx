import { useState, useEffect } from "react";
import contractData from "../utils/BookNFT.json";
import { uploadFileToIPFS, uploadJSONToIPFS } from "../services/pinata";
import { ethers } from "ethers";

const CONTRACT_ADDRESS = "0x965BFC7a584e434A627c8de3344deB1519f4edc6";
const contractABI = contractData.abi;

export default function WalletConnect() {
  const [account, setLocalAccount] = useState(null);

  async function connectWallet() {
    if (window.ethereum) {
      try {
        const accounts = await window.ethereum.request({
          method: "eth_requestAccounts",
        });
        setLocalAccount(accounts[0]);
        //setAccount(accounts[0]);
      } catch (err) {
        console.error("User rejected connection:", err);
      }
    } else {
      alert("Please install MetaMask");
    }
  }

  useEffect(() => {
    setForm({ ...form, author_wallet_address: account || "" });
  }, [account]);

  const [form, setForm] = useState({
    book_title: "",
    author: "",
    author_wallet_address: account || "",
    isbn: "",
    genre: "",
    price: "",
  });

  const [cover, setCover] = useState(null);
  const [pdf, setPdf] = useState(null);
  const [loading, setLoading] = useState(false);
  const [errors, setErrors] = useState({});

  async function handleSubmit(e) {
    e.preventDefault();
    setLoading(true);
    try {
      const coverCID = await uploadFileToIPFS(cover);
      const pdfCID = await uploadFileToIPFS(pdf);

      const metadata = { ...form, cover: coverCID, file: pdfCID };
      const metadataCID = await uploadJSONToIPFS(metadata);
      console.log(metadataCID);

      const provider = new ethers.BrowserProvider(window.ethereum);
      const signer = await provider.getSigner();

      const contract = new ethers.Contract(
        CONTRACT_ADDRESS,
        contractABI,
        signer
      );

      const tx = await contract.mintBook(
        form.author_wallet_address,
        metadataCID
      );

      await tx.wait();
      alert("Book NFT mindted");
    } catch (err) {
      console.error(err);
      alert("Failed to upload or mint NFT!");
    }

    setLoading(false);
  }

  return (
    <>
      {" "}
      <div className="bg-[linear-gradient(90deg,rgba(255,94,0,1)_60%,rgba(0,0,194,1)_85%,rgba(7,0,71,1)_100%)] p-6 shadow-md w-full mb-6 flex flex-col items-center">
        <h2 className="text-xl text-white font-bold mb-4">
          🔗 Wallet Connection
        </h2>

        {account ? (
          <div className="w-full text-center">
            <p className="text-green-600 font-semibold mb-2">✅ Connected</p>
            <div className="px-3 py-2 text-lg text-white">{account}</div>
          </div>
        ) : (
          <button
            onClick={connectWallet}
            className="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 shadow-md"
          >
            Connect MetaMask
          </button>
        )}
      </div>
      <form
        onSubmit={handleSubmit}
        className="bg-white p-6 rounded-xl shadow-lg max-w-lg mx-auto space-y-4"
      >
        <h2 className="text-xl font-bold">📚 Upload a New Book</h2>

        <div>
          <input
            placeholder="Book Title"
            className="w-full border px-3 py-2 rounded"
            onChange={(e) => setForm({ ...form, book_title: e.target.value })}
          />
          {errors.book_title && (
            <p className="text-red-500 text-sm">{errors.book_title}</p>
          )}
        </div>

        <div>
          <input
            placeholder="Author Name"
            className="w-full border px-3 py-2 rounded"
            onChange={(e) => setForm({ ...form, author: e.target.value })}
          />
          {errors.author && (
            <p className="text-red-500 text-sm">{errors.author}</p>
          )}
        </div>

        <div>
          <input
            className="w-full border px-3 py-2 rounded bg-gray-100 text-gray-600"
            value={form.author_wallet_address}
            readOnly
          />
          <p className="text-xs text-gray-500">Wallet connected via MetaMask</p>
        </div>

        <div>
          <input
            placeholder="ISBN"
            className="w-full border px-3 py-2 rounded"
            onChange={(e) => setForm({ ...form, isbn: e.target.value })}
          />
          {errors.isbn && <p className="text-red-500 text-sm">{errors.isbn}</p>}
        </div>

        <div>
          <input
            placeholder="Genre"
            className="w-full border px-3 py-2 rounded"
            onChange={(e) => setForm({ ...form, genre: e.target.value })}
          />
          {errors.genre && (
            <p className="text-red-500 text-sm">{errors.genre}</p>
          )}
        </div>

        <div>
          <input
            placeholder="Price (ETH)"
            className="w-full border px-3 py-2 rounded"
            onChange={(e) => setForm({ ...form, price: e.target.value })}
          />
          {errors.price && (
            <p className="text-red-500 text-sm">{errors.price}</p>
          )}
        </div>

        <div>
          <label className="block">
            Cover Image:
            <input
              type="file"
              accept="image/*"
              onChange={(e) => setCover(e.target.files[0])}
            />
          </label>
          {errors.cover && (
            <p className="text-red-500 text-sm">{errors.cover}</p>
          )}
        </div>

        <div>
          <label className="block">
            Book PDF:
            <input
              type="file"
              accept="application/pdf"
              onChange={(e) => setPdf(e.target.files[0])}
            />
          </label>
          {errors.pdf && <p className="text-red-500 text-sm">{errors.pdf}</p>}
        </div>

        <button
          type="submit"
          disabled={loading}
          className={`w-full py-2 rounded-lg text-white
    ${
      loading
        ? "bg-gray-400 cursor-not-allowed"
        : "bg-blue-600 hover:bg-blue-700"
    }
  `}
        >
          {loading ? " Uploading & Minting..." : "Upload & Mint NFT"}
        </button>
      </form>
    </>
  );
}
