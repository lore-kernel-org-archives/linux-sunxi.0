Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046626;
	b=3ErrlIEeIG4f8SIQWk7IsUm80HJ5rtmFofe65XVbCKDzoLTL8K2UqmS6do83DQ0p+F0h
	 FHppr+z/dJOJAmymqeFysSgzQE8nRvkmyW2EshTw8cijabYTCCVqnqhJzfZW7AcVVKwWP
	 L27AsZasTQGw/n1wDILmOJbuQ2OysMuWElEI9NzrNDV1U4yp1Oc4uTt6m4L9CXisPQG6x
	 g874pSGfkCgasRofD8hq85p52cBnuEoiATSp/GD+z0AN+4SjlsGD86HW2l/Zqlqh6zXLf
	 NzFI7ZBhUWrd/Gi6G5omdNgwUNB73fKcuWNx1JIQuWeWY13VrilzJUXuVhLu8QSUq6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
	b=FQyCIujEtfXUMtj7qEnfqNkNluSlOnkinLBK/qIAAhtiQgv4MmqeUCAK3nEsCS9jZe7k
	 LT4lMOLP5I5YGAF1dvZZR6Aiorr9pqO11LDmfSULYnn/87h/jpX3TDXmb/V9mPvwwC0+a
	 IPgrVYmo+ja3x+g/pl4vFf2S140G0b1zwEHxTzQP+hXK6AXldOkfhve0zQYP5B0kUNpHh
	 M+LCbKDVHaV/lPQNgmCiA2/A4YRpaAlWHgbTZEvwJNEo+WJ+2S0WWl49LbrVq7SVrz4Vb
	 vOuPoiLE4cLM3Ew7XYKeJDV6c3GujTZF9DV2BBFpUVHWNfY9WTgVM0vFq3KpMIEXlVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kjjrElTQ;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B8860A380A
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B8860A380A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kjjrElTQ
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-843cf077f10so2137966a34.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046625; x=1794651425; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=kjjrElTQ3cd4g5m3xJZHhVrQvIp/2dR+YV/6c5szKistAnTWeGGW26prgsovzKrdd0
         M04yIWYL75uWuTlUKDgvdg/fDV/wtHBVHBuweCdqOU6xGUiThvy3tGGZeqBIvGZtrKd2
         ycWay0MzZmryMFOxGWSopgElNoMgkLKMLVA1P7znzIHVTR7CiMzvX3TJxpav1nMXup6z
         X5t/Fm0CtYdNkVlmHfmYJPPELbpNK1qv13XsipnT5VjWoVP6wIqakqRK8V3p5e/27Kea
         hBv5e7X56HLB7DIuPTYZN/pa41HOxMWwRL+R6sKepObYBLSUNrpS0PrmMqnkAgkeEq6U
         OP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046625; x=1794651425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSLRQn3nJAr2hF1oaNjj9xTWKwIvsqTVkRqHh/k0qb8=;
        b=bEpfxCYIhBKn9XxC56aOPdnCD0nsifdJRwi6DxzpodVNs9aDQQhZojlSVdofIlPlZ+
         2CGaRNQnkq+Gqp4ZmSEBPWPAEBqqNguGsPa8CKNswlQoL1FoFk/EwRIu7z1v0p79w3re
         +olP9VKdrWl9ym1mMPwvPiKuZxDzZnf48gg2No2aWND/G0+SNcxuT33r5MLzLmwR+Lkx
         K3nHr2gts1t0Ng1daFTj64ot7IRiCVXl0mHAAeRDfaD4WB3qaUFCjUReN7aFelRG6nyJ
         totr4gbKB2xiGETDGWDa3bfAJdnyxPHILWLap5Fw6kRyb6w+FycenxEE5GT9Y2qQ+zIA
         mHTQ==
X-Forwarded-Encrypted: i=1; AKwUvByC4s5RB+aSg8KIWfM353PsA3dycWQJnK5MGs9iFryDElr7ibQvNkCJ0ubblmYj13EIqwnbZ2aVjR1vzA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Yp5dK9taAgmXlekrE1M+VJXQPwM3a2kG3Oa6lB5lXrN1torWo
	djAAveQfeX9TbbMCM9YwN/yJDw+PHWQBTp8hgqSyW0x24UZqngkNMrYn
X-Gm-Gg: AYBFou0v2q77BKKX1iK7Mer+zOso+xliBormsejnu8tuN5z3jUxq2LjPFH0R9Qpfisp
	FDU9jLO+cVgosu1pDTpNPBwAXifPNGCgokuppt6zAWCwWFEq+zJMmE5qf4qZu0SqbVzu/F9/v+l
	IwSeJAzcZE9aYRel3roOCd7RNZGgeWuaGB+g4Yudyxn2hwwQPPpV2bwIf263S7FDJmyT+FxbOEm
	XgO6mSm/LUt3HmgUzwrVFT3ioJ5aLO9dOMC1PGFcM9GiHTV5J6NJFOREzAzT2ZdDS09ZKDcqzRt
	hbq1fxy9v9RdGMs8878RkQlPYlvhUwADX05hlXv7du2QlEG0DPPmYyCSmvhYAZKazdWxZBbTGiF
	RQ/d/4o8CUYyeSE98jraTc97OEHsBhLmicQTOQptUg2zPz5F3v9lyCvMRhkD1aTAtS8qTkeXDnH
	pHwqcv/G/SSmZ2DnrnOuZTklmnf0xDETGbJs2j3SvTmUCwAYv6F6fVSPUu3xr7LKJgSZN6Jztmb
	k9DCXyNervvbJ9nlZRG55v5+3NbTM5u1ZZzC6XSL/2Z2QS8WfExu6cLvVDVYmkbKDpJKrA7bYc/
	b+CsyQaDwOHJzf/+WlcHQQ0zM62f3Iv5g/g1SWu3QqfFWN7n8SCi+6JEmKBeS9CYAVhj+rposP9
	ATycXTcvTT8Tkg913e5sZErslYiQp3W37MUkAeIRS9pkF4uM9Pbh0a9bKpCcRiP/WG+gcxKfVH9
	Hn2hHL/njdt4G70N/+kOy3xt3S6weZLrFA2cFRzNpkMXmjpO6WU6R3
X-Received: by 2002:a05:6830:4ac6:b0:81c:a6c8:8a65 with SMTP id 46e09a7af769-85f1d0d0beamr4517941a34.25.1794046624830;
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:11 -0700
Subject: [PATCH 14/58] mtd: rawnand: intel: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-14-0181ef0cc4c8@gmail.com>
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

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 477a427dac1f..e4a24e69ebbc 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -573,6 +573,11 @@ static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
 		dma_release_channel(ebu_host->dma_tx);
 }
 
+static void ebu_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ebu_nand_controller, controller));
+}
+
 static int ebu_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -585,12 +590,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_nand_release);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +699,15 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cleanup_dma;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -715,9 +728,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0

