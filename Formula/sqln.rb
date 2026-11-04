class Sqln < Formula
  desc "Terminal database client with SQL consoles and a results grid"
  homepage "https://github.com/toninho09/sqln"
  url "https://github.com/toninho09/sqln/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "e276145abffdba5f8f734d6f6cc94f96570b09328f49ab909d6aff51d99102a1"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/toninho09/sqln.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqln --version")
  end
end
