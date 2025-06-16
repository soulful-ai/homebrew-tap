class ChatmcpCli < Formula
  desc "ChatMCP CLI - AI pair programming with MCP server integration"
  homepage "https://github.com/soulful-ai/platforma"
  url "https://files.pythonhosted.org/packages/8a/18/a48d30d895f1351e283057ebc7113360769b529ee233daafda089f85a700/chatmcp_cli-1.1.1.tar.gz"
  sha256 "17e3076107c76dea3951cfbcc65ae5275266a4c07cd201faccf07f0f5f92c27d"
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