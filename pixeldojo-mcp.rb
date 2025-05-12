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
    url "https://pypi.io/packages/source/a/aiohttp/aiohttp-3.8.6.tar.gz"
    sha256 "b0cf2a4501bff9330a8a5248b4ce951851e415bdcce9dc158e76cfd55e15085c"
  end

  resource "pydantic" do
    url "https://pypi.io/packages/source/p/pydantic/pydantic-2.0.3.tar.gz"
    sha256 "94f13e0dcf139a5125e88283fc999788d894e14ed90cf478bcc2ee50bd4fc630"
  end

  resource "mcp" do
    url "https://files.pythonhosted.org/packages/bc/f1/93436efb0ed2811bba7f54143b85e91adef97e4b4fd15362ed8ab3d17aef/mcp-1.8.0-py3-none-any.whl"
    sha256 "03ae0343db2af3ef94ee2c26c4a2b31e00f00e9ff119ddfcb0b71ca05ffe0da4"
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
