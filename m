Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DFD476690
	for <linux-sunxi@lists.linux.dev>; Fri,  7 Aug 2026 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117152; cv=none; b=cVdkDf/bAizS9P0gbGutxHyi/C7jS4NPEZp31MjGR9cpbwCN7epL837ozJ2jCtNELNhVrTRp42g1henL8hPdNaN4D/jIINUrn069KrhT8sZWP4P+vuLyOXwo9gpAhGINEdCCUXbFNN6wrQAzZo6h9N2sFXpa75aWDkFLsySQ0OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117152; c=relaxed/simple;
	bh=g99+9R86yENKOxMWC/+p9emmD/F2G0i/FdzRfr3/FAs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kUiB1PTt3QTUxarUYJDH3dvSfZVlo/3hS1FQrVNINcRpKZYccpWEXe9N+NND/k5SYTyP0nhluPsWQ0EoJ7klPAODl0B4hbMgb+IcxKkSAOLbw6naXFvqyl0McXA5SXxkzmdd9JIlK5CtuB1OBVEvKqLuI5A/oNlxggWrgsu4k8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlhaE/se; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlhaE/se"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4a456e44e01so1987999b6e.1
        for <linux-sunxi@lists.linux.dev>; Fri, 07 Aug 2026 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117149; x=1786721949; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VbFL1A0jNYqmUoipY6MPyQje52bmNUS3I6T9M1FZoRI=;
        b=JlhaE/secQ1ECqjUKePdgQWobM4nvonOySMDXRgdB823TUIIBhZ0dGXL1K+EICY/0K
         UbtN7k9pHquVzdWORItpbX3ceo0cdrYo3KsDPIrl1jSLxYsC+EUibcEQgJWHI3rK8kdD
         ArMkOmp62q6uDsjoUyG4yLMjGewlHiosGUg2miuthOgPcuuuhK22PpirsgY7kqLabXFC
         u2rPyOx98bUDvgmdiKoXtWDFIXjP8OFKUOgx2az+oDJM8VJVf103UQnvz5Gv/HJZudAu
         f0mv5u7UyEwbxIxHZz7x5wJ//Wk3wLgTVw/vSWoyYO7YykKg+wejwwdGdsXeQMAReKN6
         QRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117149; x=1786721949;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VbFL1A0jNYqmUoipY6MPyQje52bmNUS3I6T9M1FZoRI=;
        b=ikkxQJ6Rqm5sGNiH/InVmnpK/ROn01ZkU9VWf2uDK3LyylMZEDrKtm0GPoNmiIBtTz
         k2I67VbeF0AyTaBpK94KWJQOzuLuq95f1y9/LA2GB95LFsbOE7j79D7R9oa/y8TeiRfU
         N1p6WaPB8vcqpaYtNnXVgFMEUhN7KTVa/mV9BFgkl4ZQ/8lu+QvyaadtXynemQYCe/bf
         PnI1XDPw4DxUOJoEqivelyXXzFw7fhsaw7cMveGA4vkvV3Mf638EA4aObbe/GLB1+K4l
         XdGfQjWwdaM0wzFBPw9usAmG8eZYFQgRcNAhNNaHm5jSkR1MMn9Ke1N4IACc8qD4g4uQ
         AwCg==
X-Forwarded-Encrypted: i=1; AHgh+RpiDb0G3/xWXhkkSnZJkwtQHvSysW1fp2ioCIQzmJ51TqyOUR0JHVC/+0YbzT66mN9yJEtANAgLdjLKBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRaXYIRf/ByJ0HeoiPInvF1iZKsquGJiTf2rSM3MYtXUs14tCt
	nz/ASIzH634WgVD6Pewmx1EreuFRRSHj5EPziQvdTgsPRCtjTyP/d5wE
