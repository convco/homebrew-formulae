class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/convco/convco"
  url "https://github.com/convco/convco/archive/v0.3.14.tar.gz"
  sha256 "11c4d378c9eb796d7fc5ecfc2fe05c3aea602eda3469a3d61d434b7e7ea54082"
  license "MIT"
  head "https://github.com/convco/convco.git"

  livecheck do
    url "https://github.com/convco/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.14"
    sha256 cellar: :any_skip_relocation, monterey:     "6e16098994ed5e1f50b621fb4cc6509816d0d4eb5289546fcec80a0a3a1b9f8a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a219ddab6a0fe5a6d22e590af1a5c4417112742245c114e2fd2714d2a36f1b8c"
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
