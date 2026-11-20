class Sqln < Formula
  desc "Terminal database client with SQL consoles and a results grid"
  homepage "https://github.com/toninho09/sqln"
  url "https://github.com/toninho09/sqln/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "cb47b3bc34a4da1a5117233d0ea548e87cb27e17ce4c99ee99ec197614b82a34"
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
