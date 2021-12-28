class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/convco/convco"
  url "https://github.com/convco/convco/archive/v0.3.8.tar.gz"
  sha256 "e59027c1b4ce483d9a1bf49d1abd184ada96de2a8a15c9862bceceeed75408d0"
  license "MIT"
  head "https://github.com/convco/convco.git"

  livecheck do
    url "https://github.com/convco/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.8"
    sha256 cellar: :any_skip_relocation, big_sur:      "8650a3c08b9a15adea5a5144fc329cafcfb510cdf6e27a62f46b7e9af3f38207"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c75ec436b8ccd506f61855b084ea8f5f6c1d7237022c41cef7d8facf27206930"
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
