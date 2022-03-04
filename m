Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09ECC7C
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Mar 2022 16:13:31 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 60BEC20172
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Mar 2022 16:06:37 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 36DF5206D3
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Mar 2022 16:06:28 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 1D3AA401F1;
	Fri,  4 Mar 2022 17:06:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by filter2.mymailcheap.com (Postfix) with ESMTP id 1279E2A7E4;
	Fri,  4 Mar 2022 16:06:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
	by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6INwB3I3FtZ8; Fri,  4 Mar 2022 16:06:18 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by filter2.mymailcheap.com (Postfix) with ESMTPS;
	Fri,  4 Mar 2022 16:06:18 +0000 (UTC)
Received: from edelgard.icenowy.info (unknown [59.41.160.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1A64F406AD;
	Fri,  4 Mar 2022 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1646409978; bh=0du1H8fVcw/6Hd6Du2BMgX0TilgzWi60t+RRBoBPt48=;
	h=From:To:Cc:Subject:Date:From;
	b=gAPasz+6m1DKyXlLYDOqSPGVxEBmh67MEaLc8t/wFPMaP3cfgQAg4XDL/Bp4DskLT
	 LDd8KRy8ua1SB743/vJNWriJDftIatqNfQqVNh99q+Da5veyrs5bcN6Il5AqCh38sS
	 I+11URg9PDwmxRIb/U5CjLGSPw/TeJ83wvE8zIyk=
From: Icenowy Zheng <icenowy@aosc.io>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Hans de Goede <hdegoede@redhat.com>
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH] sunxi: fix build when CONFIG_UART0_PORT_F is selected
Date: Sat,  5 Mar 2022 00:06:01 +0800
Message-Id: <20220304160601.181155-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently CONFIG_UART0_PORT_F will forbid the build of sunxi-mmc driver,
which leads calls to it in board/sunxi/board.c a undefined reference.

Guard that code in #ifndef to fix build.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 board/sunxi/board.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/sunxi/board.c b/board/sunxi/board.c
index 82c52b28f8..8a003d8559 100644
--- a/board/sunxi/board.c
+++ b/board/sunxi/board.c
@@ -539,6 +539,7 @@ int board_mmc_init(struct bd_info *bis)
 {
 	__maybe_unused struct mmc *mmc0, *mmc1;
 
+#ifndef CONFIG_UART0_PORT_F
 	mmc_pinmux_setup(CONFIG_MMC_SUNXI_SLOT);
 	mmc0 = sunxi_mmc_init(CONFIG_MMC_SUNXI_SLOT);
 	if (!mmc0)
@@ -549,6 +550,7 @@ int board_mmc_init(struct bd_info *bis)
 	mmc1 = sunxi_mmc_init(CONFIG_MMC_SUNXI_SLOT_EXTRA);
 	if (!mmc1)
 		return -1;
+#endif
 #endif
 
 	return 0;
-- 
2.35.1

