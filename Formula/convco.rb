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
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.7"
    sha256 cellar: :any_skip_relocation, catalina:     "a1de8f4ba72ca919332cdeb9d1cdde33e80173877986d464a7bcd9a093f70c12"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d62c135f015ff4f30a7f691a04d2986deab8282842bc5694348da12116e7f631"
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
