Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8142D26A0A7
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 03:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354899; cv=none; b=mlxXtIyYqVCQf5Yi9vaFQWXMyHg55SUSf143WS3MGGYX9vrBAsfkbvUCSLNXBiIeGsNWCCAEIPFKPh0wdLSoHpIAPvuJKFgOJH1Ep2/Zh5jvcmIBH7ux+2R0utDRj1klmv4UemjhgA1Gd5azXlqRxnIyn8QYFTeQfedHyQQa4tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354899; c=relaxed/simple;
	bh=Pi6YDXOmrmzc3kuI0rj21OMihyFbVdTsdDqZvaKEQ6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lz+keG7LvjzixKYOHrzatUqSETKb+7TORR3yrDtrzQQCGh4Ech/345Ke+eFIZa/NSwtFxZ0xo3zyioY1JvlarXHctI3QnPVxMVjBX3JiT2kF+61VrJmbKW6b4vVQA9w7t13CVjV0LwXb5JC5Xkdy4/a3R7KzQ5j7VLBkp3RmM14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CK4eYF1G; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CK4eYF1G"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-7f4f1354076so270515a34.1
        for <linux-sunxi@lists.linux.dev>; Sun, 13 Sep 2026 20:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354896; x=1789959696; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jnEXefFLpaIksM6/IH6BmftoOS/Z3PWT+GpaSS3SKPo=;
        b=CK4eYF1GnwhIj+aKJRiUKMXB6C+eHja4FBr8XYifxQW4eRIy9WJaSM3VByP+Bly93a
         kRv9m6wt3YEuwFqjRISBLVTWSgIN14KKmIjR6ms8bGoyX51b8lUt5it5nO21FMAZdLAC
         WvpfX3zf27eqVcn0KR2lCrUgBZjRGIbc7XAbsVxHGtwO1ERwigjRqRMwbEHIp9E2ymJi
         NhbPJPx0NBjPeNJqaRAXdpAEDY4RatG/Wa8teTa4hDjIq81/2mTh+L4cSE9aBI6SfLsj
         p2+o/m7r2bC9ddCAmp7mjr0Bbvrn1chiq3T223iyzrl9X2n3b8Rsuzvt+CQ0cgg4FjT/
         BJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354896; x=1789959696;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jnEXefFLpaIksM6/IH6BmftoOS/Z3PWT+GpaSS3SKPo=;
        b=KDlEuh7FD3ztIdMPymrPfQrjnysmWf/9txEmTII+fFfyrUiw4co1ddFmDxrWQbA39d
         Bq0xRbrA7xhjly2dIx5cPbqa0b6DwW4P91j01MwyouQgiOPCFax3YoHysEChjj5fT02G
         O7/0r74U0GpGYiF8q/49WB8JTdMyfcZhdmFOLdwu4Vh0sMMXghoGdphZnsAPi+9/gwOX
         Vb3parjzBfaFxY+jHAovgMi8FuA0iHP7Rom8K4+T9erjLoBesrxtn0h4kcoPlS7tDWbB
         zOpL7N2S+/NZVsHU+J7heEDIJaG1gS3pfBwg1X1M5FA6YL5uEsBb6IRtuJz3fttLEQoG
         DT1w==
X-Forwarded-Encrypted: i=1; AKwUvBx2alzTrNaC0uJRRc6szHUYDHN8+e9Gtww6fo8A6ZAT5H9mW8vvu1GseD+csanWP9dZ7f6ABu+p/g78Eg==@lists.linux.dev
X-Gm-Message-State: AFuF++m6/67W/YvxhMekaRFexAUC7lHu/zrpjUXJSFr0zyEcmQ/nGKWV
	B9Jduvnkoz82RLRXe9241LLKgLfoxFcIwjXk1uRBx9sOwJceQVAUvxEj
