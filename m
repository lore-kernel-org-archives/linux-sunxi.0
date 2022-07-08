Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA12575
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 16:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18C4C341C0;
	Fri,  8 Jul 2022 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657298755;
	bh=Nxh/HJOIUK9VB1rO0Z3HXHNlnvZT6n4Ybx4iuj48Cdo=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=ARj2NYR9waiR2/JBkOQyvS4ET7B+7mGulnqeF2VOG4Ugq1QHP9HTFcx0qofFPI9Nz
	 ZTVIdEBuk8yZQEw24E1S93DZxI7d53xFmYy/MI5EAqHrZnez5WojFTena1tz7sfTjl
	 oUz/O4ujzvbdvaphLMBCKD+G9cGHNBL1+rMGyVnxX3PlS91kts14h3Vwl5ET3rV8x3
	 yI709PGqkS5C9mXoEyg+n81s2E2FAUQiLpyGvzDBi6LiTuA5Xt676uydix20Zhs6CV
	 pVQdl47YZmQb1mpc1vcEGFZ6hG9YW+bfAcd1frkY9bRDudLPor3PRcfZX1WcgW/Xq8
	 rDarvGXFDop8Q==
Date: Fri, 8 Jul 2022 18:45:50 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner drivers changes for 5.20
Message-ID: <YshfPux1c2x9S7Fi@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following drivers changes for 5.20.

Best regards,
Jernej

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-5.20-1

for you to fetch changes up to db1bfbd60e325abddc824c49b2fd45a39a10b2f5:

  soc: sunxi: mbus: Only build the driver on ARM/ARM64 (2022-07-05 22:05:59 +0200)

----------------------------------------------------------------
- build mbus driver only for ARM/ARM64

----------------------------------------------------------------
Samuel Holland (1):
      soc: sunxi: mbus: Only build the driver on ARM/ARM64

 drivers/soc/sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)
