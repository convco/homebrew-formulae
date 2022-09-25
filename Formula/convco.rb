class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/convco/convco"
  url "https://github.com/convco/convco/archive/v0.3.12.tar.gz"
  sha256 "c77146eb5e59073a635ba55e906b63e434ea61e2505b3e0b172a526061c1c532"
  license "MIT"
  head "https://github.com/convco/convco.git"

  livecheck do
    url "https://github.com/convco/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.11"
    sha256 cellar: :any_skip_relocation, big_sur:      "1ae46023c105abd78c5ceb4f8b87148098e0b7cfd4a47855182c7819e9b5172c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "06b6f9e491b273417376c931f42e3f95468612ee0fe7fb17e1229992c77ef7e6"
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
