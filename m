Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046604;
	b=hcoQNy6sAQGPeghUqTPIIwC9FDikpOODYK9wPThSCYxSikBY81V3V3RRGQPOFck5iQ2S
	 UeYTbi4KIkBT/g6tDLnxWX9bYUfpCUxzlfdMBYlzVH1Fn5qU0tNuB39xXPwH4VxpYQBwL
	 dehHUwHYZUhEhOkF5A1xw95SM9knFgplv0/pLaB4IxbYspzVbh9JncfJj2SzICIvALgog
	 hoh7Dt+VC6w7WFaTv6zOY9r4vfDJvLlignGk82gX1Ko5c3583/rviGfdxW9xK+waTNusP
	 eh67YnIsqZBjPrT0TxMABFXlT5zyG5EE98e8cLu5dg2qwVh7h5OKQXG9Xn0jlxh7LMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
	b=YMWg8R6A0QrTCT85wos36pF2RZTjZfqa7+1AEtn47SFEWKebUjAlPOeEROMV2LZW9u7Z
	 JKFLo7PLohI4N42MxEw8DiDOmZmnEAQyvNY79/RBL8LphwmD9ETepaS1N7I8TT6p1BNlQ
	 bKwu8AacOobsvU/ZNAIPlHelQRNBWNsXIa2X3uarvTJOqLKlrSzmyolVz5MIAG2InKpkO
	 7bLrai7G7uo5qGrVV4sc1IST08OjOltmp7MoUUvL03a0zQ7N8n3B2/fCyrpGVBgjvqoMy
	 Z5K8nIrVVIqOp5AXUQnoovRs7JjKqCYdXgqomtabvHHZQWtJ36EuzYplf0Ow8dKGwZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSXtP4uW;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FFD606EEBB
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 10:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FFD606EEBB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qSXtP4uW
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-84e513877a3so369790a34.0
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 02:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046602; x=1794651402; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=qSXtP4uW7dR++z1y8mKjJUptWz4JZTgqIxt+bUiwnH3TCex9Eo1wHD7BTQMtDDIJEg
         X9fg8HnXTNCMulWuY6SL2AqRdy6lNtnAxPpAk7u+vbuFDMNBNNKx5tkaXWJDPtXdMgfo
         SmACqFZrygyawf+b6nU5mAQzlJBvaqrN2p7PmuNf/OgA214GRj0INkfvfGRtpHfq+wZh
         hbiKY3wf781kC224AxCiskPzFR7h8HqLvFHHoeRQ6CIOeEpZbgDS1QCeOY1SjrDeAv5a
         fFOe5Hw0ZpoYkQKb4paGd45fBXoWyJUAqmuXXjhracq1CU0AvFNz5+CdW1k0aHYGatxu
         GhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046603; x=1794651403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdpl0vJugGlz+uyTjhhRSpimIDWsRp0py3ymgbcmz+M=;
        b=AkkP4PUGDNB25SGIEF+Fu+alKsjIsetE5c6qvvOEviC9R+Gu54lQzRb0d4UDTbtBku
         uO8+y7uhnnbemMa1OIk8tI8Ke6jY579D1O6bfYLKIdgaqmNs6IG5OaYH17D6bkR1hU+3
         y0MM4nEtCrOGfwY6qUobiRp4UtDAaBH2x6uFlXoKsQfXKpwiBq5YG3wHkb56LspwXh5U
         4gY6Qut1diOkQEupdZOr8k+U/8LI1poCSVrvSe5Io/O99eDp2EMEdkolSbv1i7QZRS2i
         EoCzglHH+cObBLBBMHpygodTidA9PyD/t0XjwuMOv+Pu8BQ2vwfkkKK5P8LOyOr7vick
         krLw==
X-Forwarded-Encrypted: i=1; AKwUvByEPoFzReDOctVXXQcy4XSvVmC72U+I1dstOgJJPSWZ7ryDhT68EIi9ERwPOPbP8mqnpsnEoOL0n4eVVQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+chVXOW11aMud3966076XkQKU7CM3X/poZ7Q8p8sqgvD7fv8z7
	5DSI0fpQ8Ejk5SDjfJRrb/MLEofFDy+6QYt6QPeQvoFW+kszjeUNExhu
