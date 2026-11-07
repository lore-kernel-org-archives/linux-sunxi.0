Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046629;
	b=E0yMkO+De6Vfv4cPFmG3S40XvjQJv/KCl1zl+bI/RrYrMmMVLkc9f/MC805L7rMeFwWq
	 NjkqLAbNBUL2PqAZKOdK/X0kKc+tHiXe3bGBjGTzZtHRNw+SWoSNVyghxDEM/UxBNVPX9
	 CeVET9xEiHL5K5mAk8GUba7H5loDRRyfpdozJYRtXPMS5eIq5KljtdBbi5VEu+6fZkhRw
	 TIVDoUE3Tb/fIn0D8nz4p2waLmRjMUZGD105DVOJ/+DiahMp4Q6B7gOO7IkG+xk45XNOS
	 8V8jRYRUfToEO6s+DyLBBdFkjYlZ4kdUwsJr328cjTvazaJZ1ljhNEBkLqPdkI+x1Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qfP62W4d274H4KIf4XZuVTstlQD2a+OvnHofuZlNZwo=;
	b=5QA+axmlMA5ZLJgrcTbUoMaL7snwwQTJ5v0pd8A3qfdla7JAm3L1eKqT0RGdQk6Awt7M
	 tjFopAkSm9U+CTUlwbiVZj6y2p9tHv4BQ+l9bDUyMl4JlWt6/jTvZqOvA5qG49t4Hadh6
	 vh6s1Sr1OvbdXgM7bk4xLA/bjhUJ14DR4hL4dTLSa+MYJQFr4EVvDPDS4kbNHR9wM6djp
	 rE/wxmK7aKdz/aJicu32wcHVjQm0oe7LhQucJrJLpn8hs1ygX7aNv4XcG7oH0QI9IVXc4
	 Joy8+pwvkTU7dbaLsQwjjvmCE06eDqcc5y5Hqw22Mi4Rqv0Yo+s2hM4fktfHXh8KLnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02p99g1+;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F3960A381A
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F3960A381A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=02p99g1+
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-84a248254f4so881856a34.0
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046628; x=1794651428; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qfP62W4d274H4KIf4XZuVTstlQD2a+OvnHofuZlNZwo=;
        b=02p99g1+vHLb9aVTBKYCVl6q0WhLGOvuT/ngUlBmtwqus8prvZhEqJrBhv9ghr/kTg
         n0YUh5xCPpyQ/VRN6f0bzneaHQYk0iC4II0Fo1y7D4fc2IMf3SYhxDCGU9alXxEa2crb
         i2W/oJ//iC7XB/4xJUZjultlVJX+csYvH1vzUDHTdi9rA5pCiBVEkD7Tab7GPSurDMTI
         9JELan05t2fqkHI/PU5xgHHDsNk8un8oeliIBSY3+Fb4cGz7GGYNiKCPEOLS4KgnkMMe
         XeQ9Tggg8Hq3m8CYEvi58EvVx8vcwMXrye7SnWrConFaD5IZwbq5I3Wm3TNGIwIgQrxo
         PSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046628; x=1794651428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfP62W4d274H4KIf4XZuVTstlQD2a+OvnHofuZlNZwo=;
        b=08R4AX6bkauRjlaAPtKwDjXvqtsryodVmQ3dtf3MxJZNOaE6EC/ej/oXXVSSbjblMQ
         h5rV7cGhjGpqTTQnRz6pfmdZQjdooBlmrmltPfv0I+3G1RA+JCevHBUFK3Eh5nq9nllp
         kjn5a+WwL2comYAzDmLLlPkhWj1X0+TBv6upCInvzWguoSATqc0fBurNWCAysqJ/EM5i
         glP3EbBGRw/K4s95Cumzfs5vGClgoa/GLL+RJWDDLx2r/FsbH9gJuYTaflOS143QC98A
         VlYr1BVRvYWX6//f4YGmn4N8QUVmR2fgbSlC0IBefaf20kQb17a3bF2G2L+2dljPN4zl
         qDUA==
X-Forwarded-Encrypted: i=1; AKwUvBwrj5h4pG8AirVXLBkpkxwndUtg66ydP0VSiXomA3HctT0NScIGxCd8f20l1c7rqNEoEkW5Y6VNzLNp6g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+wwmnmZpRRwF8un92jOLGGhhJc4rnR4aMiN5kz1JeR0jEkI74b
	7eU/bu0zgu2kVtcVTliBkZbjrCLz1hb6/JYB48iNtL/R44i01k9ZNJR4