X-Gm-Gg: AYBFou0/6sk31EkOIla8YI2A27iFarCQ5otnnkbBNJZcSaBHu3/WGMm+xFdARf3NDGT
	Dj5J+FyjTP/rXZyJtLRaHxI4fhReLsr6M/Db+Hb7YYwvJX4ojqA8ZJudWE7goYiDM/a1p+BzQ4S
	+GwqJN3Ro/rkm51SmOZqpSDXXa4BbRQpvGtU2am8TOFgMNStCAHVR5/P+GKCdywmAbXJclzl9Zw
	+gvLv85Bz3J2rj3j+BArogUh8YDhOCjKIQ6DbGaF2iq4wrUPl03aDoqdnD+7YzCJmFpo40c8ugb
	jjXju/yhL+1FiMUDZDkp0F+mQIHxWwTB6cR4hOKrCzwDIcaA8KhlVSnn/WWzxdy6gy3VcwUacG/
	q7guv8Y1toGrAbTw46zopinRCXEgtt8hTX3zHaLdLX9Xdhe3BR/igp2/AR00yuQabj43Wv1UjHm
	8bQJiOG9rTus7NCeMShQ/VryFSZD8O77/mfSoAcCYAPj+xUe4rBvFOUu2Aa7tuxpNGIV9oNkoQH
	6wKnIteikRRWyy6QZotgP8WjHlUesDCuHpzuj6OdRg+6xU5xnueibIO4ZdIjbn3hKiflEEmxBkZ
	rLtzOLV/d3Qbs/aR8Bp/vKScuCvI5wK78phYrqhCLoYb3tb2peq9QmBPUMl/MsqjauVyeSpium3
	wlDrGg9YVSidKLPKL4ovcPovjdA1HwQ==
X-Received: by 2002:a05:6830:2a8a:b0:806:24fd:7c10 with SMTP id 46e09a7af769-80884cc9d67mr340575a34.7.1789354896400;
        Sun, 13 Sep 2026 20:01:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v5 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Sun, 13 Sep 2026 21:01:06 -0600
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XQz2oDIRAG8FcJnmtxdHazm1Pfo/Qw/kliyWrRj
 SSEffdqemjaXrYgDB8Mv0/mxrJL3mW229xYcsVnH0MN3dOGmSOFg+Pe1sykkL0YQPB81pOf6wg
 XzwMFy4sLNiYeo+YnusbzzAtwpwDQgjBmNKxiH8nt/eVe9Pr2lav07szc9LZx9HmO6Xr/SYG29
 +/S+gTHXg2dIkCy48thIn96NnFirbTIb3YUuJqVldUgxRb3SIa2v1n1yI6rWVXZQQ1GC03Q4R8
 WH1iQq1lsR6AetbMjSvnjCMuyfAIJbfDy8wEAAA==
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

Allwinner NAND firmware leaves the bad-block marker in the randomizer
data stream. On H6/H616 it also places all protected user data before the
first ECC step. These choices differ from the mainline format, which
keeps the physical marker plain and maximizes the H6/H616 user-data area.

Add allwinner,randomized-oob to select the firmware format for the
configured hardware-ECC geometry. Older controllers keep their fixed
four-byte-per-step user-data layout; H6/H616 use four bytes per 1 KiB
step, capped at 16 bytes, packed before the first ECC step. Without the
property, retain the existing marker handling and OOB layout.

Normal hardware-ECC accesses use the controller randomizer. MTD_OPS_RAW
continues to bypass both ECC and randomization and expose physical data
and OOB, including randomized markers stored by firmware.

Address the ECC-error paths as well. In randomized-OOB mode, use the
controller-specific vendor spare-byte erased-page heuristic on the
protected user data from the original hardware read. Older controllers
use exact erased-spare checks, including their first-page and page-127
signatures; H616 requires byte zero and at least nine of ten spare bytes
to be 0xff. Accepted erased pages return all-0xff data and OOB without a
raw reread. An all-zero physical page instead returns a bad marker and
an ECC failure.

Other ECC failures retain the original decoded data and protected OOB for
bad-block and flash-BBT pattern scans. PIO and DMA share this page-wide
classification, including randomized-format subpage reads. Plain-marker
mode keeps its existing physical erased-chunk check.

Start with fixes for interrupt/completion ordering, PIO OOB lengths,
per-step pattern IDs, read/write error handling, duplicate OOB program
confirms and the extra-OOB cursor. Follow these with the small-page
command fix and the DMA register-bank fix, then the OOB-helper cleanup,
binding and randomized-format support.

