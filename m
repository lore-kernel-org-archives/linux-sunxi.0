Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220DD1FAF
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Dec 2022 18:15:41 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id B11983200900;
	Thu, 29 Dec 2022 13:15:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 29 Dec 2022 13:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672337739; x=1672424139; bh=+y
	owLKRJXG5KC8guU+L3zS9PmXyXPUwHqs5jAcrH1n8=; b=NjMFxRZ+QZD9UGucgT
	3k9PuEN2/mDP+IB9eAtBS4ykWeu3aXi6YvfZnOxMtUnM1k7dgBKbNZizRiniCreK
	mPgqELgFWGEJClE7k5a87NVie2KGW6aAQx40LpRKUqa+kzRcsIBF23tlE774DSi4
	cZMcDQqCclZaElXyCMWYL3wVALtaHcsN/YDTCd959c934SQbP4LFWvtyc6oy09Oo
	v89h0GCKI0H7jlEALyIbgE2JSjFVr0yL7ys6pPfMh9tw81UI3OI9rDhzRttOsqgd
	sGw4Wre5b8ZronJeofJjKupxEyPgIfYzOiJ7UDD7d+YtSguUM7XH1PGI9S5WF3KP
	JDnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672337739; x=1672424139; bh=+yowLKRJXG5KC
	8guU+L3zS9PmXyXPUwHqs5jAcrH1n8=; b=HsRR2B5aqf2cMTQNa8s3obOULDCwU
	bI7/qnGSV02TRSrCAgVe0N4/6UQ8h4pFful0gd4Wqyeg9+p+huQOvV9XziiHe112
	F4xzeVVR2DMMxF6PARc5xNGmRwBpt2y5I1e4ZZPalrc1AtF4ntbp8tZYIx4v2a/e
	rF7HBzuUW907QMkL+f3PHYX8EYs8HSMl7NZBm89ofI33eD4e7d2Ixi17/i6CwCNQ
	3csDvmhGvWlNn+dd0gY1HbSdeZHL7PHak6q8tfoJZvbzrVqRRqA+dX02KXwYR/V+
	MDF/WNpCxdZ7JfOTgruRnXw7smsOMFdaIL70xsFVsBEPqqpKVRkixbinQ==
X-ME-Sender: <xms:StmtYwrokwmQYuQy44RdrPQnpemGll52UZdE7k_4OFJcjRh4olNNBg>
    <xme:StmtY2rkoNORgELQHLdoDBOV6Jyk2aavF8THhVx7yBgneN4FEtwdxp3XN0i_-Q45w
    ZadEQjVZjBPK-YaBA>
X-ME-Received: <xmr:StmtY1PV0B2ld1tNQCnJYXmWeGmGZcmzNFuqA7aBUVk_XH7n85J5_hMfMM-AU2D1mKaMaj1tIGFNmA_3QXD4ryuCm_sxD0-aa7HBvgBvjiliFOXbYHEOpgYT3PCCSet1u_xXpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:StmtY37S-jgSBf96ObzW9Qrf94pnqgrt6P_IfhoGGTjZVH1FpMmyJg>
    <xmx:StmtY_6XVCh8lHyOxISSUzSUfMMAugtijEMmdMD-qPfmHCYwKle5_A>
    <xmx:StmtY3iHoQ-ocKnp_4-JlU9O20lPycZAuWvgUonrUPHWlLbYCcwipA>
    <xmx:S9mtY8wlKZb7T76vtWdv6SPaoaOeJ46WGHncgTwEok1NDYIMGFjWmQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 13:15:38 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/7] mtd: rawnand: sunxi: Fix ECC strength maximization
Date: Thu, 29 Dec 2022 12:15:23 -0600
Message-Id: <20221229181526.53766-5-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221229181526.53766-1-samuel@sholland.org>
References: <20221229181526.53766-1-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is already accounted for in the subtraction for OOB, since the BBM
overlaps the first OOB dword. With this change, the driver picks the
same ECC strength as the vendor driver.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mtd/nand/raw/sunxi_nand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 1bddeb1be66f..1ecf2cee343b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1643,8 +1643,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 
-		/* Reserve 2 bytes for the BBM */
-		bytes = (mtd->oobsize - 2) / nsectors;
+		bytes = mtd->oobsize / nsectors;
 
 		/* 4 non-ECC bytes are added before each ECC bytes section */
 		bytes -= 4;
-- 
2.37.4

