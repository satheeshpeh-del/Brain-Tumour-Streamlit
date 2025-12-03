#!/bin/bash

# Create Streamlit config 
mkdir -p ~/.streamlit/

# Create basic Streamlit config (important for Render)
cat <<EOF > ~/.streamlit/config.toml
[server]
headless = true
port = $PORT
enableCORS = false
address = "0.0.0.0"
EOF

# Run the Streamlit app
streamlit run streamlit_brain_tumor_app.py --server.port $PORT --server.address 0.0.0.0
