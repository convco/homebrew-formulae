class Convco < Formula
  desc "Conventional commits, changelog, versioning, validation"
  homepage "https://github.com/convco/convco"
  url "https://github.com/convco/convco/archive/v0.3.3.tar.gz"
  sha256 "cb07586c5471a80847be2716d43ea7eb21473708cc2017be6390a4897ffb22d0"
  license "MIT"
  head "https://github.com/convco/convco.git"

  livecheck do
    url "https://github.com/convco/convco/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/convco/convco/releases/download/v0.3.2"
    cellar :any_skip_relocation
    sha256 "a0c3abc4e68481cb2ceb7e4992a8c7d6957b9fd266cc5beb217500d8088059a4" => :x86_64_linux
    sha256 "7786f32a696630e9fa326b2404f741e199c51b8fe995a4d033c21aea7c20bd40" => :catalina
  end

  depends_on "rust" => [:optional, :build]

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
