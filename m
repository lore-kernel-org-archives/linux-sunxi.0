Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046615;
	b=1k54JOiKrgBORNoFXeNQoapJHY6ZO+qYaRls6yXp8j0xjOfTbPLAUh0Ge1p1q3T5UKJ9
	 V7+zj1PLXch7p5lI/q9tuwAZePrdeGet2ZNOJFM1Ch5dESarbMt6o0LQoTnRDTcHS/MWP
	 UAGX6tVM5OKAdwKY5WCTRzd/CE15jqxq4RPbJrxkCqf/zjJ8DXY3hytqC8lS1B3CoHfh0
	 Cfag/M495ZEHe0sEkDrzVODwORYYnDveQEdOU5ypHc2panx+M/drjgLWL67i8WcBlS4SI
	 elBODF8Wa2sFK1XSqXpF+/6VpeXom9HTBW+Neo8OAhBgpM0HziqQdx4sh27SgD/xy/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
	b=3wv40oGAiddwx48LG4kmYQY2OJWaV0T8Hh5ntIVzJHj0IqmeQdiwve0jggIA4E7sQvmi
	 ET3eJBsWwmO2BTTT8v4mvC6GHCj++XJSxrsC+LZtAHuyH5hmbyBhNcldv5kYI83QH+zqh
	 XvMjrMGzH2RalMzq2ytXeptTn7wW/tN4IlWYdPbLc82isA8CvF/1znO3Xhz4Dg4jXEnDO
	 S0WdgbQ/rGItVlAt4NvGLAsq/XqrzpMpS6AABkjACARbVjR/QTdoP3AX1ngZgZqUmigew
	 et0H/KbQaxSjMftOz1imf/qNT5ddlNlb1yNUEE/aPYm/Hb1xr8T8HFJlfOZgY3jvvMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1t7a8aW;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74A26083633
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B74A26083633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u1t7a8aW
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-823b938464fso1112623a34.2
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046614; x=1794651414; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=u1t7a8aWnVKP30UzaijU/XEaKbl4KnAgqqL9A83gtpQ56bAz+u7KSw2UrYwRff2x6K
         NLzXIkLn6950cm9zTP6l2xjgrRHs1R7916D8P7z9LaxkgLFcEZiFPxcnrbM3JMavxx58
         C49UongGZLd9+/sbAkCk0VlWmL02G5Ili5RAQGrZUzWR0uvnGGNyJpRz0uEIbk4gfThB
         ljcCXLq05o9u0HooV9oKiSOw+RlhB4nRq1Th+D5ekryzs41VMLZLALm1JmItADekoOkF
         y50iYll84V0VMAElVXyk308WHKoqm12jC7dSWoeBefbwmPFVUgPiQlRvKvPUyoTR8g4j
         FIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046614; x=1794651414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOgljHqd0FWVe1HwSz1vk6dLQKeQBi/kBxtLolOT7n4=;
        b=T1kttExeaa+mst43e43bJ2vjRG/LJf8fWNO0ZeMu1QZ59vNtC9WCnTom6c3ShrCM+6
         sDhYcgMZKhTvzWSHHv6A+A4y/DEER+TcFsCVpn2WpDfZUpR632Otq5+X8eejQf5tVIdq
         z2YNYoRb1HlPadII3z+w632ciCrF2LsemP717trmzBMM1VWfp8RUOTX0/9XIGgy52ryU
         2b0suMI8udhzeB5qTuALUvbtVRol4cjvZ8nB9X/6650dWtmcBo37hx32wB69eLt+L32d
         fbfLuoLXBOPc782J+GX7mTczRrfND1GwolL/tYCIoZUBlT4i7kebL9pRP2wify79qEES
         7Uog==
X-Forwarded-Encrypted: i=1; AKwUvBx4QJqOaeDzdGaw2UF1VjQzznAgKy3mZ0mKxfL5d3qe4sPQr+x1/vdKebmyNTLLGp8vgO6K+EtaEXiThA==@lists.linux.dev
X-Gm-Message-State: APuU4Z95J7lRmH/JmWwyNCqOG3VZVVnzRn6jyLWfXXaYOOZ095dChg77
	7XcZu10yaQ9Xn7liJjCeSxQKoWBbQcOP7bW+ouzUKPMd8HTkyhi+ilkY
