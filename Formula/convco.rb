class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/convco/convco"
  url "https://github.com/convco/convco/archive/v0.3.10.tar.gz"
  sha256 "d7ba520881ecea39dad3103561953bad36a8d10e8b9e2a641fe09d82748cfe3f"
  license "MIT"
  head "https://github.com/convco/convco.git"

  livecheck do
    url "https://github.com/convco/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.10"
    sha256 cellar: :any_skip_relocation, big_sur:      "c13d2cf80f074b3bdd59a1f02119d9cedab90dbc7e00ed5746b4a994a4752214"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "26db4351eee9a0449d3542393b13b907605c21c865731c801f430dc03039a096"
  end

  depends_on "cmake" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bash_completion.install "target/completions/convco.bash" => "convco"
    zsh_completion.install  "target/completions/_convco" => "_convco"
    fish_completion.install "target/completions/convco.fish" => "convco.fish"
  end

  test do
    system "#{bin}/convco", "--version"
  end
end
