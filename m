Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2262A421223
	for <linux-sunxi@lists.linux.dev>; Fri,  4 Sep 2026 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557019; cv=none; b=DBTrbFGS9ad7EmyaGjgQDy4cOKENgNlnXhFdfyYELle2ZSnX+dhNTkJwaAlaTT+LVTnaLYhTltiYeM4x0Qml9z3YgNyyU3ZIhjeXQ2Eyy/saDTSkTDPt2vFkyVkSPFc7Zc03gFz0i+feksnTGCNYqCe7Ubdahj5AaxAS6HKM/W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557019; c=relaxed/simple;
	bh=Dat22XcEtkNthp4y9uxCdEhxOsVUqkKHl6Dkr6hi1yk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EdHDi/dErNHaH/8Ce1SBH6XPAduUCvY/Pk1Oi55kkqbHcHtAy1/mIQWBxTpmV9BbpyYt8NDx5pt9mK2T4M2p8zehoelcLT6fyjIub1h4YvNdnEeuBzMX5mKvYetYYrbSuWF+PL4KBLmWYT6fZxNxpQsL74SuYpoymYN0lOlyg9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxlVLJ2V; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxlVLJ2V"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b613d3e19dso1741060eaf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557015; x=1789161815; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4PTtIkVinTEtahlfN7FKi4R1ua5dA2ivK/7V+ltLqrA=;
        b=LxlVLJ2VTRkVwjtuCYCnH5n/lk9tJu11YHR426eQCeX1y0kuW135XGRwFjEgMi7Vh6
         G+KgOarP8S0shUnoqU7wDnhN9mhixwbbq+sujeyQIO2tUqbi2ar60wc6L7MHUfjE5ugk
         nGxHRqUNO0qpvsImjTndQW9AzfQK1DDXhHdRwrwneCj+t4CwP0Er86hNqJgTIlVjoSXv
         PwCQeaG6TDyvHggZmYCDtZmnS1M1V2A+xE3sC6sRw/ZCjJlpYU9yfUx9oSRuqkx7XC3G
         Waw+r3Fs2t723cJC/wsiEg/olouUO4nEFvJhBPTwaEH+/b6NrjpBIDE5pP9f0kXHgt83
         3hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557015; x=1789161815;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4PTtIkVinTEtahlfN7FKi4R1ua5dA2ivK/7V+ltLqrA=;
        b=cqS/UwMiPsrT+QC6DeT182tFvk7tpesKqHRWnbrTrapVnYV2U26DA+xBUXw+JFNM/v
         VIozaU2x7+RqlRYOQKai44jN+5J8iFDsX+3BeBUYv/2ZAK6OowV3a/9MhBfqfiNkQRsn
         QcE0zqpsEDXnDYETX82+V7qzAYAckyqtQjEsV4vt271yD/iQxRc7BZ+Q+KqBRZ8seks/
         r6onYKoV6HGMyARa4FrDKm9bZ3CrFvoAHsJJkFJNiP6H3IRVHiVXhbBAVZF3mjmg/Quh
         9bgJ9ikuhIVxiToj31PSbkP6QH2D0Nx4rcK2OBRfQUqUCgY/W5MTm5OuVID+jrTOwfrr
         ctNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSmTIH0xY673qhp+3x6VaXLSeHcBnovnmm1OMjT1DdhBskLEpxPbsLM5ng6EjBzpmWiXd98wcZ/JPDdQ==@lists.linux.dev
X-Gm-Message-State: AFuF++ncfpGKrwetan48q2Lr0o2Ye9wcUeWLYI+un6urKOG8PVKr4HPB
	IYOMy2HtNSflejQr8gxQY6XTolHc318aU4Zj+kO2+ZVYHDfKpKfSDahT
X-Gm-Gg: AYBFou2cbGrLXa/B4MzYCbrbFh7+K1sCVEEwQgTWc6wYt6Sy8+j/sZkmqc9JZA+S3ox
	u4TOtRkfYyIkXT7mK5gPfhYCxpv2RQltag0IO1QaqGpjVUlwaxrQrtaYHF5nFTnZer7byFRik/2
	MjenhJLG/4AHfYhffbKXhj4X/f4QdU94BLv+MneDxrP+h2rK+gUltpJx46jPAGE0RhzyzDJJ8DX
	mEx981nPLfXDVy7P/RB77ph+LuNNc8QhiuMhld03yvoAJK+GMZjC29x71JwCsdVa5TwFq9QvCh4
	RGD5sVn1bD93+JEUqh0vkI0YRY5tB8GHr4xKcOyK2O6DZjjiaFc8TQ83btcPx6mYo7DernOCZ1X
	S1WeOHDvbLmzIEYN5wsy8qBVUwA3nedHCR9d+OIftEOIaAc+epZwXk3twQ4eRusvxTETWNWNA07
	iYVi1IwMb2ycwffj3p5/l/5xQo8hGA9ivYf+m9Mb43/HpdFQPrJ7ecDthdxx4y1jcEBfmdVJbA4
	yrdoNG/YU1DHPsdSkiDMJ0U8upXwjyRFvF5BIUjnS6OpY2oFc4BsKjtg4MYP1MiVJiVWI46Qxl4
	PF2mnClxH5h5kifUnOO2V15Cxt++fyv3Wfj9Uy02n3K/XdALHDfeO/99P3XWTiK3GG11qu969MU
	IUKOgq2CASxMvV1bKbXs=
