Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223487;
	b=u+f7HldWONCag46E4v2vLgr5Xkdg3L3y7rULPdLBRbwRS8N+27JAW9MfwV2sG9rPek8+
	 he0staPm3G3Vk5Vmv2pEKCE8cJ5HTePybUTK/omLalewIcXQbeBx2JgL7i8POuqE5brwa
	 YuFjKWEy2an1Vv8ppwU0kGJcRFy4a/C9rh8GzgXA0vsw7QvB0/ZN49MQ1do5e+uPxPpUL
	 w7t6M5XZdKLrAokv/7/1fsZHSfRavqGUgofYIGHN6tTtZ7BDgWB5HUZrUn5zf6l37j8aw
	 H+ilJsuEJEkXDLzBORSsS8CIKwcvVLd91hA5TSyJXJbqHpZhEOkC44/sK90NDoGqrrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
	b=g6E/GIMFDGemmE0p1b9JlLMaGo4+I0R+0uvbRaY0jV96ylTkclYgKybqEAvACqmI26c4
	 A8ZKhLM81Jnsao05c0tbYNlqLp317vB3wyKXhnTUanR4TAyUuv3ht/MHgDufj29/dOr58
	 8BkxY97ZKNnABfvq/gv9ipy7kYJ5DyyvjbVe2FqAHgrfocPVxKTZ5aTp5gigcyKYn+OnY
	 hedxBX8EOBqx1Umnls2EH85UkQsOFGaE6JleTYe5SUN/pHz5k+sqADFjOuYQ8Yb2Pq7o0
	 jV4+UB+URPh2LLH3kXiQ/bASTKRyTh1ClZ2DnW0prmBWRWNhiR350oV4ZX9pQdVmRZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFleb2QW;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F83606ACF3
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23F83606ACF3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cFleb2QW
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-56431524c22so678555b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223485; x=1795828285; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=cFleb2QWZnIY6JP1tnav001EFHGR3tEZslNIKBYF078lRfmiRWVEfcceTUw09ocQlt
         aVxJ8n/QiBuQd8mach1eJmU+jhT9nPwkEAAqcGPPtdcIeNyMRmAvlhFSsczsUFj03m6I
         f5uq7sdfAuyrBSa/FniEeaxPMqkKen0X6XUO2WxoZ+6J83sHJL7X7CzSyKeAW9LpV6ZR
         jicbVonCIKt/LoUvXObjDiwXpbnLF8LO7/90+7MPTQ084tysRylfbrEXP2htG/v5Dino
         xTF98bQcOZl5+LlMT8Tzgjp5lCqvzD840Ii+UKnpNS7Akc+EJyPHG0Wr3t6+LIQf4pdk
         MxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223485; x=1795828285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uJoG142fYCuU8vw67QDp3rEWq4mupCEBikzvmy4Exg=;
        b=rMlvACXAxitojjiN5+TS0f68VwfgJI63sJu7EbFcTNIZyxp58x5FUoLa8fZ4LhT7px
         JL86d7qsMkBdPmXo4o39/NVEYL5L0wLeJFyuosgqtR1MtCD4vMsGWGZabOky7CfknFr1
         lxIkzwKXwpfhA6EphMwgt6YeDNzvPyKpl4VtfSK7Esv2dqT2bBFLboJmtvEinGmPnlP8
         +2NVuFHJ9YfBrZS7m8i8W3ihaw/6K4UWUhf2Jr7G8pS2+9eDZzEfmU26VBN/ZEcpzvlt
         Jtr+hxTjnSEzZ9h93gEdRTw2b5C4o1dQ32KCIMoeqBzBJzaTgA8lMHfmCi1A5KDK25vQ
         CqTw==
X-Forwarded-Encrypted: i=1; AL+hErF9k/+vrtW8IayxsAmQNqTLz/cRLKnd1CNTmqPiqF8kVpGVl9JihuqK2awv258y2F2rvfV4qZ1QJTdFGg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/AnHtbmcdaW0Cr3ID76uXkMdq8+fM02sV+8jtZ2/h/mkkHi8B0
	Czh6NwdcmTjuImfiA5vO7FQxeF53wdf5wnRsqMmL/jgwDBTIZHkC2gEn
X-Gm-Gg: AYBFou3A/kUIIQ73QWpY1lDOn1J6VGQNwDMqXGe01GgLItz48rD2sW+4YLC/6y5e0bh
	0nvStdVgs4GrxutO+9u8NLE8g8bdjVYLM89LS4EKrgdjVfmrFWS5ZimaAQjaHSP1XC3tO3i/2FY
	RqEVeubPn7G3owVDMGrvANV+L8xXeitZzoVKiqluLs8JadTzP4RQMrQPtcDMAoE3WE9Nzh1IHLl
	9tX5XFKXJQrB+0xuYVieXfT/Y+USPkxfLWFWxuTrV7CuYHaY7w3d6c+CCvUDWg3aaG0g9/kskVz
	sSz4KPjq0DMviamwv+fOJBH8BQW66mCNn8yJvY+8zFCBth6WGYqJpc92I5YV/5koOG5lCCf0iI2
	F85eNSkDgawpEstYIb8JU9D0R2CVbAjYwPGWQRZhNh/O4ZVHnS4mMpn8D2NbxUjhxtbvhKXQk1J
	p+Q/ajsbpiOFSJxbiFV33A7XkRDiRKE3CNtz/1xrIohip2RSgKcIYmre6jFaE7WcfC7oeXNIvkW
	TebGdSoZUhHVJMfOvTYDlzzYphcl84rdxmKJN9ZR6SRvCSOPafkBdv2R1dg2wDFI90DFFEVYVOR
	gIDJL9tC3c2grREwx5GLySEyb/zuFBzbB0kM/Gbk5utU/R9eyoBrgAY9UTheZAzrWh5FJSJC1my
	VfhwVn2VgEMcFolOlxJwWtUxI8t1grcnGCS4E32bsU9/tEown8COCp9izF+MJjvf4NcsgPR1eMK
	7fYFV0npvZktbISOQ/bl0aT1NY9QzsBRj5kHnJz+5guYjsEm5hmLgC
X-Received: by 2002:a05:6808:1915:b0:4f7:867a:1136 with SMTP id 5614622812f47-57a0c7bef2emr6229820b6e.64.1795223484984;
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:44 -0700
Subject: [PATCH v11 21/26] mtd: rawnand: sunxi: skip unavailable NAND child
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-21-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
X-Mailer: b4 0.17-dev

A disabled NAND child can prevent usable chips on the same controller
from appearing if there is no chip at its address. The driver scans
every child, even those marked disabled or reserved, and aborts probe
on a scan failure. If the chip does respond, it is registered despite
being marked unavailable.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 4478189bf920..73d6cd89ca19 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2661,7 +2661,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0