X-Gm-Gg: AYBFou2WTwl8BuFQia4ZziSjw+TDiDOSAjXSqPpBQjQY6s1qdZlwwkCom8g/JTedn4G
	lTKJeNVbmEHfYJ1jwyhyQagleD2IA7khqNmU//n88hcAi5X5hyZR5/tEU0uewxVFi9Vf3FamKxV
	YNpN4I6Xjaz2x9NGFuvgVl3yeKZeUvmbFW2RzQpPMFPIaHRr3mxe4hI0/zwshetBLeNX7O7FQ3u
	4mXkLvVnVj145GB8T1o7P/EeCyCWge6QS92qF4KnGFHyS4y3giWsv9yEvDPeRcLWWSSY9xuj6T1
	HVeFZws7REJIxCLIP8zY0lrIQKqUpdEh8I2U/1MmqAcxe5AWkMIQEJ5EOnMi6qTUlV0yYrt09Gg
	Br+ySIsGnL2NOoWjbcMnBpKsIk5CsJWfY81uWVdqKNpoIU0GmqgR2oFkB6fVjI2osyi+tLXGcxX
	j2/YfYLTf2jTTS7aTfL2eblCMiq3YHe50gUhixO4fCtUNcwuB93zbFHt69kGY8BSkrYxJ12i5aq
	epyxO31aPUXz4g4v+2ny1//rgI3Kl3NoqqRU1e0mo9AxfJsxdPqO0/w739KRIb7TjXSTyZDXV0U
	QCjYPL0abcce8kY/aIxWepGfyZfVrsyv78F8HA69nIaccjQpYxrNSXOOZre6a92akyugWKwooXm
	oLXb12PEAbArw/qQPMCnuX3LlzyN61unlwLEiADv48vx3D/CMAKbPTy/Ljmr26AWIAByOWkx8jH
	1ARiHB8wxKUNJYJe/ANDb+42NRtZjAVt8u0Ushf7yKhXPFds6Qbz2+
X-Received: by 2002:a05:6830:410e:b0:844:ec25:c7f2 with SMTP id 46e09a7af769-85f1cfdc445mr4024752a34.13.1794046627839;
        Sat, 07 Nov 2026 02:17:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:17:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:12 -0700
Subject: [PATCH 15/58] mtd: rawnand: tegra: retain open-handle state on
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-15-0181ef0cc4c8@gmail.com>
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

Retain the chip and controller allocations until their final MTD
references are released. Disconnect the chip before suspending the
controller so retained handles cannot reach powered-down hardware. Leave
metadata cleanup to the final put, including registration-failure
unwinding.

Fixes: d7d9f8ec77fe ("mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/tegra_nand.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index 7f9eb5f042a7..da7791741b9d 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1064,6 +1064,11 @@ static const struct nand_controller_ops tegra_nand_controller_ops = {
 	.setup_interface = tegra_nand_setup_interface,
 };
 
+static void tegra_nand_chip_release(struct nand_chip *chip)
+{
+	kfree(container_of(chip, struct tegra_nand_chip, chip));
+}
+
 static int tegra_nand_chips_init(struct device *dev,
 				 struct tegra_nand_controller *ctrl)
 {
@@ -1096,7 +1101,7 @@ static int tegra_nand_chips_init(struct device *dev,
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = kzalloc_obj(*nand);
 	if (!nand)
 		return -ENOMEM;
 
@@ -1107,7 +1112,7 @@ static int tegra_nand_chips_init(struct device *dev,
 	if (IS_ERR(nand->wp_gpio)) {
 		ret = PTR_ERR(nand->wp_gpio);
 		dev_err(dev, "Failed to request WP GPIO: %d\n", ret);
-		return ret;
+		goto free_chip;
 	}
 
 	chip = &nand->chip;
@@ -1127,20 +1132,35 @@ static int tegra_nand_chips_init(struct device *dev,
 
 	ret = nand_scan(chip, 1);
 	if (ret)
-		return ret;
+		goto free_chip;
 
 	mtd_ooblayout_ecc(mtd, 0, &nand->ecc);
+	ret = nand_set_release(chip, tegra_nand_chip_release);
+	if (ret) {
+		nand_cleanup(chip);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Failed to register mtd device: %d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	ctrl->chip = chip;
 
 	return 0;
+
+free_chip:
+	kfree(nand);
+	return ret;
+}
+
+static void tegra_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct tegra_nand_controller, controller));
 }
 
 static int tegra_nand_probe(struct platform_device *pdev)
@@ -1149,13 +1169,15 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl;
 	int err = 0;
 
-	ctrl = devm_kzalloc(&pdev->dev, sizeof(*ctrl), GFP_KERNEL);
+	ctrl = kzalloc_obj(*ctrl);
 	if (!ctrl)
 		return -ENOMEM;
+	err = devm_nand_controller_init(&pdev->dev, &ctrl->controller, tegra_nand_release);
+	if (err)
+		return err;
 
 	ctrl->dev = &pdev->dev;
 	platform_set_drvdata(pdev, ctrl);
-	nand_controller_init(&ctrl->controller);
 	ctrl->controller.ops = &tegra_nand_controller_ops;
 
 	ctrl->regs = devm_platform_ioremap_resource(pdev, 0);
@@ -1232,10 +1254,11 @@ static void tegra_nand_remove(struct platform_device *pdev)
 
 	WARN_ON(mtd_device_unregister(mtd));
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
+	mtd_put_master(mtd);
 }
 
 static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)

-- 
2.53.0

