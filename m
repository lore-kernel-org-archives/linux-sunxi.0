Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904962;
	b=rQIuXxfPNr7DxgawBkMhw6Q0wdx1CnkShgiSdkySBWGTx1w2UPbXZsTdiSvFd7HK+BWJ
	 9CjC1ioVVsYtPcghhYmjagiaWmp2Z2c5uEFY4yvLtCJVB3S/QH8rv0K5OgIP9vsSJKKTQ
	 egiLJ7Kr0TEuz4uSu6IaSoxBySGdb+2T00YF6u/uwYtFUt5UaCF3G3N9q19qhhXKWdHvn
	 n2hA26NnQITqyt4cS352NpsfGzRRNDOsmMJLDH8tStmhKcVdOSoTfvdyg0hMgxsBhuQv1
	 FV66ygSbL5Qxu5A3P5mjbPFiNxvgLpze/d8uLWDVl0PiVqLwF9/I9G+TvcLLMSMRppA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
	b=aye0zNIZ0a5osAgdmS3A7HaQes5+IqmAydHDMaeXsvwXoyTY3GgmSeb2GMXFX8GCelZM
	 a0rYAK994xWk+HsVUuUom1sQBoftxLxOn1VTV6aq2ibNYCm6iGAjevCQmXuhBoUrDXz5M
	 MLSCp8zB32FuYQnTzQEMW2vm+ZCY6ebyvf9rGfbPTJklJI7g1Elf6KcXYbTCADF97OgAs
	 uyzy+Q5aWVSB1qIt1JIYgnpNJ/j/s2aXFb2g7k38rUfsjn5dGIiuhKFy0LQa3aSTgfllv
	 hTolL9FAoD+8VQW+ll3BB7yZP0i6T6UPHkVyzpEaDNOAHguwDxr4pujepHf2r9Y29GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zIRj/E08";
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122A4608360F
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 122A4608360F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zIRj/E08
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d68de53053so1245015eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904960; x=1794509760; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=zIRj/E08pjKn64f3WiWZk5F/KdV1uO7o4wzwaUcaOY9f8oPJRAqrQ+EAusfnTwqcDc
         wD1xljIdCJc7YnwKD2ATfC0IP7VfHAPM0ybK1QmUad1Bpo1w0TIPe70eMJo2bQeztHIU
         1Ox+vh6jvjOcDqJAhqcvDaVYLLZK2bXjTJ4VmSm3lpm08OFfpuDHuYtwzqVChVvP9Sgj
         NgS5kz881bo1wWHx6/+1OGy2OX43KkwwjZOaqn362Pf0SwJSBRjR5yLBIMjtHPkSRShj
         a3lepH3v+oP395J02uJikvs44Wggp6W/2guYHgN9gJ2DyFnvY5qJYcGDdcrUBqPAVtLX
         cUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904960; x=1794509760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=j8GktFUVz6B6RuhsMbaDm9g4CZIThwMuUNPdpi4JB6K50YzspsDw89MgevnFO9UIM5
         gYvy8idxJYI5OyKEwLvLcN+vBPMBuy+jJ0bWqYip7xuNQpzQAt8IWr6kL84iOhTxTzOT
         TwZOoa5wfAJinFG8TAKi9Kwi9HT3yURe7qeIcTWY9ipBs9SW72OOF77FzHaPtdqKBzH9
         r0Qqs7vbPVGIPLmR7QzRHlvat58TdrmeHcojAcp/MH5f7n1504c48oOKvRI21lWpWqdQ
         6KcbD5UTvGA1GKa2GnSiAfLPaA+JitTzy/WaO1PBiiz64X3Y032zBlylf1qBl86VAbx7
         6OaA==
X-Forwarded-Encrypted: i=1; AKwUvBzU/j/zBaurdtBIHsmcKPw2X16Ykqh1kFrpacEwHyC1WOV9/NA7AZyH+mADWjiuR0cYzE0lH6J7N0VJdA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/VcBGEWAgVnT+++vexbAI8nCAaXjAfI7DhLV76qEbEseic6K5A
	tT9O03mmbAswPlKpzoPra/V54GDVnHVcDDQR54Ebo7sUv8MkOA72zoch
X-Gm-Gg: AYBFou39BuSh1jdmlEAq4w5z3hElBy+nmGZa5XTA65m2AiC/1X4lrtDGfKIUgi4CmMv
	GFMSWow/lSG61LmMru4vMpoRi0TmVwKoY6CjrzMPNqK0jHFksC1gvanOFYnjKL76f7jG6yPW6bb
	X/1mnhiUikEuBcmzpW+4pZyNgWaq6Q+boY4A1hYY4xCekYJrdKmtJ9dXuWSGzoWRxUDDVIyUIel
	K7FIqoQUEFI+52lYwN9Xd3DRtCkjKAQivulq8V3c0PO4sVp6DBlnmz0jZ9COmaH1valL5mpFcau
	SNyfDhvy44TYaJUceDNwcHnI5106of12HGCgls1vnZcyCUdArw6OcFe4X7/jSrcF5m8fBbLeerF
	Sc8rO6+TTIOutlF80QoKLnkCoZqlY8un3CiGlQeav0qAg0WnIU3jh6WbDadtTHLsrKrUKffVqJe
	m4vEYro4aGXZnzun8ZdzS2mInnKIARxwqjmtaXnr41dXt3QJmbpN6h3ouDtA2G1a6/TDwbTgAk6
	4x7FVqsjwzTaUb3xJSMbzxuq8W/gRd6XPSe+gRE9Wmq5y5JFDgEOhwla7rsRa24+/Wgq5OhQJ9p
	zTxmSkMRfX65mblpJ8Oaa4oUVzxTS37W2PA87HYXoDNZ83gZNySxfFmZ0NJyiTx5ZsNeRzy9Eu5
	5RadDQ4hApWIh8WOQ1RH7+69UOtAGS9vi74fBYlIcD9g2Jp8+kAMy6Dl4sMrJppHp86ShQ0PIaf
	FDFvb5/+dz27/lKvSJkddVtpflKdhV7x6GXrvG07gJ/WlgqTim9fm8
X-Received: by 2002:a05:6820:160f:b0:70b:9b1f:e8a2 with SMTP id 006d021491bc7-716e73de95bmr322359eaf.3.1793904960035;
        Thu, 05 Nov 2026 10:56:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:34 -0700
Subject: [PATCH v10 18/26] mtd: rawnand: sunxi: skip unavailable NAND child
 nodes
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-18-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

sunxi_nand_chips_init() scans every child of the controller node,
including those marked disabled or reserved. Neither the chip setup nor
the NAND scan path checks availability, so these children are still
probed and registered. If an unavailable child describes an absent chip,
its scan failure can also prevent the other chips from being used.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 636a04f49418..3de9ed6795fe 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2771,7 +2771,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0