X-Gm-Gg: AYBFou2yXheAUzxsGrJbrtmav/021K9mf+mFZNbt56uSDk5uwqEa1CWyP3T2PFYwMyA
	sXVCbnZZM745aSKGBb/+UJmX+BD0in+XiwP4q7FN89zvREtxGsNQyvmJsGCHaBdE9mXopIX0mrg
	5sDJ5ikn9OTRR5qgYGxjjmN/yJzzjEfV8jPP2RKzmPpfZeZ36uZC1nF6kmeYdM/cUxF9mZpIWlU
	kO1qra8kEzsFpajoaPWFvDnmLSo0ZHfVLbpXWi/NBgb0u6JwIQfBAbLvHStDt7sFzQYuUeaJ5vV
	IT+uCxe9oCFJ3jbcHbe9MLy/Dc6VivYrz+s3xxmZwla0zu0ZLi7USuBnxMUrfgR6B5pBiHH6Ovj
	pff6nlXw/rGTf+aegvumanlfPtX5i4PW3Q++pesF9xtEGfAjkpznCOj/3aLN5Yan/XlqI7+6zjx
	Ne8EhIw0McQAKygPiIJd9L6pnt3xdX7z/MK9SYATh8Rvar+IRdkYTt3+cbMScjmif9z/mgvhnU7
	SjhO43H0r/K7tQJjc2OnR2vuGUJKSf2zyJLqwXGQzT6SRliwd7F0BUCCzoFRsRP3DOVh2kw4wDH
	WH31BZzuSisjQhPmR8PO+1oUXA2wNfpyDDmWafdBkuHlVgO5rGvcsvhPU4UoTbJN4vqNMpplsUC
	du1+DewKrkXprvfvUzWXqTQGNKU+q0ykXbgiUjGJEREKnroJrdc8vtMcnkMrRJiajg80XkdC8AF
	ZS9AfaXlLSl+xvF5qflcru0IZzF08X+5fKBUd129WLn3OcCVsQMnNgf8SNKDoKdcBjFGITrhB+4
	Q==
X-Received: by 2002:a05:6830:314f:b0:823:e626:277e with SMTP id 46e09a7af769-85f3419d333mr1085835a34.4.1794046602585;
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbef224sm3990269a34.12.2026.11.07.02.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:16:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:03 -0700
Subject: [PATCH 06/58] mtd: rawnand: macronix: serialize OTP access with
 NAND operations
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-6-0181ef0cc4c8@gmail.com>
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

The Macronix OTP callbacks select a target and issue feature and page
commands without taking the chip or controller locks. A retained OTP
handle can therefore issue commands after controller disconnection, and
normal NAND I/O can also interfere with the temporary OTP mode.

Take the common NAND operation locks around the entire OTP transaction,
including restoring normal mode. This also rejects operations on a
disconnected chip and waits for suspended chips using the normal NAND
rules.

Fixes: e87161321a40 ("mtd: rawnand: macronix: OTP access for MX30LFxG18AC")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_macronix.c | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index b8b29341b88c..dcd9536da449 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,6 +81,8 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
+int nand_get_device(struct nand_chip *chip);
+void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
 int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8f7d2571e8d9..2667faf02a91 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -207,7 +207,7 @@ EXPORT_SYMBOL_GPL(nand_deselect_target);
  *
  * Release chip lock and wake up anyone waiting on the device.
  */
-static void nand_release_device(struct nand_chip *chip)
+void nand_release_device(struct nand_chip *chip)
 {
 	/* Release the controller and the chip */
 	mutex_unlock(&chip->controller->lock);
@@ -336,7 +336,7 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-static int nand_get_device(struct nand_chip *chip)
+int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 03237310852c..1ffe2fc4943e 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,6 +380,9 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
+	ret = nand_get_device(nand);
+	if (ret)
+		return ret;
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
@@ -426,6 +429,7 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 			write ? "write" : "read");
 
 	nand_deselect_target(nand);
+	nand_release_device(nand);
 
 	return ret;
 }

-- 
2.53.0

