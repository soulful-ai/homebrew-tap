class ChatmcpCli < Formula
  desc "ChatMCP CLI - AI pair programming with MCP server integration"
  homepage "https://github.com/soulful-ai/platforma"
  url "https://files.pythonhosted.org/packages/5f/a7/c19d5eda0e65af8feafaf6b722bc6ad5cfa0cb86798a4a3d64a16003bf4c/chatmcp_cli-1.1.1.tar.gz"
  sha256 "mock_sha256_for_testing_1111111111111111111111111111111111111111"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    # Install using pip user install to avoid virtualenv issues
    ENV["PYTHONUSERBASE"] = libexec
    system Formula["python@3.12"].opt_bin/"python3.12", "-m", "pip", "install", 
           "--user", "--break-system-packages", "chatmcp-cli==1.1.1"
    
    # Create wrapper scripts that set PYTHONUSERBASE
    (bin/"chatmcp").write <<~EOS
      #!/bin/bash
      export PYTHONUSERBASE="#{libexec}"
      exec "#{libexec}/bin/chatmcp" "$@"
    EOS
    
    (bin/"aider").write <<~EOS
      #!/bin/bash
      export PYTHONUSERBASE="#{libexec}"
      exec "#{libexec}/bin/aider" "$@"
    EOS
    
    # Make scripts executable
    chmod 0755, bin/"chatmcp"
    chmod 0755, bin/"aider"
  end

  test do
    assert_predicate bin/"chatmcp", :exist?
    assert_predicate bin/"aider", :exist?
    output = shell_output("#{bin}/chatmcp --help")
    assert_match "usage:", output
  end
end