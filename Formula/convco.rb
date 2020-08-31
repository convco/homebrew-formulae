class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/hdevalke/convco"
  url "https://github.com/hdevalke/convco/archive/v0.3.1.tar.gz"
  sha256 "6a2cb0b05717e8248d096bb27c44c919eb2c6c325ee95208005f738187dab119"
  license "MIT"
  head "https://github.com/hdevalke/convco.git"

  livecheck do
    url "https://github.com/hdevalke/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/hdevalke/convco/releases/download/v0.3.1"
    cellar :any_skip_relocation
    sha256 "a0c3abc4e68481cb2ceb7e4992a8c7d6957b9fd266cc5beb217500d8088059a4" => :x86_64_linux
  end

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
