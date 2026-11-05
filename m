Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904969;
	b=Q0OYfs+Y8gvOPq5RTn0CjB42Wx0M+2uC2tojGp4OHYLNU//bb+f5tCd7KlxK5qi0c3Ze
	 mdFkF8h51OFRJvvnPpvs/RoElqQ2xfFOHXezZ1PmJfUXUlMcMiQisTrtUAL8fczPrrrAM
	 4k5McjHDPsNE/YCAv7w81Jep2BWpgxjiQJpFtQIZYrEb05cTys+9orbhgHWij5+nCX49w
	 VKi9D3C1lMt536Ie0qaegZcoDTyxsCaJjC7GW/LpvsJHIiDYgz+Kd8BdRORyXZEZBL81Q
	 KY5U9jnm7N2QkwrYfJLoHrw2NaU2Zf8nydKGHuTlIYWJ93nYFq4Iqvc4+rJrs0Jlzaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
	b=zm2dy1IHBu3qFFxe9q1XdSWVD/+NRSViAW0qRoYerDUxVj69oSDP/Ai818a85n4sTFjX
	 StkIv1gckaRUioNM2FkNn2Sjraj3Km3w98wKscjXkIGIoRZyMEkDVTdkgwpZA8ZvZMvee
	 j0+qX+whNY3xHIPukHU9eBC9aZtpUqhgd4UN5ZF7I1I3UdAfTrz4g2YbLRX/V5nJXbW0p
	 66HySql/PCIlc/7cyvje2nzyQaMVk3/YV9QsPhd6IjUqCzczov4S/eE+7pK503m28/vSv
	 UPnOpLsqKnk33vUARXyptsA6rba87xb5QtXAFr/3wG3LokpMF5lVEbEQ2FtoDs7doBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrhoRe3x;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B3A60A2623
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B3A60A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rrhoRe3x
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6dde81a6820so1436781eaf.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904968; x=1794509768; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=rrhoRe3xHyLEH79PBGX5xQiaaMGyNqL4RFnSvz/cVpflO1VAKVJXIgy1QJYyEKKvLr
         Ehu+teISzIeG1fe3nm1aCk+iRYtMXAZkUuYTujCjp1hVq2pXEf2aEDVIi953q352XioN
         7z3StCggsPamR6Npeiqj08eVt+J7iRsuQZ3Po34eg7/gEIyivO+HIQ8MWYPDD41ZHdVm
         cmzuYPk6WAjD/j+s0zd2nWZsKCsubKHfSh+KgOhldry0NJkaOi9DzcZngN6NM58afHG1
         Tvyna5EaIK9vttmTyWxOgkxti0bkz9T7nUNs8fDiu4VGKoKwna7Pam63D5qzH7lJ3dwg
         QQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904968; x=1794509768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=Z9D1XRGx5mzg6fRyDqB1/twL4AYs2SarM1nHYMBzOwna39i/sbtlAep2uyB1E8fSf9
         UjItHcVZMm59bn7wmryj1WJyfYtXyG66h267lMr+Rzx0KW4NG//GyFIA+JEEUi5ICMm+
         r0oU+OPypipDPVybpz4SEWvtNAqxzt2SSTo/vFcWXKFlCugLoEFfsOT8dd3mC7MntnSv
         F+u7tuct0Ht+yPxWtmxsCKpNML3izkm+jrN8zOEEaYHht/2hvqYo6nuylHVdIgmXKgsZ
         YSBtAJaaULro0STml+1aCPahJil9RhbGVwFuWSdH1lzsJ8YuBBSwtEQ6Il6TqcP8LlMy
         WBRw==
X-Forwarded-Encrypted: i=1; AKwUvBzXAStifxctqZp6zaWnhbUYYrBnLrwil8/cvIBU1YvMII29iRcnMa0cNmGtIoU1jYTimfgDD+/1mOTXiA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9i8jiomPQxd1sJo0BFbDnJneRRxojdzNYYNjkqBOXeggYWYbh2
	s47xz8Nh3OYi5GA7rtGnHUXuqJpQNPqGWVeqXbNIt2yIfu/u7EPonJJb
X-Gm-Gg: AYBFou3q2kdNihozCo4WQVV8YY8+I0i3nVpDNthPDMoIAdGXe0tyzZkGLvbuP5C+QEd
	haAC6oGBcxkW4dKyILcnKEqp+Pqj1G7bKMD7J4k03WWsnP4n0cH7Q0IfTiCdxn5urZg2vuGH+xS
	dKrdTkZE2eE0jOz3KASJomaPMP84nu6dxwiTJfqI3DzhAyPtASY0AfwImlmemtYqXkQDDO37wE/
	v2MBrlY9q5UgSieJVzdgtxts9X0+MF2PURMgZ6mYuf9b57TlruGN/QHigKVALUK39bf8l0Zd8n+
	5K3HlQ/dXUdq76QDJMD504KxMEX7sA6l1xHYhyewK/0+ADCeseOkXvjGr2ITpypLcoLLJ2oGifq
	GPmI/gSG4naidAB/pcTddorBHodIAbX+t9K6MXGvVeXQ8qmm17+1WwFBmOfO9NODt3qi27qmcL3
	IFXKLsn0IfuE7EYV134DJIewFRvpf2RuBC3OOJ+/2OP8BGuToQN8cN6pNZEfLsBVapckkbDHuhs
	hlDgcigO2LBi71/kzo8Ys+dmTWaBz8T0qrFCO/o+fiH2otslKqLZASoRQV/hrxwWiD7YN4/l+wq
	U7/ZxndqfDlRwlgwJiCwj3uD7FHEjLv3zHAwy5OEygH6k6rWWXYxKy827jMRRkV7BFHjSbuQpVX
	mHcidmtuONCEoaqiQI2+imM4ZXhpCGEnt4QwRzuiG4pNOQMbvj0bYi/k6B4A1nugOP1DPJXBgZq
	MCX26EKRa9rXpFF0hGXXnwEIkCClneY0qegArcRjhbdKculf9OvT4C
X-Received: by 2002:a05:6820:16a9:b0:6f6:3762:5f9c with SMTP id 006d021491bc7-716e73de6d9mr410801eaf.11.1793904968458;
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:41 -0700
Subject: [PATCH v10 25/26] dt-bindings: mtd: sunxi: Add randomized OOB flag
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-25-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index ccf616fabc91..4ed99054a8ab 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

