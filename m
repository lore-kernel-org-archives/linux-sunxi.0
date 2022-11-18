Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD7618F
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Nov 2022 20:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833D5C433C1;
	Fri, 18 Nov 2022 20:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668804009;
	bh=DXbQbaaVGA0A7vOh2dTdD6FeOz1abpS+rehpW2X1UEA=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Wraw/4JW6ioNay1xpxoxNuScy152Sict8P59w7ib/Mm7T0kOhl4eHWb9vvlrMFfvx
	 st5JcycUd1XolSU1y9KMDeki3P6EIOuzFb1cvk4pO2k9aFTMe9mWiqDHuXu8ljaz4L
	 CiWayu1OrpB4xe6Lxg+foOald8DjMJAMjgLgmOjVoqYh4cIpyFspet/i2Hsmgn0pbF
	 IoPMw91CsAuFR4fKrQxq4DjJV4XiGfSuEYQq22iw40X4T1atvRX6nimRHJ93utaMLJ
	 3aVr+leLRXpHw3QSFexy4s7r2jk71hRl7TgscUUfg687yvwnGN1BIaI23n1KWTzAAr
	 nWXry5ugbJC7w==
Date: Fri, 18 Nov 2022 21:40:04 +0100
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner fixes for 6.1
Message-ID: <Y3ftpBFk5+fndA4B@jernej-laptop>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following fixes for 6.1.

Best regards,
Jernej

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-6.1-1

for you to fetch changes up to 50edc257a152541b8bcdc84f77de5e4efad7013d:

  arm64: dts: allwinner: h6: Add IOMMU reference to Hantro G2 (2022-11-16 19:30:57 +0100)

----------------------------------------------------------------
- RSB bus communication fixes
- missing IOMMU reference property to H6 Hantro G2

----------------------------------------------------------------
Chen-Yu Tsai (2):
      media: dt-bindings: allwinner: h6-vpu-g2: Add IOMMU reference property
      arm64: dts: allwinner: h6: Add IOMMU reference to Hantro G2

Samuel Holland (2):
      bus: sunxi-rsb: Remove the shutdown callback
      bus: sunxi-rsb: Support atomic transfers

 .../bindings/media/allwinner,sun50i-h6-vpu-g2.yaml |  5 +++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |  1 +
 drivers/bus/sunxi-rsb.c                            | 38 ++++++++++++----------
 3 files changed, 27 insertions(+), 17 deletions(-)
