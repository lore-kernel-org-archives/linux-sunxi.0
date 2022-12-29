Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF771FAF
	for <linux-sunxi@lists.linux.dev>; Thu, 29 Dec 2022 18:15:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id B62D532005C1;
	Thu, 29 Dec 2022 13:15:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 29 Dec 2022 13:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672337731; x=1672424131; bh=aL
	V0CF57edhnO+Yi0RAt5gJKhT87LHNREaBPsrajes0=; b=lVS9wWbnizn7DCDLlF
	kqtb1fNKzGtDRNaw88SgtTv7qoUOabeOED3pTdtOl3EKHB9F+t5v1yVxKtd4MM6y
	zHOOzbgyw3AzZ2XSnGyE8WHKG/378kYNYjIFDIR7gzNTb/jfows+KKPjyGs/o7EJ
	5XHoy+1MxJf4Xr3UgyyonAOoVCjzHvKmUw50B9osRzseWj1S+2zLjWmRfIalvs39
	PdYsXt/palbh5QSTlbypCs7Mn1M59ZDaeVxHYtb5lgrA8kprAC4Ed+U6Zk9QFVk2
	GnF8LTZTBgtDPifo4vqARHwad5cYV8MIuTI9+4EIKEPDZCM4TLwyjuyo43iGf62V
	OWNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672337731; x=1672424131; bh=aLV0CF57edhnO
	+Yi0RAt5gJKhT87LHNREaBPsrajes0=; b=I5Fxbe/f1E3aeiherKYnPEQqP5X55
	01qxSmqNL41L7LoJehF6WRrFp9hZryspQhILe0KqnniduAoDQf6alzostp9pJEBt
	NZWBCalt8xrc0OQwZ00fSAp8w+LUErLzJb3tCy+b15suTXDLdVEh5tTkfGNJljRo
	60oSUBoMEKugNSgUOkgo/11ksb92SMAhJNR3jOD+mHnO82rY4jdSdc/jiP2DNgOb
	iy5xrOeuAFkwU6wRg6zmpr4z7MB2R6HEtBMyKiZ+C1dQzBAE7AW4P5IZsusEghBZ
	h9ubWknVHnWbFFbpBzETvHxHvsLV6PtvhO+CX4UwQcOkYwoSYo72ZO7Og==
X-ME-Sender: <xms:Q9mtYyHKIMwL1LCi-j3vvCORLKh5RT2OepRaFUozfKkUBk8yc1qjOw>
    <xme:Q9mtYzXS8ZuJuFvUdy6VHepmE-RXyCQAIHCG9tijenTruYUGSji-JILmcabT7-0IA
    V3jooMnKIJW7hJvng>
X-ME-Received: <xmr:Q9mtY8J2Dl9qi2LW31IvOHW8wvAYV21Z4l7wG62CKKUPq1LwWMqob-Ucv91POrJ-dHoNrYXBvBA2YLowfg_Z3-a7YbfzcgQThtKLSBseIB9nZWKz85qA6HP0OilrQYbdzi_BSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:Q9mtY8FIlnOKP-Fi1PekMozGKrlzfF7cF8lOhCctrPNj6PDOgRQbQg>
    <xmx:Q9mtY4UkiujXwsLuuNjiqslfCn6k5zOnPrwtr9OgJ-NuurSpdgqzzg>
    <xmx:Q9mtY_OmI6HqrlBFGlHG1NGVDNVXF3M0A7KLa2vm7WfgPDxbLCs09A>
    <xmx:Q9mtYxPiBhyGEAyWcf_kShHLNjl0i-zkcLNpu8UNKJQO_CQTHulQ9A>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 13:15:30 -0500 (EST)
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
Subject: [PATCH 1/7] mtd: rawnand: sunxi: Clean up chips after failed init
Date: Thu, 29 Dec 2022 12:15:20 -0600
Message-Id: <20221229181526.53766-2-samuel@sholland.org>
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

If a chip fails to initialize, we need to clean up any chips that were
already initialized/registered.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/mtd/nand/raw/sunxi_nand.c | 39 ++++++++++++++++---------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ea953e31933e..2ee86f7b0905 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1950,6 +1950,25 @@ static const struct nand_controller_ops sunxi_nand_controller_ops = {
 	.exec_op = sunxi_nfc_exec_op,
 };
 
+static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
+{
+	struct sunxi_nand_chip *sunxi_nand;
+	struct nand_chip *chip;
+	int ret;
+
+	while (!list_empty(&nfc->chips)) {
+		sunxi_nand = list_first_entry(&nfc->chips,
+					      struct sunxi_nand_chip,
+					      node);
+		chip = &sunxi_nand->nand;
+		ret = mtd_device_unregister(nand_to_mtd(chip));
+		WARN_ON(ret);
+		nand_cleanup(chip);
+		sunxi_nand_ecc_cleanup(sunxi_nand);
+		list_del(&sunxi_nand->node);
+	}
+}
+
 static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 				struct device_node *np)
 {
@@ -2053,6 +2072,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			of_node_put(nand_np);
+			sunxi_nand_chips_cleanup(nfc);
 			return ret;
 		}
 	}
@@ -2060,25 +2080,6 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	return 0;
 }
 
-static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
-{
-	struct sunxi_nand_chip *sunxi_nand;
-	struct nand_chip *chip;
-	int ret;
-
-	while (!list_empty(&nfc->chips)) {
-		sunxi_nand = list_first_entry(&nfc->chips,
-					      struct sunxi_nand_chip,
-					      node);
-		chip = &sunxi_nand->nand;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
-		sunxi_nand_ecc_cleanup(sunxi_nand);
-		list_del(&sunxi_nand->node);
-	}
-}
-
 static int sunxi_nfc_dma_init(struct sunxi_nfc *nfc, struct resource *r)
 {
 	int ret;
-- 
2.37.4

