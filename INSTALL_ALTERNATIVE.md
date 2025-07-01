# Alternative Installation Methods

If the Homebrew formula is having dependency issues, use one of these alternatives:

## Method 1: Direct pip install (Recommended)
```bash
# Install with pip
pip install chatmcp-cli

# Or with pipx (isolated)
pipx install chatmcp-cli
```

## Method 2: From source
```bash
# Clone and install from source
git clone https://github.com/soulful-ai/platforma.git
cd platforma/packages/chatmcp_cli
pip install -e .
```

## Method 3: Use nx from this repo
```bash
# Set up API keys in packages/chatmcp_cli/.env
npx nx run platforma:develop:chatmcp_cli
```

All methods will give you:
- `chatmcp` command
- `aider` command (for backwards compatibility)

The Homebrew formula is being improved to handle all Python dependencies automatically.