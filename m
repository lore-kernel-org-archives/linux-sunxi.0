Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1AB770
	for <linux-sunxi@lists.linux.dev>; Tue, 30 Mar 2021 13:01:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EF6231B;
	Tue, 30 Mar 2021 06:01:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979C33F694;
	Tue, 30 Mar 2021 06:01:36 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@siol.net>,
	Samuel Holland <samuel@sholland.org>,
	Jagan Teki <jagan@amarulasolutions.com>
Cc: Simon Glass <sjg@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	u-boot@lists.denx.de,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev
Subject: [For v2021.04] [PATCH 0/2] sunxi: last-minute H616 fixes
Date: Tue, 30 Mar 2021 14:01:20 +0100
Message-Id: <20210330130122.3915-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

The link address of the BL31 Trusted Firmware code has changed during
the development, so we need to fix the load address in our FIT image
template accordingly. The H616 TF-A patches are about to be merged now:

https://review.trustedfirmware.org/q/topic:%22allwinner_h616%22+(status:open%20OR%20status:merged)

Since H616 support was introduced in this cycle's merge window, we should
merge those fixes before the release, to avoid compatiblity issues.

The second patch defers to TF-A to add the reserved memory node, we
didn't have this code in the TF-A series initially. Having two
conflicting reserved memory locations doesn't fly very well, so this one
drops our hardcoded version.

Thanks!
Andre

Andre Przywara (2):
  sunxi: H616: Change TF-A load address to beginning of DRAM
  sunxi: dts: H616: Drop reserved-memory node

 arch/arm/dts/sun50i-h616.dtsi  | 12 ------------
 arch/arm/dts/sunxi-u-boot.dtsi |  2 +-
 2 files changed, 1 insertion(+), 13 deletions(-)

-- 
2.17.5

