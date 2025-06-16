class ChatmcpCli < Formula
  include Language::Python::Virtualenv

  desc "ChatMCP CLI - AI pair programming with MCP server integration"
  homepage "https://github.com/soulful-ai/platforma"
  url "https://files.pythonhosted.org/packages/5f/a7/c19d5eda0e65af8feafaf6b722bc6ad5cfa0cb86798a4a3d64a16003bf4c/chatmcp_cli-1.1.0.tar.gz"
  sha256 "0585fd06a4f566bc2775255ba847537a488db52f3886f27a4be547fb79facaaf"
  license "Apache-2.0"

  depends_on "python@3.12"

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/00/f5/b47bdb6db60175c1a96a085506b2a5bc0e9467241ff6ee95bbfd93d0b41a/packaging-24.2.tar.gz"
    sha256 "c228a6dc5e932d346bc5739379109d49e8853dd8223571c7c5b55260edc0b97f"
  end

  resource "setuptools" do
    url "https://files.pythonhosted.org/packages/ad/7c/c3ebf7de8f0a0c3d7fd0ddfff0bbf7a9ea38b0e63cb0cc8b9c37eaab0cd3/setuptools-76.0.0.tar.gz"
    sha256 "dc6c3b5e5e66c3195e71fa416b13aca1dd4066fb6fbe8b43e3ecd81b0e1b0b6d"
  end

  def install
    virtualenv_install_with_resources do
      # Upgrade pip to ensure we can install all dependencies
      system libexec/"bin/pip", "install", "--upgrade", "pip"
    end
  end

  test do
    # Test that the commands exist
    assert_predicate bin/"chatmcp", :exist?
    assert_predicate bin/"aider", :exist?
    
    # Test basic functionality
    output = shell_output("#{bin}/chatmcp --version 2>&1", 1)
    assert_match(/chatmcp|aider|version/, output)
  end
end