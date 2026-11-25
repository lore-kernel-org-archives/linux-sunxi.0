Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624136;
	b=XjDa8Hrru6kTsfGdHZRQ4UYaEyJQfp82ay0DB5fubFbFqlKIIEmr/yazb56dSEmVeYbM
	 +tX2M+sJkJLvkC7BcXcXht4DW779hQ29AuEYC6XTIE74gbzqyqOJhN22mpBLQ5DXT3abA
	 4CWL/oCIWK5pUlzS30PnkLf1TB0AMTIbL1mZTWRnEQeocRyzJeWC0lrIyZFu7Lpw6Oo/v
	 vLQhJUFG6gijrNvWrO+D8Sb/LXEP2EZ+QbYbSPRAheVy5SSo/ZOsQ8x6f0FI7ZNkgJUDt
	 zlceVhFEdMkw8xok2Kk+JqRwpYGvB+9mXDJeiw3p+5l2XkBWn+xpWixXBEClNvKuzXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/coGxf+TvCt6CYyWE3tU4VBa2tGsxrO7OX/byIc4o4c=;
	b=KVFAr53AdQQaeas+UW+lzm5/QllNMD1OOnv5jDT21yXarDRjg+FUvHIKpQzmU2kEWg0R
	 OWGzgsTGhgD2XxMaiDxz8HJRztHatZnaACeUsL5t5ODnf/gRKnq2imma3egKxCv/OvBsm
	 1/yf4suWUEXOYBzLkoRv8tR9Hp8If7NGP4qt2qm5soTS749aEUKQL1ZNLf9QaFYol+ygg
	 n9KzrKpIHEChWU1zHdrXoVPpZVUNwUB9Db3GEU6cvvWj8odCzWzAH/N/jxZYdHiydtGsy
	 TDyQ2Pg/Y8tuA//TqrLEiCn8hTPjArHlR6sHm1R2yILn7IUflPPZ77MVvujPVwLCnDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PecVXc25;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607C606A338
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 16:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3607C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PecVXc25
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so34881385e9.1
        for <linux-sunxi@lists.linux.dev>; Wed, 25 Nov 2026 08:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624133; x=1796228933; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/coGxf+TvCt6CYyWE3tU4VBa2tGsxrO7OX/byIc4o4c=;
        b=PecVXc25mLldEOuJ69YUtwuxTk4AFTQkr6yytkyzctOH5lmR3u/mxMqQYlv84qSks3
         mRCVyBa7BltMpF6oeFrcLKW26zbw0MVFIjk3aJdno+iV1wh9e97mZbzsmzxACNLQ9kxd
         T/G4ZX2VsUH3p3Z/dzyj6PwpxrhflS336fnJv62MjgOY8zzV3ATAKtjYva+TBpIAGpss
         UnEsrSeGSBpdfKiNvszF7jMLAEn2NvQbxTjxtwcyQbjCiCGA99DPWw+pDYODL+ImseJZ
         yP8xfjfjMuUADpyqL9W9FwF7aK8sjyp1d55PbEQ0lwXcinE1pBUaGMOaGdBIQ63wdTg5
         gWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624133; x=1796228933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/coGxf+TvCt6CYyWE3tU4VBa2tGsxrO7OX/byIc4o4c=;
        b=JRXDb21R2GUemqY0nPOsSshzR+pUDgX76OYmihokhz4Wkg3K8qoKq54Y9u/cfHcfOU
         PQfmeIJWP5Zl81a+px7sYggTowJ7UmiBDFDhop8Xxgv9LHeZB2zxE1ffueE7e6H9ptB+
         lrbLX5u0VWO31+X5wRJkpGblOYnblxpsCXw/Rmt02/fs995yhjpnqPuVGghktiRpkFz6
         wN0mclUuhJuDcwPjYK3OFNJlUfkPF788y+avj5lIXXng/yGg0j0jVYa0aTPxiW6IHNc0
         RSZJsTLT8KsecwaotUz2Alp9Gf+DXOauSo30roduCx7Yh+91j7hXuVesk76JjNKv/iJt
         uzgA==
