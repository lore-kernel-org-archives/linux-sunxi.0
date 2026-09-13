Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C350388E43
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 04:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272326; cv=none; b=U90ZjfxOyOEh1oyTtSm0VZVlpgdak4Hz6Ebrhy+ta0hkw/zPW2aDjLOm2r/ucT52k9SLbOaS2Kget5C9R8ej+I1LinDkCjtr4pdq/PgASkKgmKMZfmZKWdDGMbkTQJWyaTkiB4VuyCOiWMJiIAcEgDawe2vQ/bu39iY8PShvnZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272326; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OhDhOT+Mmri++o5BCtmbHfiB7OXyohsrytDwXzFrodxUGHPSYON3pvo1wjy8MRDJ++YIxYKvV6cnZkpwCfWvX14Ae+1eik1L6TMc3MYyTilPLEFWvNbpfSsaINiyWGJmF6hB8X8F0hK+k3FZcPPLHvMn3v2PlKxkKbb9L4+OFbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6V6FEjt; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6V6FEjt"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccbd4773so206825fac.2
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Sep 2026 21:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272322; x=1789877122; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=p6V6FEjth+NkNgTkqkjPe8NMHe8VoZ5CcGYOMgzBP0HMBFz6VYu+AuWNF+VD4nzJ9a
         Kso97gZxFtsbVF71wf+/amuQ6Qn5GK9Oc7tY0ui2rsWeX/xMlo/zooQ+g+N4ILwkjBTc
         nB9BQuZDIzYkSh2crina+5yJJNlmp531vpE6Wr7dlV+Ksx6XhaNJpS7JdaXwdAQm6z1h
         DhGHo2vifh7kyFDLZamzBl7N4X1i5ZvjqSwTRreyUGPdhtqw/9/j5eDZ6UrlVVR9NIZm
         DOjQnvL8PP2/jPWgsGxw+0EAZUNMXq715LrClMZGyWwcqav5tmgMcTCDHJSQ9We91vDv
         hC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272322; x=1789877122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=Mw50J/0a42dtazxcs2liNAn/W1XSqzmgaMQ7hVgk9rKlUzOt+jnSJUifZZM8g+v0Qz
         aUJxT3pm2rn13gTGSZpMrLW8GFryoC9PMcPmqRudE87TGNK5Z4UeUePEpaGP4wjK92kU
         WR9r/x+Gyu1eVYkzZflWpWnCR2OEioCugQEGkbYRf6Q8L5CMok71y1ZbvsaCPYriNY0h
         h5O53y2uCXZQyrn2SDX4x1k2ijYSxl8xbKM51klfWcn4GcfmIltwSYrCtcVza3yUaxjl
         75DyhZOY0fPvcwVWQn3L7E4z2ua2WNqvL7sEgsoV9JbxOjWTjNIAZxjS4eurhC3wHy/R
         5X0Q==
X-Forwarded-Encrypted: i=1; AKwUvBydsV6CJ103j8xNkV33gJI3R7mNdBqYGSS1iYiOgQotZk5lzspzDyesyzfDtwEVHSf6FyaCibTigdfhSA==@lists.linux.dev
X-Gm-Message-State: AFuF++krM1Rv0n090LVxdJNBH4R4T3DkjVLBu36CCtNExodI3qJUbcBp
	livOseBY+f+CQVYdXxccDM8n4oD0JxSLSpFsmUQjg1GAkvDO0y8Nvn+J
X-Gm-Gg: AYBFou2HkPPNgGl14+baMLvC2EaVK1fy4LJ8hs3e2vxXp77ea4odDh+A1MGyIDtJKmu
	5LALH3EaEuNUUOXXYHGSzIQYNPPG1SduZhq5lhJSD8fM/LwpY9vD/SsED8GkqRb35FlRqT6EINm
	y+tsdOcNyvVo4G9PEPwnrtlvCI9tGEzWiuG7qrjpInYsuhBm3VTNH8x2n7LOmH0ceA8axJ1sYg6
	fDza9b5suJ1WSG13fmOyNaNrNAjn0UHyRFeQFOqXfKcZNUNo7SEkxGY2oKJrYfecMhuzmleUe93
	HUjY81/MG2IxTe1dnBePkWsYWTPURXoXVzwdb1IjziGFWQoZGAG3KSthb9/wa33srSsdKSUX+/x
	Gh/P0n9/ZSGh25JgIJyWkSaDwsDi9rcDjnPLC4YDh77XPwfgIj1J1fMMX0UPzjR3EYvWnuHobE3
	OWTBDhQxujJUPttTu5RsV3SrN8vrWM+bmDcYC30iqf048cL4c6/eP9OP2Pq8fqdeRSSfdljVUlw
	9qtFiMSysay0drd62QbGd2oC7aab/UTh00xFxTKfsclxXkXTU12KQwZ2GfZOzf+N1AIHP6dNHcQ
	DlB2ahOZ4ZK6eIWgob/Zm+G9XIzblAKFQ4lYxvqLB/wXiagCJV9Z4bsEfI/OIkxKcbstqhfJhvB
	3XULOncayUmThOmJCssiHSo4ZppdlQg==
X-Received: by 2002:a05:6870:82ac:b0:475:e0a7:9f32 with SMTP id 586e51a60fabf-47f59ca2579mr2988460fac.32.1789272322076;
        Sat, 12 Sep 2026 21:05:22 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:01 -0600
Subject: [PATCH v4 10/17] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-10-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
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

