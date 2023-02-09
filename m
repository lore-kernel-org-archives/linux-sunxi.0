Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E8B64A
	for <linux-sunxi@lists.linux.dev>; Thu,  9 Feb 2023 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ocxsTRFxklCA2TrAA9rcEGDXgUyiQ9T4rmhGw1As36U=; b=U+1e/OVOWKCHrtXA3kNI4q9kLN
	sxW1OTSIu4ej0fgjG4TSEkMHnF41qw8piM/SMakus5KY1CG2gFsj7qD7TF6p3k+B7bkUgBoeYvKKr
	yzhBLj6Aw1+/fAT9lzastAxqWP+hxSRkce0jRu2xwMjFp8UmxBijqBly0oU2LtYmnqoHaPC2sWjwq
	oN41Lpjg4uBDWz9O9MvyBpSbD1RsKeKPvhk+VtHgPR9FyF/O0Ni16k6hfOnwueQbF+fpk3yFJEOCc
	Q/oH7i5AV+dms/2dpQvL7Qv7156AW29zt1Sgvx7y7nOL/cVbap3ztlVD/XbgscKqBe2w5s96ARTSk
	Mzj8rbZg==;
Received: from [2601:1c2:980:9ec0::df2f] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQAeN-002Z6u-Vp; Thu, 09 Feb 2023 17:24:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] soc: sunxi: SUN20I_PPU should depend on PM
Date: Thu,  9 Feb 2023 09:23:59 -0800
Message-Id: <20230209172359.5813-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An $ARCH or a platform should select PM. Single device drivers
should only depend on PM, not select it.

Having SUN20I_PPU depend on PM removes a kconfig warning:

WARNING: unmet direct dependencies detected for PM
  Depends on [n]: !MMU [=y]
  Selected by [y]:
  - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])

Fixes: 0ad2185dcb5e ("soc: sunxi: select CONFIG_PM")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/soc/sunxi/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/soc/sunxi/Kconfig b/drivers/soc/sunxi/Kconfig
--- a/drivers/soc/sunxi/Kconfig
+++ b/drivers/soc/sunxi/Kconfig
@@ -23,7 +23,7 @@ config SUNXI_SRAM
 config SUN20I_PPU
 	bool "Allwinner D1 PPU power domain driver"
 	depends on ARCH_SUNXI || COMPILE_TEST
-	select PM
+	depends on PM
 	select PM_GENERIC_DOMAINS
 	help
 	  Say y to enable the PPU power domain driver. This saves power