X-Gm-Gg: AR+sD13FjOvDgvEYk8aqQT+Fx34F3aMLD7WIt/MuHibLjvg06EOknwGz0wXP2b9xwlz
	vV4NvIVWdvATzDnQdkO6jjWZtIliVHu/SuuROK+UGXYNisDHXsQhUAwMhqQTljRIqDLCh0TXk/u
	eMtSI+SbZZc6kh0hQ6ZyUlpOKsPondd+MWEHFWc7tEvht6CppOk+RAvUttDKsp+KmVPSj1ucjZh
	8c3dDdZ3KWc7x2RZbNGMuIuIEJwQZPjBd7BBFofAzp8FqEfaM5zDVAKEedBxT4aM7+NFVKysRl0
	CjR9jtIDRvIVfTbD7o/9sgUNLDVqS60DDFtY4lVm2fFcN6qlpDGGgsfiO1YekJoZcUYcLv7n0KH
	rkrftXeCnfaaXG+RBmHWrpCAKfCmEpPEurrF4G+vnZ9WletO5iTxGNv2/+efWEgEcZxwNdb847v
	8q1SaiVj3Sy4c3vqPMxwkFtshMrx/GwI9U6WU+305SbEJ83v6ucNg9RPYcX1Djema5Mt/fvbyQA
	v+ElKvQbI0lBg/bx29hJpOtL4YuBPMJCv5ofhlGPfG+hdet+GrcxtKtZdHGk/ziutEZeVYf88hl
	3ieKFtnBQmI3A7+326a5nxB0SE12qi2QrUtwPi17rvGDXQcCjEJTWEUafmChawqsKFbWPQdao+r
	/PlfcQ9MyNilKXVYZ
X-Received: by 2002:a05:6808:1910:b0:495:f519:70f0 with SMTP id 5614622812f47-4afae01bf6emr13779508b6e.19.1786117149136;
        Fri, 07 Aug 2026 08:39:09 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae706cd5sm7353485b6e.11.2026.08.07.08.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:39:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/3] mtd: rawnand: sunxi: fix H6/H616 controller timings
Date: Fri, 07 Aug 2026 09:38:58 -0600
Message-Id: <20260807-submit-sunxi-nand-h6-h616-timings-v3-0-91287b543f41@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQqDMBBFryKz7pRkqgl21XsUF6mmOqWJJUnFI
 t690Z6gMPB58Hl/Fog2sI1wLhYIduLIo89wOhTQDsb3FrnLDCRICS01xvfNccrhZ0ZvfIeDyic
 VJnbs+4i6Lg3VdUlKd5A9r2DvPO8b1+bHWfKwbdrEW2PgmMbw2Z+YaOv9szcRCiSqKllJoVUpL
 r0z/Dy2o4NmXdcvhh8QOuQAAAA=
X-Change-ID: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The sunxi NAND timing solver currently applies the original A10 NDFC
timing characteristics to every supported controller. The H6/H616 NDFC
uses two internal cycles for several setup and hold intervals and has
different delay-field encodings, so the resulting clock and timing
register values do not match the hardware.

Prepare for per-controller timing data in two behaviorally focused
patches, then add and select the H616 characteristics in the final fix.
Legacy controllers retain their existing setup-cycle behavior and delay
encodings.

Tested on an H616 board with Toshiba TC58NVG1S3H NAND.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - Split legacy timing setup from the H616 fix  (suggested by Miquel)
  - Move tADL/tWHR encodings to a separate patch  (suggested by Miquel)
  - Keep the timing lookup helper unchanged  (suggested by Miquel)
  - Drop the minimum-period helper  (suggested by Miquel)
  - Align H616 timing-data and capability names  (suggested by Miquel)
  - Add Cc: stable to all three patches  (suggested by Miquel)

Changes v2 -> v3:
  - Rebase onto current nand/next
  - Fix strict checkpatch diagnostics  (suggested by Miquel)
  - Add Fixes tags to the two stable preparatory patches
- Link to v2: https://patch.msgid.link/20260717-submit-sunxi-nand-h6-h616-timings-v2-0-225515107640@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (3):
      mtd: rawnand: sunxi: group controller delay tables
      mtd: rawnand: sunxi: describe tADL and tWHR delays
      mtd: rawnand: sunxi: fix H6/H616 controller timings

 drivers/mtd/nand/raw/sunxi_nand.c | 119 +++++++++++++++++++++++++++-----------
 1 file changed, 86 insertions(+), 33 deletions(-)
---
base-commit: f97bdc8ec1dc7b33781a702eeba55326c206be56
change-id: 20260717-submit-sunxi-nand-h6-h616-timings-794a2994267d

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

