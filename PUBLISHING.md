# Publishing ChatMCP CLI to Homebrew

## Steps to Publish

1. **Create GitHub Repository**
   ```bash
   # Go to https://github.com/new
   # Repository name: homebrew-tap
   # Owner: soulful-ai
   # Make it public
   # Don't initialize with README (we already have one)
   ```

2. **Push to GitHub**
   ```bash
   cd homebrew-tap
   git init
   git add .
   git commit -m "Add chatmcp-cli formula v1.1.0"
   git branch -M main
   git remote add origin https://github.com/soulful-ai/homebrew-tap.git
   git push -u origin main
   ```

3. **Test Installation**
   Once published, users can install with:
   ```bash
   brew tap soulful-ai/tap
   brew install chatmcp-cli
   ```

## Alternative: Quick Test Without GitHub

For local testing only:
```bash
# Install from local formula
brew install --formula --build-from-source ./Formula/chatmcp-cli.rb

# Test commands
chatmcp --version
aider --help
```

## Updating the Formula

When new versions are released on PyPI:

1. Get new version info:
   ```bash
   curl -s https://pypi.org/pypi/chatmcp-cli/json | jq -r '.info.version'
   curl -s https://pypi.org/pypi/chatmcp-cli/json | jq -r '.releases["VERSION"][] | select(.packagetype == "sdist") | {url: .url, sha256: .digests.sha256}'
   ```

2. Update `chatmcp-cli.rb` with new URL and SHA256

3. Commit and push:
   ```bash
   git add Formula/chatmcp-cli.rb
   git commit -m "Update chatmcp-cli to version X.Y.Z"
   git push
   ```

Users will get the update on next `brew update`.