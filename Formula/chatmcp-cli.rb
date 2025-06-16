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

  resource "importlib-resources" do
    url "https://files.pythonhosted.org/packages/cf/8c/f834fbf984f691b4f7ff60f50b514cc3de5cc08abfc3295564dd89c5e2e7/importlib_resources-6.5.2.tar.gz"
    sha256 "185f87adef5bcc288449d98fb4fba07cea78bc036455dd44c5fc4a2fe78fed2c"
  end

  resource "importlib-metadata" do
    url "https://files.pythonhosted.org/packages/7f/de/e04b4cb97a4ce16e2b19b1d3e7bfde0e2dc5d63d8bac97a9b4e37c65a39b/importlib_metadata-7.2.1.tar.gz"
    sha256 "cb52082e659e97afc5dac71e79de97d8681de3aa07ff18578330904a9d18e5b5"
  end

  resource "configargparse" do
    url "https://files.pythonhosted.org/packages/70/8a/73f1008adfad01cb923255b924b1528727b8270e67cb4ef41eabdc7d783e/ConfigArgParse-1.7.1.tar.gz"
    sha256 "e7067471884de5478c58a511e529f0f9bd1c66bfef1dea90935438d6c23306d1"
  end

  resource "litellm" do
    url "https://files.pythonhosted.org/packages/de/4b/a5afe24a29cd7b83bcb80fb56b0c0ad7b4a2e04e6db08f8e7c10e85fef5c/litellm-1.68.1.tar.gz"
    sha256 "cd25a5c90e4b3b0d8bb03e7c844b46c15b4e56b59da95b3b73fddbc8ad1aaede"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/0a/f7/6b84eb5c4e77f54d83b2e8f83b07b8e4e2b85af77a5b5c69901b01ce26e7/rich-14.0.0.tar.gz"
    sha256 "8260cda28e3db6bf04d2d1ef4dbc03ba80a824c88b0e7668a0f23126a424844a"
  end

  resource "prompt-toolkit" do
    url "https://files.pythonhosted.org/packages/04/77/1c77e6efcfe9a5e3d63b0b3d11e1074b8e3fa3b96a5ca7ed6e6b79e9bcff/prompt_toolkit-3.0.51.tar.gz"
    sha256 "33a9bad66f1e8dcbbc5b8b07e9b9a8bb2b4bb58e34cf0d1b92b6d94cdda8fa93"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/b9/2e/0090cbf739cee7d23781ad4b89a9894a41538e4fcf4c31dccc6a93b259d80/click-8.1.8.tar.gz"
    sha256 "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
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