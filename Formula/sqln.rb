class Sqln < Formula
  desc "Terminal database client with SQL consoles and a results grid"
  homepage "https://github.com/toninho09/sqln"
  url "https://github.com/toninho09/sqln/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "71a932e2238c613aca672efe20f22585c78f6aa3e7db61ce54de6f72b0d9f3b9"
  license any_of: ["MIT", "Apache-2.0"]

  head do
    url "https://github.com/toninho09/sqln.git", branch: "main"

    depends_on "cmake" => :build
    depends_on "rust" => :build
  end

  # librdkafka includes curl/curl.h even when curl support is off.
  uses_from_macos "curl" => :build

  # macOS arm64 installs the binary of the GitHub release.
  # The other platforms build the source archive.
  on_macos do
    on_arm do
      url "https://github.com/toninho09/sqln/releases/download/v0.6.0/sqln-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "24f6d7148a5f950bffc72d5b60174d7168f087fb975e8d34eb0294b4ea1c9a23"
    end
    on_intel do
      depends_on "cmake" => :build
      depends_on "rust" => :build
    end
  end

  on_linux do
    depends_on "cmake" => :build
    depends_on "rust" => :build
  end

  def install
    if File.exist?("Cargo.toml")
      system "cargo", "install", *std_cargo_args
    else
      bin.install "sqln"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqln --version")
  end
end
