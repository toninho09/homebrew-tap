class Sqln < Formula
  desc "Terminal database client with SQL consoles and a results grid"
  homepage "https://github.com/toninho09/sqln"
  url "https://github.com/toninho09/sqln/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "e5745894a44fdd8f825b715fce55300cf3956dc4fc858d601e99bb663f921753"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/toninho09/sqln.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "rust" => :build

  # librdkafka includes curl/curl.h even when curl support is off.
  uses_from_macos "curl" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqln --version")
  end
end
