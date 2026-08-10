Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA2436BEF
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 23:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403105; cv=none; b=VJJK+cbF7c6oCxZwZzs5nxAIK3Ub5PfXlG0TBLEfe6hcNSqFDmNsfpgv7AfbGDt9OXwgsk5+0jiaOLuXXEBIQbRo+DmHm/s7Oztia88/JcwtJY+EBMgfmv8Ztve+mDh6xOshAPyTELhxhSI1diH3tqTUM1GMdbByJucBcTKlDZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403105; c=relaxed/simple;
	bh=C8wxNRLHTXJnjE555Pc5YpGfAsMOcsNHZykjvR8RKV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lusdabgDSFBvysXHWdTN5oXAWm5NbPxgaKlwP5GtVzGEoxfq79DPfH33H/cLlWgP4w3RT6YAuPGNSg45nerGPzcULxAlvlnyEx3RkpvY0YWgal7aY1l7VtyBS1dN1SrktwNmYhEwafluuH8tLDJv/R1joWsl1wBvDMdvifJRAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaJW4lkv; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaJW4lkv"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7ee125ec926so197571a34.2
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403103; x=1787007903; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WncUUdXp2NNgl8obhgaBdPAvIEYbLzW9R/2km9b9tx4=;
        b=iaJW4lkvAbGaLA6RNuk4pQ+4o6RNZAdgj0hp+D8dKsdG+9whhZnDL9IUrDVaM0yU91
         VetVK9Xqgox7RZ2vfZlQRxBRQPHAGekW4MVNphU17bC26qAIQImPA5tmHBqr5W/9CPAv
         7lgVlSN2dsE9FiTAn1ZxzT6hcBo5uDl6J/Nhd+NZmdidIYg6Qy7TUaHGUG3g1oZ0QpGc
         EYgVdSUT3SH/+cZYc78u7AHLAtHOLxMs8Gk+zpfK3DC1WTDPiq32rTGlYVUS49zx4v7v
         xhr+LfYefgx4fbWPYZM/ABVa01Msif1c13icGbYlLWKbw41nwt/iwmp2x6Em+qg2VknI
         GySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403103; x=1787007903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WncUUdXp2NNgl8obhgaBdPAvIEYbLzW9R/2km9b9tx4=;
        b=ZeRGQrPWMMZVDeZpTKHm3iXbmWkxUfdkowPmBry4vqPMZLTNS4s99GuI+xnHMcUYYM
         Hy9L6zOmOCeTpE5OjMidTyihPZXl1SHvOHerN1I5OcDyupuc8pW/2Pq612ZaeGqdQ/+1
         H3ogRChHhtv7nNCq3N7ih3VsAjvbi4eBIyb/Aumuf/UO2zSx+oZBHBuJDBjl0NA4+MDY
         JRwD3vcta150QDZ13ub71o7OgQw7umDcCFjLwoJWrc4suoBDdCSP+nvvCplSvxb/iigZ
         9GZwX+8SP1CY9YMiAyi+vnlRplMRhX73DIKyGIV1Cacy3dQfdS/CYQFYy+r5gpF3wDKP
         7C1g==
X-Forwarded-Encrypted: i=1; AHgh+RooQ+cSiMYJY6REI/2APf7Iy772qNNzXhKIcxjWiU+Je0W66xrSE71lIJrK1qHug/TuY8u+x8Pmz4rw7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyoqQ9VgrTEey3+H9I+0bSr9NwPP/4/hS+3SZkzEyZC3XPPfwOF
	rShxhNYDslxyxCi5BY3GGIKFkGZEcVT6laP2bXraIRxO63XQJtW0nCLR
X-Gm-Gg: AR+sD12Yd7NjRPkUbN29QqQ2nPcXHh7W3A89XtVL2+uP4Yswf1FLkSoyohT1qxDSpjH
	CCuIl4N7dPYxpNcYFUVQUh3hDwe1kN6jHUDwJfaP/y8zAfalljqPGOmclK11+xxESTdZqAsTEl6
	EuUn3NYqktHqheYP58oSUm+NVVt8QNykvzGePFIYU6ZBRwWQYyOCntVIb5BQ9bEWwUPheoCY2k4
	5dZYz8yUQY9vCJXG/vtoejBT71RORp+BeRi8jg4WAf5ryllfGbj2fItxUahirSlBT1dZvXrZqFB
	DeZ6drO9IbJlrNh1SKcYgrv5bv0mBsjg10+Oku30E/T1M1ryAgyhoZz4SXN9z0vZArVwCx5SD8+
	GMU3KRcDaictfi3Tf/Ekd/NRJ0lC5YUpj0WQCmj7Ruk/IshUg2evBROvHPOtF5fSCGtKDKaznn6
	u7OJYDpa07Ik54oMDJtu5BMYVZNriEwcyiiY9iW8f25XPINUvbEiOBj7VJ05IzSbWsLQWCjm70q
	LZGk2bkiPmMrr7OuBxRuACfdSwoU3z5cVnYeDH0Pl1lsiQ1rgme8LWNFeSvvyF/naa85EEFtmop
	hGC93wyPY5b3x2H93Yfq2M0/pya64D5h75l3hKmLXW52eU/c2vqN2jyWeZXVBII+OJDafFvC+LU
	Tgwi2G6iR6eNMday+
X-Received: by 2002:a05:6830:4414:b0:7dc:d967:63de with SMTP id 46e09a7af769-7f1e5c98e5cmr32808491a34.3.1786403102967;
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Aug 2026 17:04:49 -0600
Subject: [PATCH 1/3] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-1-463853a14ad9@gmail.com>
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
In-Reply-To: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property for NAND using the randomized normal-page OOB format.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..7eda1275135d 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,15 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Use the Allwinner randomized normal-page OOB format. This enables
+          the controller page randomizer, stores the bad block marker through
+          it instead of compensating the marker so that it remains plain on
+          flash, and selects the controller-specific protected user-data
+          placement used by Allwinner NAND firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

