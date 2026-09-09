Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE29470451
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942655; cv=none; b=lYSylBMpjlHU8M/A6I5AnAVrBSWB6V1GoWssolch2lU+PkY3Dj7H2VjmNVnGIiDUfP7dZdCuYZonhJEQ6C8A8iMLLhdYaHZ9n9ATJjCraWTTWkp588WIUpqI++BJKYDLZ1uci9x7CzNBrzPMbfHAtudue/tqQ0qsXaNsrWWr/CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942655; c=relaxed/simple;
	bh=lEHwJMINO94gvWByftwvP2znQr+mzWJHZAWNnNtvHz0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uSMOoFBrr/4MqIER/7j34Rlr89HDm5JL/tWebQAGfDOD+odNaMXAfGcPp3O/aJ+pBOMZ8OXAweG+E8dQTF1dnx/Jugg5XyTTiW7+0SjGwf2v4HxHOCqbqiimMdZuXM8f5a3irjFrG9osX0DVUgb7HBvB5YbeC0TrBlRBITo3S04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFuTwG7D; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFuTwG7D"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4e729368fso4774410a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942651; x=1789547451; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XwBZV48nMQMCwCRnzKzAzP0Phs409coXoQQ73JPxJAo=;
        b=OFuTwG7DuQS0mS2Fyx8HrXCSDoxrRWXPvTSmoAzhvtoHRyGGU8X/eezABrIH5TzdFf
         ULh0qx06QQ5iMwbVyOcd8GVsnHx4ZQ1DdkTuH/wy42fRtWTODxBzW9ZrEbzionPPPSNB
         8n37SxRVGon9haH0PMPE6mTkWeNdDIIX9BIt4dhd53noL/ptUbPC+uS17GiLWuJOlGAy
         Xw5/sDtQPIy5HYEzjZBjOtI12M3MV/ka6IJEHxF9WfHYrXsPwK0BAjvKBUqe6iQ/e7+C
         AhjdQCvkrIXvZ1CPD/xq8TwmOQOt/t4PYOy8Y2FkeqyvSuqpHlfwWZ3YHsB/6OvC1ymN
         vOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942651; x=1789547451;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XwBZV48nMQMCwCRnzKzAzP0Phs409coXoQQ73JPxJAo=;
        b=DiBBul0eDPVu/wsQ8QhZYCnWrgDBPD+NtMmMha+12988DjOege1CF/K0lmz84ozcTN
         EnxcTWxxtnUinsfGVYRsHCe2zrYz6+MfiokoSuEbpbIbqRQWv9RvbCE7jWH2Z9KgAOOW
         g/4jxd/MbeDuzgz/5iui1kfVNdowt2PoXIjQQ/X4otyIpk6TXCDsim4SocpSYB7XF5hM
         fC6J5XyrYXIn7RcRa3Ci+reNJjaqTu05qX80ck/aIJ/QCmSLHXZ3vrpAo+gf/cH9oQau
         iXpZuoj1MYWM9yqXHW1PW8bppsp8XCzuCh3LQS78RkdpJGigXl3EFrVr+a23tueNCyv0
         JCEw==
X-Forwarded-Encrypted: i=1; AKwUvBzK/Pj0xk6PqZMq410q4SNQaJ597E4bQtIoc8Ja6sizL8gZ1mMdjTgSh94Ocot5A8rwttg8d70ifc8EKA==@lists.linux.dev
X-Gm-Message-State: AFuF++nc2Xdjri+Y2Gaob6DF6qOU94V4qB+bnuibUufseXyr4pzU+Sn6
	7RYZ6a8Lf6UM1mMJdRSPACSIU/R3jPViz/XYvnNVQwuVtrmQfzRDkiXP