Use page-addressed reads to reposition small-page NAND in hardware-ECC
read paths, retaining transport errors and the existing geometry checks.
Select PIO for those pages because the DMA sequencer uses large-page
random-column commands. Large-page DMA and the on-flash layout are unchanged.

Bound H6/H616 DMA batches by the 128-byte user-data register bank.
Keep the existing default OOB allocation and ECC offsets, reusing hardware
slots across batches instead of changing the format or falling back to PIO.
Preserve page-wide ECC accounting and a single final program confirm.
All of these fixes apply without the randomized-OOB property.

Finish with optimizations to combine contiguous unprotected OOB reads and
reduce repeated chip setup and register accesses without changing the
page format.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v5:
- add a separate small-page command-handling fix: use READ0/READ1/READOOB
  with the page address for rereads and normal OOB access, and select PIO
  instead of the large-page DMA sequencer
- keep physical reread errors visible, preserve the OOB cursor and retain
  the existing ECC geometry requirements, including rejection of 512+16
  with controller ECC
- group the small-page fix and the DMA register-bank fix with the opening
  fixes, ahead of cleanups, bindings, format support and optimizations
- make the DMA register-bank fix independent of randomized-OOB support
  and the later register-access optimizations
- Link to v4: https://patch.msgid.link/20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com

Changes in v4:
- prepend an independent fix for completion reuse and IRQ timeout races:
  initialize the completion once, finish IRQ register updates before
  signalling success, and drain timed-out handlers before clearing their
  interrupt state
- add a separate fix for aggregate protected-user-data register overflow
  by splitting DMA transfers into bounded batches, retaining the existing
  OOB layout, ECC offsets and DMA support
- distinguish logical page steps from batch-local hardware slots, retain
  page-wide ECC accounting and avoid retrying partially transferred writes
- Link to v3: https://patch.msgid.link/20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com

Changes in v3:
- add a prerequisite fix for the logical OOB length used by PIO transfers
- clarify logical ECC steps versus hardware slots and share protected-OOB
  register indexing
- select the controller-specific vendor spare-byte erased-page check from
  the SoC capabilities, only in randomized-OOB mode and without rereading
  the main data
- retain hardware-decoded data and protected OOB on other ECC failures
  for bad-block and BBT pattern scans (reported by Miquel Raynal)
- retain a bad marker and ECC failure for all-zero physical pages, and
  disable the ECC exception for the vendor format
- share page classification between PIO and DMA, reading complete pages
  for randomized-format subpage requests
- propagate OOB read errors and defer randomized-format ECC accounting
  until those reads have succeeded
- propagate read/program setup, column-change and buffer-transfer errors,
  including extra OOB; stop failed writes and disable ECC and randomization
- discard partial DMA ECC statistics before retrying in PIO, and keep
  correction counts separate from successful OOB-transfer status
- select the current hardware step's pattern ID instead of slot zero
- avoid a second program confirm after an OOB-only write
- avoid redundant column changes before writing extra OOB bytes
- reject oversized ECC steps in randomized-OOB mode before the core can
  fall back to software ECC
- combine adjacent parity and trailing OOB reads in randomized-OOB mode
- remove duplicate chip setup immediately before core page commands
- program each packed DMA user-data length register once per operation,
  and write PIO slot zero directly without read-modify-write
- reuse pattern IDs and packed error counters within a DMA read, while
  refreshing the snapshot after every PIO ECC operation
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com

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

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Richard Genoud <richard.genoud@bootlin.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Boris Brezillon <bbrezillon@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (18):
      mtd: rawnand: sunxi: drain interrupts before reusing the completion
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: use page reads to reposition small-page NAND
      mtd: rawnand: sunxi: bound DMA batches by the user-data register bank
      mtd: rawnand: sunxi: clarify OOB register and step handling
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout
      mtd: rawnand: sunxi: combine contiguous unprotected OOB reads
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reduce user-data length register accesses
      mtd: rawnand: sunxi: reuse ECC status within each DMA read

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |   10 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 1168 ++++++++++++++------
 2 files changed, 836 insertions(+), 342 deletions(-)
---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

