class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/convco/convco"
  url "https://github.com/convco/convco/archive/v0.3.13.tar.gz"
  sha256 "f137aec3d685f496303bc374d11f62e043f12c5086c72c7975f1e24f36499af6"
  license "MIT"
  head "https://github.com/convco/convco.git"

  livecheck do
    url "https://github.com/convco/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.12"
    sha256 cellar: :any_skip_relocation, big_sur:      "bf79fda2602167cdcb672b482421e03e9612609f6428c8040d684fb6b44bb1e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5aa49746c81936c67460c4960b0c240c3effc5ca3b45bf85f4bfb82339619e3e"
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
