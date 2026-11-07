Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082430;
	b=Nhl1E860ndD+NGUKTthlrWLsTc0egj++XEl/eB8WLXkIIV6noDUd06SZgQPJlhANFT7O
	 7400/kSTB7aRL9ZM7eih6AQBqjUYUrCAxVXOO5IUuFfNU9xKvh/CNRh2YOLuwFgaQlbe4
	 sd9F6RIsnsQf8w0b85lX/SDPji6v5I21ifLPDNO37df2LLSZhErCnojSTGSgAuXgYH2bB
	 OFeUrpmoPyCCanA6AvTcpg/xOmT+GUqYidyrFFw2Eqid3CNd+T5eHN4oORamn+8sgMI6Q
	 w2CT3hvwBrlSanRniUZmeRISh3X1JZ787gji/nSx3+5oj33jPP2QlKGB4VDK6qGcdnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082430;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=/yprO6XgRby+OSfTwdMKpRwveM3NGLFtGf1sI+fdoJg=;
	b=cT4DX/J9/tv/Wt6zNobJeTeiPTAnv8M9MMKNLbjRsZZhSUF22minMBgxT27pJFxkw4ru
	 bUp647AoUzUJM6NG41RCRBCXvdWbBJtolh7j1cYdbUyKPY/s6R8lvksPILQLeMkodAYNg
	 dVPLmiH8vc98bJK+rbO2DZ7ZQ3cquicmrNsdGvPJKzZbAsjW8RTlfCCjgRdz3aYHfXmFm
	 sFSaPV0tGJCE4m8XCqxxGMBwSHEAcLxRbm4QKA/5N1hxdMIsUsm5qlCdjk7pdNjjdy136
	 ESeAZ3i0oTmh/XbpAsSYwoT6A8Ta5uBZLW2+e7aRWWVrPuwntVi5a41mvjHTyvPfeUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710806082BF6
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 710806082BF6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-716c0217635so30259eaf.0
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082428; x=1794687228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yprO6XgRby+OSfTwdMKpRwveM3NGLFtGf1sI+fdoJg=;
        b=dp98olpg4UkdzYPW09pTljrkmvpYJIyc++cuwO6lMIjltAAHf0tg0lDwgzQI+lN6Cq
         L7WEemN25xvNuJEK4pBVacvLDqrd6OrPoGYGKTylCaKKB3XhmbchO/WMoU8HMfIzPzrb
         OCYrziYChKVIUF/VdO/RJkH+rVsHrY83VwsVj14v5Y0hhg9oUuz1paiE9GcdgURV1So1
         RG6QpxXHfZDk9FcQI+9KWslziOQlCB9hk/U86uM+D3iAyvZJZtadv4vzntytflGhpI3J
         GTSgCcXU8sr2wHVHrDyub2ly05krLUiwweEpJ1vvayUQ5VPRD2AkRWC/v5Y9X+mlXPNI
         4oWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCtFDL8xhjkCAU9u6B+vn/4AS7rUUi8b3bsDsQB90cjDTJY9m6v88KbheRE7wqVjPTqr+vKAq/enLj8g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+eDG9INWXvnPduV4dLgW/92YbndlrRv8ShHpFxuEveArwRp5VQ
	dQ9uOTFO2f73Xx4a09N9etSRN0Fe/720eS3+17vJbNsJp0wTegXAdpPR30W0jOUEgpc=
X-Gm-Gg: AYBFou0zy9yUv/xbmJFs81G7u5dXvH5pgqQ44VrQ8KvYsBgKSpNmvCtbiRfBaoErnJn
	3UoHwAWY3leIKSNlVB4ugw1sc7Ykn16B8QyeaTNDO3hN8xjq8jJAeF9hcXgiM3zMYQwm8s7voRH
	3haELaP/lh/TUPOepeVFC/V3YSEJYSNnTOaqUyNUC4NORSyxUYQRaMyP93i2CylHbjCs0zWAqLC
	b5TUUhsxPPsVs45Wa+AX6S30GwjxlB77gtMY7J6DZ5W65KH+HG6tbIgrW4cvi8WVIRvTABIhj0j
	YhiHr0DUqwpGMsBT+amuCvq4UwQNVcS2o8aKQlbMO1us81hlPJ5xOhs7kwN/nLkCihG+l+uM/56
	MtHtaUB4VRF5LpzkiZRTaNPqwkDz6av40GcWpVO64J36NkupZrUdt2oeJHzSxsq4GHUAhAK2u+v
	ShTUl0lqCvRQQVNWnmjl8llerA6OTSVyoE4Jeo8+c0g0EIet/WlBtPVfUaCV0cGamVpDlrnOe8r
	xk/Ae1J/OQnU35mvzJrWVw2pAfGvi8JNgd6mb1006h79YP9EaWbDNzpIQvno0i35wTugEcpK4Wq
	06cyGwcwhrILn7XRFv0311XzaGdK+RRggwqPysQT4aWbEcw0x9WLbBVufcVm
