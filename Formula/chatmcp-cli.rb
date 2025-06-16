class ChatmcpCli < Formula
  include Language::Python::Virtualenv

  desc "ChatMCP CLI - AI pair programming with MCP server integration"
  homepage "https://github.com/soulful-ai/platforma"
  url "https://files.pythonhosted.org/packages/5f/a7/c19d5eda0e65af8feafaf6b722bc6ad5cfa0cb86798a4a3d64a16003bf4c/chatmcp_cli-1.1.0.tar.gz"
  sha256 "0585fd06a4f566bc2775255ba847537a488db52f3886f27a4be547fb79facaaf"
  license "Apache-2.0"

  depends_on "python@3.12"

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/a1/d4/1fc4078c65507b51b96ca8f8c3ba19e6a61c8253c72794544580a7b6c24d/packaging-25.0.tar.gz"
    sha256 "d443872c98d677bf60f6a1f2f8c1cb748e8fe762d2bf9d3148b5599295b0fc4f"
  end

  def install
    virtualenv_install_with_resources
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