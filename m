Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794082465;
	b=QxZN08aTOhKGUE/b1ukHmGi8cltOiHCHcS0o1ClLfBl6/+kqG2HpvAQb0CE8l/BgUW5R
	 RmL8yZmDFzetQBjjk/+ZKR9r4WOp2bgi74R7ZMw5q0Nc4qtBWwXj8xDRUnyX3rL7k4u2T
	 Hu1pT2vxkyqUzdvXyXurjq61uPBCBiZAyZWC4oQykvJ8W/bycJerG8ls7zP4TlJpzebRq
	 OlzpqEIyMpcsukp1gDlfFo2BuX0tTLPyZDlcTcci4Ck/PYOlQW4NCiUYQKHAcURUwnp7U
	 m/fINXdJD/gv10Df+oLpcbRIOuNLmJPh2mGDFtKbNimwnfdTRom2fN6HvvuVnKK4Lag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794082465;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
	b=NBiDFlE/Ew/FOpKttNYyF2dFdney5oZ5ZMK2xtcU1MA1XNuynoe9kUSYGEjgDaYMkwoa
	 vs3ccvp4xghsOFEyQNbNIUWAQRwvbakpRnNLlqAHxXh9/kbpC4QMcPOFC2B6TOCFHe9vT
	 QNm85+zIM37V0N0sYoVk98IkQFgGjEMK9dpwDoTtFrmlr4H4110khZcUZJ029ktrp6wNg
	 Qr9TNvuzG4A411bS4v+dlj9OQIo12vw4ZLRfjDevSZ9r9Htau0MSPj5+LtSp3XEfvwGeI
	 H2t+7ysj1C8eQYyuToc1pNhU/9V3hzLeqszbri0rbmzlr5YDkwUWUSQV8ezSrtJLBBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=upstreamdata.ca;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E96660A263D
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Nov 2026 20:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E96660A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=upstreamdata.ca
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-705cb6cedd5so377482eaf.1
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Nov 2026 12:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794082463; x=1794687263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
        b=iHq2Db/wI1BwGf7sVxgTZyWlaiwaQ95IZ1Mleh/s6biwmPE7EJeK/OvJxlrF7zAMM9
         uSmJ0haV/rj9VTUuq+wstLZNTEIBUpfC1dRidXCxks3XbiTwIfZyhmgwrAs6robNX6N6
         C18eT0r1zrdPYyEDF3U9Uu83xAQPVOrKSL8Lqt0/VW5m/1IrsOkvNE1yloOLA9ZBZ0N1
         RgNVR8k/YoXNUkPkWLue/TlscuzZkXCadyEZbo9wLiLvACjFqsarrJDU+5ZhkLum6UwX
         iQLksA6YnsdNfZZuh0BhgX490ywdurJSHqpAgKnsIWnZ0m8p3jwdFzN5uIaypE9+0Zeq
         AJ7A==
X-Forwarded-Encrypted: i=1; AKwUvBwL/4jxYn67P7UVjtuhdpatEfxFuuLVsD0319J4DbQFsYHibhBldmZkK3RKSGD7X++aME7LEcEVoP0BvQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZXXuL19P1aHSjqcGrDuLmVBMWGV3Im4E+pZ+UI7TrLUB02J0P
	H547nGxUGpNhvwyZIcq9cdzvVBmejuLAGAKDhcqXJUxJMZi4iloRWbqNURVKQ220pBg=
X-Gm-Gg: AYBFou3KgvS5RdlNYLI6cYOSl/W8eRDN1d+QhU4Y4h/VScg3BsbtZHvQjWOlkBM1DBK
	HofaooGs4oUpW73MkI0lyuVolf0rlDoSZq5TVjLnGDQa5H+8DqdAn001UYaS+SHYors7VG3YqQF
	gB/0ohpq1hqR9XIrK+yTcBkiOvRvPR4wa9dJ/2iuSTV1oyW8Adfwqb6fBQbuGH/7mjY5+vy4HIk
	BQEeoRoiXkAGEBZB2Tb//0iAzAxBY+AAekSFIKE4tDoHwokssvFnknECAStqAvkde8EEQ/VIz5t
	jVllpk9cLLeTbXJv5JQTAH5/UKkyo44Dndh6dgxusUxwr8kGCvABIt5p4zk9TwMfJ56lVG7TshM
	ZDZVi5+VxCWZZFGIU3SYtJIhhBBT616mXaDOkTkfyRzjv86/2USp7Lf66mbL4QoIdD33llwUHu3
	u453Y2EpDw5tWilvun2cgnrvvNsfneY8EyrhzzaZXSeqHlibl9mJxwSFRhkH2606s8I0MPsnyUd
	gk0TQqZsUmE+0tZrHnmqIUqZB5o+XrYVy6d4HyqMSm6pYK00S2ugeNO3h40mMoQcFIohrdS44xE
	YYH+GWtGVeATN9/FtB+ICWCKBCYnxBpEbStgT1/e1fOjJFxHrNJwlhfn66v8
X-Received: by 2002:a05:6820:4cca:b0:6df:ac2e:85ae with SMTP id 006d021491bc7-71700c8606emr1101384eaf.14.1794082463049;
        Sat, 07 Nov 2026 12:14:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade68aa561sm226096fac.5.2026.11.07.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 12:14:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 07 Nov 2026 03:16:55 -0700
Subject: [PATCH 58/58] mtd: rawnand: diskonchip: retain chip state across
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
Message-Id: <20261107-submit-rawnand-retained-handle-lifetime-v1-v1-58-0181ef0cc4c8@gmail.com>
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

MTD device references may outlive unregistration during module removal.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..a4338b51b49d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1296,6 +1296,11 @@ static const struct nand_controller_ops doc2001plus_ops = {
 	.attach_chip = doc200x_attach_chip,
 };
 
+static void doc_chip_release(struct nand_chip *chip)
+{
+	kfree(chip);
+}
+
 static int __init doc_probe(unsigned long physadr)
 {
 	struct nand_chip *nand = NULL;
@@ -1494,13 +1499,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_release(nand, doc_chip_release);
 	if (ret) {
 		nand_cleanup(nand);
 		goto fail;
 	}
 
+	ret = doc->late_init(mtd);
+	if (ret) {
+		nand_disconnect(nand);
+		free_rs(doc->rs_decoder);
+		iounmap(virtadr);
+		mtd_put_master(mtd);
+		goto error_ioremap;
+	}
+
 	/* Success! */
 	doclist = mtd;
 	return 0;
@@ -1535,11 +1548,11 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
 		iounmap(doc->virtadr);
 		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		free_rs(doc->rs_decoder);
-		kfree(nand);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

