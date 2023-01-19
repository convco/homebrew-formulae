class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/convco/convco"
  url "https://github.com/convco/convco/archive/v0.3.15.tar.gz"
  sha256 "4fcb317279723038bd2e6a6a1cec6b44aeefe17180283068c44edd6f634546d0"
  license "MIT"
  head "https://github.com/convco/convco.git"

  livecheck do
    url "https://github.com/convco/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.15"
    sha256 cellar: :any_skip_relocation, monterey:     "a45691ffbfdf784921d0866b137a8115033c4c2bfc6ea3226167d5cbf4f05914"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3842e00b72b1ec31954907ecf9b962b1fd08f3f31a8d032d7fb43fa2cc7fe3d5"
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
