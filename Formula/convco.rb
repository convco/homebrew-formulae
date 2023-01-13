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
    root_url "https://github.com/convco/homebrew-formulae/releases/download/convco-0.3.13"
    sha256 cellar: :any_skip_relocation, monterey:     "e336553a539fb7f4718cf2da5562a7b0e04da6305e5244cf4cd13a909662d961"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "58f91c5fcf63257df7f50640635de60e3dce5c4c049619bba02632a997476953"
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
