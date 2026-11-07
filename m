Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082458;
	b=1DWmJ53ckiq6rkVUtZadLarHUW61OXdvM2K3tTuWPippop0tpYfBJB36CssJChAU8m5e
	 2F/4xqbwi9wS+DyMDsjYqpts/6AMwdv2x9Ssp0CNPqc0hDhCrJXwB70O9CC0KuQkWmERS
	 W5zDo887HUuSyQXW0HOZtNMHLNas0ZC8BArmP0MRbthK6iZRFEdS+l9rw+udwmVCJ/3sY
	 InhXTXyYCEPhPIfopam3ccR8StAaK1ROLuLtpr4JSW4fSQfNbqwo9xm0O/RAchia3v22v
	 7M/mXJ0seCxpBU2LITR+4c+rSF4WlULaxLK8z42m1JhujErp3NMSmku7c1ovu2ZN/ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082458;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=;
	b=cDnN9MDP9GxBEciD6ntCmtMwM315M1RI4pipdl+1UrEtXyZUrobC0ZuBiq0nlgHjyCvb
	 5b/ojKSmqz6MhsBuTZp161ox4ZFH3X8wuf/Lu4E/E1VPqRX03kYeWPJBKvo8WtPuXHfE+
	 YQ72dtjZEWqx0v8H+33BVE5075RUZlDNiWOonrVgy48lSmNUvoJHMl/v+bfG8/LJh6rMb
	 r0ecEn3knsq4fT9Vn+OY7Spwqx/KZk7Lj0zo3m2fCBgYVh4tD6Lgfkx2UbhAzCFGy3vAn
	 KZHq2SS2AmQI/O9ihbAD+5BfsqL+Pdjzgq+hY/4QnwhC2LvQVpOXULRqphHBBsqLV/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F096082BFA
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F096082BFA
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4ad587ba293so9273fac.0
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082457; x=1794687257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtFKBRAqbAaZtxAu1Nw6aaS7lLmmzcUOPw2XCvAi+f0=;
        b=HzhfiLP2plFsdUH6PMgoOPvqnee/pmlm8I5E1zdeTcu5zCE3WyQoY+U6lLfScxfYOl
         XeXtn6An8iqVNgBy9chS9MxVPXxNJ6qNHhHgEJpSYti0DzFbx3vtAoeu9Gu9rPjhYSKZ
         P4FTOxh8DPUAgs0GVAip5im3CLMVoDhOKkUdl25ENd/WRVYt2ouulHGmhG7HUPJASRQP
         72DH0VCM63wVpmeBLYLAgcU5MX+5k0wvdMV7bAMP3XEW5RLBGClkKKb1sMpK52Yw0/jU
         g3WAwYCNEQvH97nTSSzY/T+Ln22qKhIuwLWe2VeCFUYubigERTxsWoCmbTKOG+W0kjqq
         2JXQ==
X-Forwarded-Encrypted: i=1; AL+hErG6W5uTM3Zk+7NNR/TOCeWQGkk8lpKA9qUVCO09UI8cYGf08/ibCHYSo4gb9IkMIph85FSgkAQJSNe3cQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z88SexRoQ/x0TU2tt6W/eNW2PSa73Om6lRaoVLn6pTBOr3JPxtW
	d5Xa6iFy8YkO+TTUHvkFYkKbg5AqGWuI6wYjTQx2OgEaTrsZFZ8Ed2tuydnoJHjSxFg=
X-Gm-Gg: AYBFou01V6zDXiDddE4UTw3wV2GdIhZfi5FRqBqfpdknJis6qsNkeYJ+WAoJKzVDzdP
	fdVvzA8gXdh8nTSUWAGG6JkzuzP8OTD2C/kSfeenoAjAjq6DJoaQhyGdaGehia/edg5uEDeKsvL
	o1TuxXhft0bhEOGP9+KctGT8ZYW9lXQ75Hfocbd0OniHvrCbVgMDwZ0mg/tliGucZk1FdhRGp4U
	OcMV9lGkwmUTgHZOBHo+rGhiNFOZ6W2y4hTxNpwbWdn6V/42663o3B3VDn71oX3oEwf6mVatgDr
	BSHrzTW1IoLkIXU0EVDXMe5dpSmS6Cd/BwC19MZy42Dd+gmzdP9InkvIkp7yVzwP3j2r/A2sQ6I
	G/5gdJBjatr7egXOff0WsrK3HodRSmKkYH8+l5YtmnOFkXc4Ru5s0SiGtpac7txdIpqEx6Yf8cL
	HgcEL/n09L9xHGnSdpxZZHi6b7Byk9mXzrBNdSHpICuaJ4QQ9q+sO+Czkz/+7NwXMqviqIZXVy3
	Btnmts1s0WrU6gJylzhw/bx8KOB4FUk1/UDJ4dGvRLlDfujDJXKNwTu+etuN3aYeEG0AH+iGYxh
	JIyAI9rvFqRWhgdl1ksYAYMO6usK8FdJUNI9/Kqa1VwV4VZxb1kt+o82GgB4xdXmMkcOaxP1Y/f
	iGOOYng==
X-Received: by 2002:a05:6871:438b:b0:4ad:73bd:91b3 with SMTP id 586e51a60fabf-4ad98aab859mr3931286fac.9.1794082457245;
        Sat, 07 Nov 2026 12:14:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:53 -0700
Subject: [PATCH 56/58] mtd: rawnand: nandsim: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-56-0181ef0cc4c8@gmail.com>
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

MTD device references can outlive device unregistration even when no
open file pins the simulator module. Disconnect before freeing the
simulated media, and retain the chip metadata until the final MTD put.
The lifetime core waits for remaining device references during module
unload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..39fefd83cd85 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2253,6 +2253,11 @@ static const struct nand_controller_ops ns_controller_ops = {
 	.exec_op = ns_exec_op,
 };
 
+static void ns_chip_release(struct nand_chip *chip)
+{
+	kfree(nand_get_controller_data(chip));
+}
+
 /*
  * Module initialization function
  */
@@ -2262,6 +2267,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2376,6 +2382,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_release(chip, ns_chip_release);
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2391,11 +2401,16 @@ static int __init ns_init_module(void)
 unregister_mtd:
 	WARN_ON(mtd_device_unregister(nsmtd));
 free_ns_object:
+	if (retained)
+		nand_disconnect(chip);
 	ns_free(ns);
 free_ebw:
 	kfree(erase_block_wear);
 cleanup_nand:
-	nand_cleanup(chip);
+	if (retained)
+		mtd_put_master(nsmtd);
+	else
+		nand_cleanup(chip);
 free_gp_list:
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2412,7 +2427,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2430,9 +2446,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2449,7 +2465,7 @@ static void __exit ns_cleanup_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 
-	kfree(ns);
+	mtd_put_master(nsmtd);
 }
 
 module_exit(ns_cleanup_module);

-- 
2.53.0

