class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/convco/convco"
  url "https://github.com/convco/convco/archive/v0.3.7.tar.gz"
  sha256 "0728864eb6c23a2ea55370bd5c1ecb58bac6dd811db33da248921131f7f07a44"
  license "MIT"
  head "https://github.com/convco/convco.git"

  livecheck do
    url "https://github.com/convco/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.5"
    sha256 cellar: :any_skip_relocation, catalina:     "93e4a59b728fb08cdd80a2324bf9b041cd93fe7617a1869a15706ec0fe393556"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "11c0bc2da05e27a5baf742c0c5e50c24a9790e13ba9a47db4caed24a9a3c2f01"
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