X-Received: by 2002:a05:6820:618:b0:6b5:ec3f:4981 with SMTP id 006d021491bc7-6b71fe45f4bmr3369775eaf.28.1788557015327;
        Fri, 04 Sep 2026 14:23:35 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Fri, 04 Sep 2026 15:22:10 -0600
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQqDMBBFryJZd0qiVrSr3qO4iMlUp2hSkhgU8
 e6N9gSFgc+Dz/uzMY+O0LN7tjGHkTxZkyC/ZEwN0vQIpBOznOcVrwUHP3cThRRmITDSaIhotHV
 gbQejXO0cIArAQohSC65Uo1iSfRy+aDmHnu2Pk+mNKhz2ozGQD9at5ydRHL2/R9NxKKuivhVSl
 FI3j36SNF6VnVi77/sXCzwag+4AAAA=
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
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

The sunxi NAND driver applies page randomization from its normal
hardware-ECC page callbacks. Each page starts from a page-dependent seed.
When protected OOB bytes are transferred separately, the driver uses
precomputed randomizer states advanced according to the ECC step size.
Erased-page detection and its physical-data fallback also live in these
callbacks. Randomization is therefore part of the driver's hardware-ECC
page format rather than an independent MTD access mode. MTD_OPS_RAW
continues to bypass both ECC and randomization and exposes physical main
and OOB bytes.

The mainline format compensates the bad block marker before writes and
after reads so that it remains plain on flash. On H6 and H616 it also
fills the OOB space left after ECC with protected user data. Allwinner
NAND firmware instead leaves the marker in the randomizer data stream
and, on H6 and H616, uses a fixed protected user-data placement. These
choices produce incompatible physical OOB layouts.

The Allwinner BSP implementations for the SoCs covered by the two older
mainline compatibles (sun4i, sun5i, sun7i, sun8iw3 and sun8iw5) likewise
pass their protected user-data words to the controller unchanged while
page randomization is enabled. Their 128-entry seed tables match mainline,
and those controllers have the same fixed four-byte-per-step user-data
layout, so only the marker handling differs on those generations.

Add allwinner,randomized-oob to select the firmware's normal-page format
for the configured controller hardware-ECC geometry. The property marks
the NAND as requiring scrambling for normal hardware-ECC transfers, omits
the marker compensation, and selects the controller-specific protected
user-data placement. H6 and H616 use four protected bytes per 1 KiB ECC
step, capped at 16 bytes, with the complete protected region placed before
the first ECC step. Older controllers keep their already matching fixed
user-data placement. Assuming the standard ECC geometry is configured to
match the media, these choices make normal reads and writes compatible with
BSP-derived images.

The property does not change the per-operation raw-access behavior. Raw
accesses continue to return the physical representation, including a
randomized marker when that is what the firmware format stores. A physical
marker cannot be both plain and compatible with firmware which stores it
randomized. Normalizing only the marker in MTD_OPS_RAW would make the result
non-physical, while enabling full-page de-randomization would make it a
decoded access rather than a raw one. Preserving both the firmware format
and existing raw semantics therefore requires raw access to expose the
randomized physical marker.

The raw-NAND core's bad-block and flash-BBT paths remain on decoded
accesses: nand_block_bad() uses ecc.read_oob(), OOB scans use
MTD_OPS_PLACE_OOB, and BBT data reads use mtd_read(). They therefore receive
the logical marker and BBT contents through the hardware-ECC/randomizer
path.

When the property is absent, retain the existing mainline marker handling
and H6/H616 maximized OOB layout.

Tested on an H616 board with a Toshiba TC58NVG1S3H NAND using matching
Linux and U-Boot implementations. Linux initialized the NAND, SPL and
U-Boot cold-booted from it, U-Boot loaded the FIT from UBI, and Linux
attached the same UBI with 2004 good PEBs, two bad PEBs and no corrupted
PEBs. A target-timed 64 MiB read through /dev/mtd6 completed without
reported ECC, timeout or I/O errors.

Validation completed with strict checkpatch, dt_binding_check and an
arm64 W=1 object build.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- rebase on the current MTD nand/next branch
- retain the merged protected-OOB allocation, BBM reservation and
  stack-buffer fixes
- clarify that randomization is part of the normal hardware-ECC page
  format while MTD_OPS_RAW continues to expose physical bytes
- explain why a BSP-compatible BBM remains randomized in physical raw data
- document the decoded bad-block and flash-BBT access paths
- reject the firmware OOB format with software or disabled ECC
- document the BSP page-format compatibility contract and the
  older-controller format audit
- Link to v1: https://patch.msgid.link/20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com

---
James Hilliard (3):
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     | 10 ++++
 drivers/mtd/nand/raw/sunxi_nand.c                  | 56 ++++++++++++++++++----
 2 files changed, 56 insertions(+), 10 deletions(-)
---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