X-Gm-Gg: AYBFou0Y5odEQYeOV9b1ezF/jPDqBRg26qlwEJFmh7j6IrYKx1BeGdHSQzGvb++qnPp
	N8q6xXK33wnuem0ca3BpPhCUYeCPA17eft9JbWG6hn1P3Y8TtouL0EO0ADXqMJKYj+KtvktckaQ
	I39L29jVxviVn58i8d7WVQbnpD0nEBPf1d9L0n+N/r1PnMh0DOPr6rVxidVMQf+4Fr/cH0QuKHA
	IV/o2esxKuXivSzWAO3Uoq/VSjFpJY+32aij4z8nYmD1KclOJAsMoScCADy/nvjSO2obmBLUEzz
	3j2WrADa2v4YQg5vyD/ywJ3kikcA8WHMPUc8xuvLxXFuax2xKyRAkvi+88t9BcMuRh2d+vaih0B
	MvjJw/Ii9nK/oH0HCpDFftmGR+Gvjh8FkJmponXJhLUhcIwAaXkbaCQr2kb3ovCmhweZ9QDiVxG
	S7w2PHVJ+FATYB6Br7ss2EDCwqU5BVRR3QqpWdcoHHwLAtk8BnKD6MjdnTSoIWlCVlq6X9ha4Zj
	XpgsBkBJbWj74eZ1qMvIZ9chfbeJJQRPYNtQc0bXwj+IpEgKLYqXLgHc1b/83uZqwhXi36IWLq0
	5Vz2AFb2XpORYtVAYgW8/ADZw7NjWs1PDb861dJlIEdrHGgxjhc2MKkNZN8psM9TX9HWSw1ULBw
	4F9fRD6zpoQbGKb7lCBi7AxAUeiNT
X-Received: by 2002:a05:6820:1893:b0:6b7:8415:d785 with SMTP id 006d021491bc7-6b78415d897mr16470897eaf.48.1788942651425;
        Wed, 09 Sep 2026 01:30:51 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:30:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 00/15] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
Date: Wed, 09 Sep 2026 02:30:33 -0600
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOQQrCMBAF0KtI1o4kaaytK+8hLtIkrSNtIkkMl
 tK7m9aFLhUGhg/D+zORYDyaQI6biXiTMKCzORTbDVFXaTsDqHMmnPKSVoxCeDQDxrzsE8FKqyE
 Zq50H5xro5egeERIDUzAmNKNK1Ypk7O5Ni8+16Hx55yzdjIqLvlxcMUTnx/WTxJa7v0vzUBBlU
 e0LyYTU9akbJPY75QaylCb+YWsqfmZ5ZhvG6UG0Qip5+GbneX4BQC0u1kUBAAA=
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
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
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

Prepend independent fixes for PIO OOB lengths, per-step pattern IDs,
read/write error handling and duplicate OOB program confirms, followed by
OOB-helper cleanups.
These fixes also apply when randomized-OOB mode is disabled.

Also combine contiguous unprotected OOB reads and reduce repeated chip
setup and register accesses without changing the page format.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
James Hilliard (15):
      mtd: rawnand: sunxi: use the logical step's OOB length in PIO
      mtd: rawnand: sunxi: propagate page-setup and erased-check errors
      mtd: rawnand: sunxi: stop failed program operations and disable ECC
      mtd: rawnand: sunxi: select the pattern ID for the current ECC step
      mtd: rawnand: sunxi: propagate buffer and column transfer errors
      mtd: rawnand: sunxi: avoid a second program confirm for OOB writes
      mtd: rawnand: sunxi: avoid redundant column changes for extra OOB
      mtd: rawnand: sunxi: clarify OOB register and step handling
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout
      mtd: rawnand: sunxi: combine contiguous unprotected OOB reads
      mtd: rawnand: sunxi: avoid duplicate chip setup before page commands
      mtd: rawnand: sunxi: reduce user-data length register accesses
      mtd: rawnand: sunxi: reuse ECC status within each DMA read

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |  10 +
 drivers/mtd/nand/raw/sunxi_nand.c                  | 948 +++++++++++++++------
 2 files changed, 689 insertions(+), 269 deletions(-)
---
base-commit: 7e874b1750a40f3dc9a629aeb72eba09c77f77e9
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