X-Forwarded-Encrypted: i=1; AL+hErG9DivHp3jEqcRd3M1SLLliNPN4tibT7Z7WGIPzKNMYGydZ1qcnS1p5Hsb0/GF9X2On07NzgCa7M7+New==@lists.linux.dev
X-Gm-Message-State: APuU4Z9I3RCU7BxUjvfNxp9cJfWgFoGI3W7PGZlJceN2lkjT78uNp/V9
	yMyS0B/JGtwIPcf9M4gN555/6n0yXde+8shD3FHLrLmwOs+WUMGnQfuRluokhIlf9cs=
X-Gm-Gg: AZFdTZcMLvpGmdtqova8JqTdwwIu2kPvn4UpRIDRrWmiSKOlk+TF45/vpjI8rN8G4BW
	RWDR+ypgfLHVMIvrlpVyHdVNb404uh0aBYb3t55bY/DNWqnzT6JjYUKlkKryh9VbJQcD0VoTPTg
	hFxhUY7328DCdbKQR16AOUSQde0nR3YGOV6P3oYoGO2lEV5KXKRzyvq+ANAurWl8irx5HXNJtrL
	+bBfdcpP+mMfS+q71Du5j54MI4kzB5hbL6V3BDLwbUtfg5a+8EVphCidSbcggiX5GbVORAeFzPY
	7M1Xs7Recu/5AUeTZnVBglLgEQ/XMnUh2cc16ax696Ux9qAjIcWzRtBdC3Er85aqhk1EYOQrFDT
	GFoYI9bDZzq7pS+H0vrtodrhx01LZpos0cyn6CYiUcCkL2HqCcTHN4E0w5CcUdxTsUdq4iq+hPi
	tIu2Ihe8KlXE6gIMab/rkuE5anw0vbCxyy/nLUZTBAPyOIPp29Dk7uvONN2IwYdQQpOomsC63T+
	NMHI+/cWinAVgl/viGmEppzHJnnFzMXQVhVD0tEsFul07cn9mVCWMBYjlT2o+v8+nMZuKRyzWWU
	Wf6rp+I+Hwwb/KpLwZMyrv61DlIRkSn4JKumfAWmWB6mqw==
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr367217635e9.22.1795624133592;
        Wed, 25 Nov 2026 08:28:53 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:53 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:33 +0000
Subject: [PATCH 07/10] mtd: hyperbus: Unify list terminator for *_device_id
 lists
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
Message-Id: <20261125-acpi-mtd-v1-7-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=1400;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=MqS4iZQmtSnMUE+1CE4BRTfcmZv4r/EuEiyu/lunNWQ=;
 b=RjOJCajFiP9KV73PmMUa7M74MYmvCY+UYchwJ0DItvXMOOEvWaLyZVGGPGplnX/bvY7hOn58V
 ubNzVDoXbvxCV3x0jZyFUwCc4fN8Q5ycQmLU63Q+/GExIGSiHODobkY
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma. This change doesn't introduce any diffs between
pre/post to the compiled binaries of the modified drivers and just aligns
these to the common style with other *_device_id arrays.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/hyperbus/hbmc-am654.c | 2 +-
 drivers/mtd/hyperbus/rpc-if.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index acbcc3b55d86..bac24d9ca02b 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -255,7 +255,7 @@ static const struct of_device_id am654_hbmc_dt_ids[] = {
 	{
 		.compatible = "ti,am654-hbmc",
 	},
-	{ /* end of table */ }
+	{ }
 };
 
 MODULE_DEVICE_TABLE(of, am654_hbmc_dt_ids);
diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index 9eacc9ec7382..a0917f407d7a 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -165,7 +165,7 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 
 static const struct platform_device_id rpc_if_hyperflash_id_table[] = {
 	{ .name = "rpc-if-hyperflash" },
-	{ /* sentinel */ }
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, rpc_if_hyperflash_id_table);
 

-- 
2.53.0

