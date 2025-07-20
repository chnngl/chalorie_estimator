import { useState } from "react";
import axios from "axios";

function App() {
  const [ingredients, setIngredients] = useState("");
  const [result, setResult] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();
    setResult("");
    setError("");

    if (!ingredients.trim()) {
      setError("Please enter some ingredients.");
      return;
    }

    setLoading(true);

    try {
      const response = await axios.post("http://localhost:4000/api/estimate", {
        ingredients,
      });

      const resultText = response.data.calories || "No result returned.";

      // Optional: Bold calorie numbers (e.g., "320 calories") using a simple regex
      const formatted = resultText.replace(/(\d+\s*calories?)/gi, "**$1**");

      setResult(formatted);
    } catch (err) {
      setError(
        err.response?.data?.error ||
          "Something went wrong. Please try again later."
      );
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ maxWidth: "600px", margin: "40px auto", fontFamily: "Arial" }}>
      <h1>Calorie Estimator</h1>
      <form onSubmit={handleSubmit}>
        <textarea
          rows={3}
          style={{
            width: "100%",
            padding: "10px",
            fontSize: "16px",
            border: "1px solid #ccc",
            borderRadius: "4px",
          }}
          placeholder="Enter ingredients separated by commas (e.g., chicken, rice, olive oil)"
          value={ingredients}
          onChange={(e) => setIngredients(e.target.value)}
        />
        <button
          style={{
            marginTop: "10px",
            padding: "8px 16px",
            fontSize: "16px",
            backgroundColor: "#4CAF50",
            color: "white",
            border: "none",
            borderRadius: "4px",
            cursor: "pointer",
          }}
          type="submit"
          disabled={loading}
        >
          {loading ? "Estimating..." : "Estimate Calories"}
        </button>
      </form>

      {error && (
        <p style={{ color: "red", marginTop: "10px" }}>
          <strong>Error:</strong> {error}
        </p>
      )}

      {result && (
        <div style={{ marginTop: "20px" }}>
          <h3>Estimated Calories</h3>
          <p
            style={{ whiteSpace: "pre-wrap" }}
            dangerouslySetInnerHTML={{ __html: result.replace(/\*\*(.*?)\*\*/g, "<strong>$1</strong>") }}
          />
        </div>
      )}

      
    </div>
  );
}

export default App;