X-Gm-Gg: AYBFou1H2Exzgp1LQXQ/eVlyV9462WbSlMESnhuUGNL/edrezFSQkGMOZm/2Gghnjae
	WbvJiXnq4JESP44n60UOqH12L/SAdJdQunEpdR0pu8PJBIkclMfgpRA8nAZluvC6QpZINrN6zUJ
	3IvtJgb6ccnd4PynwG4iz2sOri/RFliHu346cNnNDAX0f2jrXcGv9z95oejz0Fs0/LRAwAIB5C5
	wVTIxg9G4J8ehVPNbWOaDau2gbxWP4VrNfovVZCwE7ag5rHXsoD3JIfXHCMp3fU/ODHrYuE+mlD
	gYR2EdpwGnFIodLdGtKvVuwEw5JL/rl6DyP7AWzrJApetIX4zOZxKKxCCOSXwSuevC93Rs0SrwI
	VMD8+jhD3pppnUhUDT2DFaJ2Zul44NVT0frBiQv0lx3GXEUFR3LXi0ZZ+qDhNT5DjRgNsEFxDWq
	IpPCNIzGLwm3qs1DLFnqgqqrkWElddjKtexmLhElbU6qR2VfEg+dLt4PeXkfwR39HV5HS0rQQa5
	rKqAEq55Ym58Iktpu8Y/WUTVBB+pVWndfYOIzbVQvvijWWfPIiwrJF7GbiTFUwe363Arlm1VgON
	R8Y4K5I920lezJPq183eRR1k1F3h3YL3M082s7FOb//0nChj3NAYhxyjw1XzvsJ0ujE+lTlrcSq
	iUh70ZDwdylndWlFVmB2jfiFtEbCv4DGCUQVHhezl4SvlNf0ptgzVysMRnDyZ1BlN4+rD6hlkgc
	/7HQpx+1ZQxYeAWp6R29wwxfho2ZI00UOhQ79XXITePzwSnL1j8ASm
X-Received: by 2002:a05:6830:640e:b0:814:8259:780c with SMTP id 46e09a7af769-85f1d012c2dmr5221596a34.19.1794046613684;
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:07 -0700
Subject: [PATCH 10/58] mtd: rawnand: stm32_fmc2: retain open-handle state
 on removal
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-10-0181ef0cc4c8@gmail.com>
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
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, 
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

Keep the embedded NAND chip and controller serialization state alive for
MTD references that survive unbind. Disconnect operations before
releasing DMA channels and scatterlists and asserting write protection;
defer NAND metadata cleanup and controller storage release until the
final reference.

Preserve immediate cleanup before publication and use the retained
lifetime after MTD registration has been attempted.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index 9f42f8ab3212..4b89094c89e6 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -1902,6 +1902,11 @@ static int stm32_fmc2_nfc_set_cdev(struct stm32_fmc2_nfc *nfc)
 	return 0;
 }
 
+static void stm32_fmc2_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct stm32_fmc2_nfc, base));
+}
+
 static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1915,12 +1920,14 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	int chip_cs, mem_region, ret, irq;
 	int start_region = 0;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &nfc->base, stm32_fmc2_nfc_release);
+	if (ret)
+		return ret;
 
 	nfc->dev = dev;
-	nand_controller_init(&nfc->base);
 	nfc->base.ops = &stm32_fmc2_nfc_controller_ops;
 
 	nfc->data = of_device_get_match_data(dev);
@@ -2024,9 +2031,15 @@ static int stm32_fmc2_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp_enable;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_wp_enable;
+	}
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2061,7 +2074,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	if (nfc->dma_ecc_ch)
 		dma_release_channel(nfc->dma_ecc_ch);
@@ -2074,6 +2087,7 @@ static void stm32_fmc2_nfc_remove(struct platform_device *pdev)
 	sg_free_table(&nfc->dma_ecc_sg);
 
 	stm32_fmc2_nfc_wp_enable(nand);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int stm32_fmc2_nfc_suspend(struct device *dev)

-- 
2.53.0

