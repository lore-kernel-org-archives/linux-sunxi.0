Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30EF7F
	for <linux-sunxi@lists.linux.dev>; Fri,  6 May 2022 16:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20370C385A9;
	Fri,  6 May 2022 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651854134;
	bh=lDBvKOsjsCRt9+HE0fhz2hNqvsVyv3Vo9Qt1qtLhhj8=;
	h=Date:From:To:Cc:Subject:From;
	b=vHlCwNbvyVVmY5CmImsJ122WuBtyFeIiSG/UBjQed7DRufHndYC9jpD3h4vDSRc80
	 I+3KW8ZDOEgSvMGz76CQReO5woWFd7FpxXZpnxRq5mzYh+hCQiVXy6pLcduJg9uUzD
	 oUoeF83aztc3jplBZidwzvPT/mIXcNpaaiNwVdO8UNiQG8+/I0jpSbpcpmpn67aPSt
	 NElYZFIe4PtKFV0o3WYd02i8VPCtLAEVwH7tq1hr6HUqDz6hS0sCncfetCSANYrteR
	 SMi8E/OrO0RSlcNR/JKCSqrl0l5os2gCU8qi3D344UBayhD57n/mBL/cQg4ANGmBpQ
	 T6COwAYg2TmZg==
Date: Fri, 6 May 2022 18:22:10 +0200
From: Jernej Skrabec <jernej@kernel.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner clock changes for 5.19
Message-ID: <YnVLMm7t/NbwnDad@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following clock changes for 5.19.

Best regards,
Jernej

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-5.19-1

for you to fetch changes up to 31ab5169803ebc009e01d1ee4501ca9faf347161:

  clk: sunxi-ng: h616: Add PLL derived 32KHz clock (2022-05-06 18:03:52 +0200)

----------------------------------------------------------------
Added H6 RTC clock and H616 32 kHz clock

----------------------------------------------------------------
Andre Przywara (2):
      clk: sunxi-ng: h6-r: Add RTC gate clock
      clk: sunxi-ng: h616: Add PLL derived 32KHz clock

 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c      | 5 +++++
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h      | 2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c      | 8 ++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-h616.h      | 2 +-
 include/dt-bindings/clock/sun50i-h6-r-ccu.h | 1 +
 include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
 6 files changed, 17 insertions(+), 2 deletions(-)
