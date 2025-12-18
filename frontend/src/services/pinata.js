// 1. Make sure your .env file has VITE_PINATA_JWT=...
const PINATA_JWT =
  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySW5mb3JtYXRpb24iOnsiaWQiOiI2MjY0NzYxZi0xOTg0LTQ3MTEtOWM4Ni1mMDRlYTY1MDAyNWIiLCJlbWFpbCI6InZpY211ZG9ub3JlZW4xMjBAZ21haWwuY29tIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsInBpbl9wb2xpY3kiOnsicmVnaW9ucyI6W3siZGVzaXJlZFJlcGxpY2F0aW9uQ291bnQiOjEsImlkIjoiRlJBMSJ9LHsiZGVzaXJlZFJlcGxpY2F0aW9uQ291bnQiOjEsImlkIjoiTllDMSJ9XSwidmVyc2lvbiI6MX0sIm1mYV9lbmFibGVkIjpmYWxzZSwic3RhdHVzIjoiQUNUSVZFIn0sImF1dGhlbnRpY2F0aW9uVHlwZSI6InNjb3BlZEtleSIsInNjb3BlZEtleUtleSI6Ijc3N2FhMWI2Y2M3NDUxYWI1OTY0Iiwic2NvcGVkS2V5U2VjcmV0IjoiYmIyZjk3ZjlmM2Y3OTFkNTE1YTNmYzI1ZmM5YzJhODMzZmUxODJhZTg2ZGQ3ZjI2MTg2MzkxYWQxOTRlODM2ZiIsImV4cCI6MTc5NTY5NjcyN30.pV1KxkM1Qdo_LWWg5qK2KKrC-oba0nuW7kruHJrUwkI";

export async function uploadFileToIPFS(file) {
  // Safety check to ensure key exists
  if (!PINATA_JWT) {
    console.error("Error: VITE_PINATA_JWT is missing from .env file");
    return;
  }

  const formData = new FormData();
  formData.append("file", file);

  const res = await fetch("https://api.pinata.cloud/pinning/pinFileToIPFS", {
    method: "POST",
    headers: {
      // FIX: Added backticks
      Authorization: `Bearer ${PINATA_JWT}`,
    },
    body: formData,
  });

  // FIX: Added backticks
  if (!res.ok) throw new Error(`File upload failed: ${res.statusText}`);

  const data = await res.json();
  console.log("File Uploaded:", data);

  // FIX: Added backticks
  return `ipfs://${data.IpfsHash}`;
}

export async function uploadJSONToIPFS(json) {
  // Safety check
  if (!PINATA_JWT) {
    console.error("Error: VITE_PINATA_JWT is missing from .env file");
    return;
  }

  const res = await fetch("https://api.pinata.cloud/pinning/pinJSONToIPFS", {
    method: "POST",
    headers: {
      // FIX: Added backticks
      Authorization: `Bearer ${PINATA_JWT}`,
      "Content-Type": "application/json",
    },
    body: JSON.stringify(json),
  });

  // FIX: Added backticks
  if (!res.ok) throw new Error(`JSON upload failed: ${res.statusText}`);

  const data = await res.json();
  console.log("JSON Uploaded:", data);

  // FIX: Added backticks
  return `ipfs://${data.IpfsHash}`;
}
