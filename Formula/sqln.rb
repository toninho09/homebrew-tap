class Sqln < Formula
  desc "Terminal database client with SQL consoles and a results grid"
  homepage "https://github.com/toninho09/sqln"
  url "https://github.com/toninho09/sqln/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "f6bdff1d1fbd384f3a40240583e4bf2a0be7add3b430190e3ce09f9af85a8c69"
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
