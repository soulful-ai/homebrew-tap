class ChatmcpCli < Formula
  include Language::Python::Virtualenv

  desc "ChatMCP CLI - AI pair programming with MCP server integration"
  homepage "https://github.com/soulful-ai/platforma"
  url "https://files.pythonhosted.org/packages/5f/a7/c19d5eda0e65af8feafaf6b722bc6ad5cfa0cb86798a4a3d64a16003bf4c/chatmcp_cli-1.1.0.tar.gz"
  sha256 "0585fd06a4f566bc2775255ba847537a488db52f3886f27a4be547fb79facaaf"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    # Use pip with dependencies enabled for this specific package
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/pip", "install", cached_download
    bin.install_symlink libexec/"bin/chatmcp"
    bin.install_symlink libexec/"bin/aider"
  end

  test do
    assert_predicate bin/"chatmcp", :exist?
    assert_predicate bin/"aider", :exist?
    output = shell_output("#{bin}/chatmcp --help")
    assert_match "usage:", output
  end
end