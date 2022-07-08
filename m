Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9D7F4
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 16:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40439C341C6;
	Fri,  8 Jul 2022 16:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657297988;
	bh=1oEZlcnp3FMLW0227xkippi8k2jCBW7pDFmB127l5Ls=;
	h=Date:From:To:Cc:Subject:From;
	b=XRfDSStCcX7Cxh0cX8wZ/KjxxR2F3Ri/engYYRDjo26trkgb1WV4BcN1bzPhGwyDl
	 9ZOCJZdtaAxbPww7rytO4aF+W3OXw1U8WT85ZE8e7uAOwrV4JaCAXYpTS7dQ3wajQE
	 belXewCN33luh7dLm0GVlrvjgAVRDeKrRgX1JUp1dIMBVlixRIX1Sc02DUqGF+9iYQ
	 n86EDIIop3KOQ74PTy/ofTSn/axggnq0HfUKdZK+va4gQRL7OntUBalL/XT5uuNYm8
	 v2nvYU6/BvvPphkxksagHUI+4Vq1vHWtlcUz/CvLRXXpBH2ycjwRHPg4Hc/wt+Ei9c
	 QYKlbBJ3AEP9A==
Date: Fri, 8 Jul 2022 18:33:04 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 5.20
Message-ID: <YshcQP6rsWJHgfYO@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following clock changes for 5.20.

Best regards,
Jernej

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-5.20-1

for you to fetch changes up to 4167ac8a657e4f0860419adf24d4b91a26580488:

  clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS (2022-07-08 18:13:50 +0200)

----------------------------------------------------------------
- deduplicate ccu_clks arrays
- H6 GPU DFS support
- adjust Kconfig

----------------------------------------------------------------
Roman Stratiienko (1):
      clk: sunxi-ng: sun50i: h6: Modify GPU clock configuration to support DFS

Samuel Holland (3):
      clk: sunxi-ng: Deduplicate ccu_clks arrays
      clk: sunxi: Limit legacy clocks to 32-bit ARM
      clk: sunxi: Do not select the PRCM MFD

 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c |  16 +----
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c   |  16 ++++-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c   |  79 ++++++-----------------
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c    | 113 +--------------------------------
 drivers/clk/sunxi-ng/ccu-sun8i-r.c     |  40 +++---------
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c   |  84 ++----------------------
 drivers/clk/sunxi/Kconfig              |   4 +-
 7 files changed, 54 insertions(+), 298 deletions(-)