X-Received: by 2002:a05:6820:c90:b0:70d:7461:973c with SMTP id 006d021491bc7-71700c853ddmr1078198eaf.17.1794082428281;
        Sat, 07 Nov 2026 12:13:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:13:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:43 -0700
Subject: [PATCH 46/58] mtd: rawnand: lpc32xx_slc: retain chip state across
 removal
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-46-0181ef0cc4c8@gmail.com>
References: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
In-Reply-To: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-0-0181ef0cc4c8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
  Brian Norris <computersforpeace@gmail.com>,
  Boris Brezillon <bbrezillon@kernel.org>,
  Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Chen-Yu Tsai <wens@kernel.org>,
  Jernej Skrabec <jernej.skrabec@gmail.com>,
  Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>,
  Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
  Russell King <rmk+kernel@arm.linux.org.uk>,
  David Woodhouse <David.Woodhouse@intel.com>,
  Mike Rapoport <rppt@kernel.org>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,
  Christophe Kerello <christophe.kerello@st.com>,
  Jason Roberts <jason.e.roberts@intel.com>,
  Michal Simek <michal.simek@amd.com>,
  Boris Brezillon <boris.brezillon@collabora.com>,
  Mason Yang <masonccyang@mxic.com.tw>,
  Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
  Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
  Thierry Reding <thierry.reding@kernel.org>,
  Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  Heiko Stuebner <heiko@sntech.de>, Yifeng Zhao <yifeng.zhao@rock-chips.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,
  Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Keguang Zhang <keguang.zhang@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
  Shan-Chun Hung <schung@nuvoton.com>, Frank Li <Frank.Li@nxp.com>,
  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
  Liang Yang <liang.yang@amlogic.com>,
  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
  Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
  Manivannan Sadhasivam <mani@kernel.org>,
  Kamal Dasu <kamal.dasu@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
  Paul Cercueil <paul@crapouillou.net>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,
  Maxim Levitsky <maximlevitsky@gmail.com>, Michael Walle <michael@walle.cc>,
  Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Drain chip operations before releasing DMA and changing the controller
and write-protect signals. Retain the embedded NAND chip and controller
until the final MTD reference releases their metadata.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/lpc32xx_slc.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/lpc32xx_slc.c b/drivers/mtd/nand/raw/lpc32xx_slc.c
index b4d90afa9267..85945e1dd25a 100644
--- a/drivers/mtd/nand/raw/lpc32xx_slc.c
+++ b/drivers/mtd/nand/raw/lpc32xx_slc.c
@@ -817,6 +817,12 @@ static const struct nand_controller_ops lpc32xx_nand_controller_ops = {
 	.attach_chip = lpc32xx_nand_attach_chip,
 };
 
+static void lpc32xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct lpc32xx_nand_host,
+			   nand_chip.legacy.dummy_controller));
+}
+
 /*
  * Probe for NAND controller
  */
@@ -829,9 +835,14 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->nand_chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	res = devm_nand_controller_init(&pdev->dev, chip->controller, lpc32xx_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, &rc);
 	if (IS_ERR(host->io_base))
@@ -915,10 +926,16 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 		goto release_dma;
 
 	mtd->name = "nxp_lpc3220_slc";
-	res = mtd_device_register(mtd, host->ncfg->parts,
-				  host->ncfg->num_parts);
+	res = nand_set_release(chip, NULL);
 	if (res)
 		goto cleanup_nand;
+	res = mtd_device_register(mtd, host->ncfg->parts,
+				  host->ncfg->num_parts);
+	if (res) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	return 0;
 
@@ -944,7 +961,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	dma_release_channel(host->dma_chan);
 
 	/* Force CE high */
@@ -953,6 +970,7 @@ static void lpc32xx_nand_remove(struct platform_device *pdev)
 	writel(tmp, SLC_CTRL(host->io_base));
 
 	lpc32xx_wp_enable(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int lpc32xx_nand_resume(struct platform_device *pdev)

-- 
2.53.0

