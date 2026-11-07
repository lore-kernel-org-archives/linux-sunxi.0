Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046643;
	b=NnOG8a36iXJ+7rwU3N6RVf/lADq8iE6uEjEfFOb+bJ7XfEWl0/2laT1Cd6h5rKp7tQO7
	 UdOQYmt7KzBlH1PbLhlH4BiKEilO69yu9idrLURqtBQWhTb7Tqr+ATKB5sF5FO+KCGybu
	 dvrRiRsszWwsqb+8FLJP9AvOqb5K6R1zCUdeCFYoitsbrY/sh+L3UGhMiL2vPIm9yDxMt
	 ie5xiNyogJpkZuJr0sFujxrWrqPYNWPeheWN0dVWRgcfV6YlG8VZ6IAx56CVX4/6SyT2W
	 gcsjQ4Fj7eW9+m79EyaS1AdrhM+oZM5wrsfmgdOvNpWpO3/N61m3SyknnyhU6e8DgqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
	b=kc/iLc0oWZFECFS+bGheVN70D7/y8PmJ/jaQMgz1cLk6p0nf1ZD68ilg1RcMV3PQhAEl
	 yWfiFtBL7z96sC670F+ZSjLL1+H7oQlrslSHyMgCZ+EY4Z1WWwZdg8WCij3PUurQtDG1x
	 aLdwge+yaQLZAeQa+ZWvOUkwn2OFXx22qBhv3PmBnBA3ljaYzjgOQuvcl3YltffKWI1nG
	 Rgm50JIY5/uDLa6pCmMf7iVZmnlXPVtNJ2wsBVuOmcoIEFwbHYeiRZUwIj1VObepPjRnH
	 Fx7jIBxu0QIE4tde2xUABf3GiP+JkPqW4KCexqd9lcQTeQMAlZl6ElJPY8o8JRD901Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TaiVq/mI";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF301606EEBF
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF301606EEBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TaiVq/mI
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8241a56cd70so993950a34.3
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046642; x=1794651442; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=TaiVq/mIPAg6+Jyd108oR2pAFJDfk4HuUEeSWrolZPSZ5cea0tFfaKPA50b8W8gDQR
         4ZGe2V34H/YR0BIuYT6fUwxmjO4DzPFxcMAXkZvXKtKH7auFEKyZTtwPs98KDdA1oqco
         8E9NOBNVc8+NeR2pnY0k5Ic7sJoW4g7UZcM6EeHCQuF0Xv2DQfpaA3uHB6Dz1vkYLS+D
         iqYJfIuiW0oDI4LKWPpNEvIblmf01mrg1yxVWnNU91NLGhicRAezZbVa2lrriuUtnpSp
         UGZgfZhiLQmNPERIdSCSpO3RZGAWJoIg1pTT+OgqRrybURITQ5DmxkkLgx7yjNyPRoJE
         U0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046642; x=1794651442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98WfkaBe62oy8EQO4YfBFKlZx62rcetVL3VyED26UPM=;
        b=NAwKA+oJ9Vp/5XM6OZHSZF4Y/r/nyAbdo5firiQLSrZzV1SfwEO3edL8stgaYD1DPx
         psIEIJiKYS52M+grqDSoZosyNysVy+V0xCzzWwtExkw+/FWmbncXYlEgxDkgF8DUw6R8
         pi+hogF9IOaoEIbAO7YOp47o4rz6PSshOmzeBr9oPKpdhcBV+Wqo46TWGSm1kYGa/gbu
         a/aKbpyHxZMC/dfaxnBENaFEU4OQy8RsEnlRECA98KD24N70acq1xjV/gy4pK2MF2bt9
         z/ZUarrI1IBYm63sUqzxs/wWnMQ1ZXLhnIToihzS96ZOJiz9x9vv5VeC+IKxCGs/afkb
         JLRQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/gjIYRDg/FFPq52R6Nnwx3+bVduCysZAAt9QSNyYQoL92FKBysVgMG3VQhSCmOSMZ9EKSEq3tv50fNA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/QOuUZPcSIKJ5VZ+OfRXvGVFaYtOs8vivSJRKZC5Ht+4Zl9TJ7
	S+dyics+vcAUvMRXQY+LNGztiOvx6Q2+rqwF6UrMZDm9wUicQwVo+NJJ
X-Gm-Gg: AYBFou0AV21wPxyfDVhVfVZaXZB6nktvtAMRNeidf7Vtj+LPh++L8p3L0NrUvQzLow6
	ZOgD9MBK+hy55FNPQcok3S2fNfvHFhUdR0leaqwyKCrQBOg07Blxu2RY6d52YODE1+zvw79DJoI
	og2yPfLFaOExNwPc3kvQHtJzrGjMyDvCygADmIP/YHiy0KYHM1xM+3t42TsK+NlE3Pa4ie6CgwS
	toUm94OYjHUA/O/DAA7fg2+jyki7Qg9/qiYfU4J0QKe/MJi6l/b2o0v20ffCd34lygHy+/IjEn2
	//zBouhsq44PJP7qDuH/3DAgzhzX5pquv4k46xLML8CoaVgkzk3Xinc4ivsFMi6Ur5zDSUmxrZM
	klp8aS3dcO28ivSww3f3UejtBsdjfL64Bydvdlpom5p7XRao7jNMcfXkAuH31NA8m/n6s+ag5HL
	sQVVQbX9mm1IBzR/fFvR6bopZrXxGbT3ZM4Kr4u41ouwSyQnpXSr3anm7cc7OgD8z4pAayGjSjS
	SYfee1H+0gC307reAFxfazKTLIHYU+xitN5RoLyULTiLZmDo/nzXwSwmcBroDLyyblHGrVq6UUk
	7GZUUxrlJmRG7hGb0Puxnmdy27ciRV1oo+nSFIokQyuPSO4AgOYr42DS/iIRYFHhAeFvz0pd04C
	T1H6GuwINvsTZw8zZwhGfJlEbQv27NjuRh0kx2IonTWpJ/LlOB8YTKJOFan87H3/FN7939d31Jd
	VadjD1BE+Y4gd/Tsc5qUVRmbScT6DRXS3HpsmDUFI0zSxdAD2Tglkt2HPqlePpE2riTtlTQgrQR
	A==
X-Received: by 2002:a05:6830:258f:b0:85f:33c2:c863 with SMTP id 46e09a7af769-85f33c2f865mr1221076a34.14.1794046641843;
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:17 -0700
Subject: [PATCH 20/58] mtd: rawnand: socrates: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-20-0181ef0cc4c8@gmail.com>
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

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Drain operations before unmapping the FPGA registers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 668584683ce5..508e3afac4f2 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -134,6 +134,11 @@ static const struct nand_controller_ops socrates_ops = {
 /*
  * Probe for the NAND device.
  */
+static void socrates_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct socrates_nand_host, controller));
+}
+
 static int socrates_nand_probe(struct platform_device *ofdev)
 {
 	struct socrates_nand_host *host;
@@ -142,9 +147,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, socrates_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +164,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +195,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_release(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +223,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0

