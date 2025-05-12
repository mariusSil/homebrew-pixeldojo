class PixeldojoMcp < Formula
  include Language::Python::Virtualenv

  desc "MCP server for PixelDojo AI image generation API"
  homepage "https://github.com/mariusSil/pixeldojo-mcp-server"
  url "https://github.com/mariusSil/pixeldojo-mcp-server/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"

  depends_on "python@3.11"

  # Main dependencies
  resource "aiohttp" do
    url "https://files.pythonhosted.org/packages/d6/12/97c2b0376995e0d59a8a80e0f9a2c650033a85b7efceceee693ad17612f5/aiohttp-3.8.6-cp311-cp311-macosx_11_0_arm64.whl"
    sha256 "676ca066ade39aacdccc2c68dfb72c8391409ebeef225e49d2a8f3120fd22e94"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/21/84/2acce7cadb6562dfd327d129ebafb9c2f2f2d09dc2afea1434e29231a45a/pydantic-2.0.3-py3-none-any.whl"
    sha256 "7c0bf3acb7ef1bb8ceb7388e9a738ab8b7c084ef02f352a030c64a883e17a0ab"
  end

  resource "mcp" do
    url "https://files.pythonhosted.org/packages/ef/d1/a27d28b37acfe801a66cb67f0a1e6a7a12c3e37d7fe91a0de6d4df9f6d84/mcp-1.8.0.tar.gz"
    sha256 "fa50f0ecc72df169b797c9b96775f9ce0aadbbaa353ecf3be6e005d02ddb34e9"
  end
  
  resource "attrs" do
    url "https://pypi.io/packages/source/a/attrs/attrs-23.1.0.tar.gz"
    sha256 "6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc50e015"
  end

  resource "multidict" do
    url "https://pypi.io/packages/source/m/multidict/multidict-6.0.4.tar.gz"
    sha256 "3666906492efb76453c0e7b97f2cf459b0682e7402c0489a95484965dbc1da49"
  end

  resource "yarl" do
    url "https://pypi.io/packages/source/y/yarl/yarl-1.9.2.tar.gz"
    sha256 "04ab9d4b9f587c06d801c2abfe9317b77cdf996c65a90d5e84ecc45010823571"
  end

  resource "charset-normalizer" do
    url "https://pypi.io/packages/source/c/charset-normalizer/charset-normalizer-3.3.2.tar.gz"
    sha256 "f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5"
  end

  resource "frozenlist" do
    url "https://pypi.io/packages/source/f/frozenlist/frozenlist-1.4.1.tar.gz"
    sha256 "c037a86e8513059a2613aaba4d817bb90b9d9b6b69aace3ce9c877e8c8ed402b"
  end

  resource "async-timeout" do
    url "https://pypi.io/packages/source/a/async-timeout/async-timeout-4.0.3.tar.gz"
    sha256 "4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c427522f"
  end

  resource "idna" do
    url "https://pypi.io/packages/source/i/idna/idna-3.6.tar.gz"
    sha256 "9ecdbbd083b06798ae1e86adcbfe8ab1479cf864e4ee30fe4e46a003d12491ca"
  end

  # Add additional Python package dependencies following the same pattern

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "pixeldojo-mcp", shell_output("#{bin}/pixeldojo-mcp --help", 2)
  end
end
