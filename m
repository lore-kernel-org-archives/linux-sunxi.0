Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6813264DA
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Sep 2026 01:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570341; cv=none; b=nrnAsCH9Drk0Zj5QDTz6LCWxfbtHOWxodHBhdNdIekC2ITNlVPKhNpeinwAMDYZcny8vgCDU6sCpkkKuSADXqUcQOEQMArEnyVjAy1yF0ieGZskVdi/1rbzG9fzHZA7argwPLSTqKdD+WOMlLshqGQQJJLnrfppEFhmsLuyCIac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570341; c=relaxed/simple;
	bh=AZeymz/HujPlsyjjrcRekc+HnX3LbuE7qM8Hmou01do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hOv5EzYxXZmykxjvU5C6VsH0o5LMAeITAs91jZwdOtkWLiuhrJEB74FaIcQGpnW35qct44bHZLu8WBJ4zxc4tQmv28mNV2nRMCPPj1PxX1de7G2IPbYRRWCWCMfopYKUtgoO0EnUYx35tNHTM21gfKyUqGxjSicQO3sxTNtBgR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aONC3jB1; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aONC3jB1"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-465cfc7e33dso994438fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 04 Sep 2026 18:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788570339; x=1789175139; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+trEjFtLc9/1KfuFoq6WFVPGEpoZWjiCbNYrmRmER54=;
        b=aONC3jB1fEx3UZ6RlIBfkvoxOtXJl17ttCKCGsP8cX03qvfNbM77kOy6BQ8Mk1XJlV
         uVOA8KjSa9R/DBEb4Wp0BLeZ/pTl/SHWRwlw2sQAJQ2HC4OwuYwr8yVshaPPsEMRuZRu
         yBDQqdn0iDFpy9OpDe05f/d8lSWEgkrbOxJ5fIUoQ4lqwdShM6V2YnaEGPDVWrUbJxKN
         shwI0Bk06ZQMLwWXhMQzGW9+evSvjgLo7DQa+vSAUd6Fp12e73R1z9tK8PCarQopdApR
         qPAAeFCiTF2cYr35i4k4Om734MgXIOxwKq6qTx+g8lxpurPVaJ4dS+1G4187nnpCWfXF
         imIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788570339; x=1789175139;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+trEjFtLc9/1KfuFoq6WFVPGEpoZWjiCbNYrmRmER54=;
        b=KRDpOjj32SqyThkPDxEGRhiEPtoNOpJhKiLCzPXzbsQwo0Olmp0qagrJfTR8Pe7Wtk
         Ce31c6RQ4J+oG2IvtSZnF25KnHPtK1tm2Xs3MIYx4UlJDXW0m95zBH6C0EuM5/D9+PK2
         qT7zPYC7OIOpQNXAAURN/9zlHJsjQWnhHPxl3IOoSSbLHrQhYmtfopRFZwCq62MxtEQB
         s7PywQfZdm+wOBzApVl4CyYFEnya7TplvCJbejJ9m07y2IJ395i5hIqhjd4GCllv8YeQ
         I/YE6AHpW3kjiB6QsOx/C9qFA9rCLYeAgNJs5UYcxziFlWRhY5pr0JplZGcgxlGLw0xr
         Gb3w==
X-Forwarded-Encrypted: i=1; AKwUvBy8cVUQlqBzVJUzcHZjQXneP9N3CV9qOQxiIWHuwt9woilAMO6dhAzlGpX6rzD7Kt/354Q/pItINzJtuw==@lists.linux.dev
X-Gm-Message-State: AFuF++l7YJZ/VBfHo8Og0OZ836Q+N44KeT5a4kzRB+ONcjg0cipDR/I0
	BEenf14GX3GeA2HDyt9U7OciQbccRO2NJUr9RF8v2iuTczfyMqvYEBh6
X-Gm-Gg: AYBFou2NytX2kOaelueVeojkYdtv7vRR+0xj3QYBQae2w2yDaS0Pb1/nKOEajhxZoUW
	Z5iZLoqSP0zB/FUKzYgV0IrfF8FydajRSG4iAx3regN5o3VDQte77b3G9IQYlBv+dUH7U0s976K
	+s8GGSj6+JtFkxWc+Tt1rOW086fqO4bP7CyZv229XtVl8JdNGPXAFa0aL3bDjoEwLDATtYjK8XA
	FnUt7jSGSerK6K5V9bykqY6wCHrDI7BGQvvnwviXFaoDFnblCVxA3uaIcGOZzhuoWQtdDRgrCIY
	luDj5sNhWNxnpa1GOVM7lNPOzFRSxRPHNDfvXuAY+gGUkJKmS/M9wtF5D2rbFJT4XN2ap5Sr0d2
	tdZAaSJbFYOTmoULnaHvzvgRX2i3I+pwEkwOxoWZBk0kU0MKMi8xJovfAtU2JGBFoAiJF/1g8yv
	wN9IIL7qW1ufOxQaSh2FZmYk6Mgq6Lq7+jrXYI1O0+MzwplLCdeD1JOk2Gc8d90bR9xU3anDJVl
	pSC4v738b7MDq+araU975MUzf0dLuKJ+KBJJ6QZC21KAJpt96AfIAslDrcaqAnDogm5uoRy5Hjw
	du/y/r8aMqO52prshaV+mRlbWzfCTnnGk5MjDZPHfooaYg1YioOSMt4fnc0fZPFJIvZZ7LTI5t1
	Cr0IB4HqPWTYNgVG73QI=
X-Received: by 2002:a05:6870:318c:b0:475:e235:8fe with SMTP id 586e51a60fabf-475e2350f4emr4299634fac.28.1788570339228;
        Fri, 04 Sep 2026 18:05:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-475544fc87asm3337849fac.10.2026.09.04.18.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:05:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 19:05:37 -0600
Subject: [PATCH v3] mtd: rawnand: sunxi: reject ECC maximization on small
 pages
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-ecc-step-validation-v3-1-931cec317c10@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOTQqDMBSEryJZ95UY/7vqPYqLGF/1FU0kSYNFv
 HujPUFXwwfDN7Mxh5bQsVuyMYuBHBkdIbskTI1SDwjUR2aCi5I3PAf37mbyMfRKoKXuAZUC53G
 BICfqpY8G4FhUKa/rrsCKRddi8UnrufNofxxFL1T+kB+NkZw39nMeCeLo/bsZBKRQYtbJUnDe5
 PV9mCVNV2Vm1u77/gWdcmsl7AAAAA==
X-Change-ID: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

When nand-ecc-maximize is set, the driver selects a 1024-byte ECC step
and divides the available OOB bytes by the resulting number of steps. A
NAND with a smaller page therefore produces zero steps and a division by
zero.

The older controllers also provide a 512-byte ECC block mode, but the
hardware documentation describes that as an ECC block size within NAND
pages whose supported sizes start at 1024 bytes. It does not document a
512-byte NAND page mode.

Reject pages smaller than 1024 bytes before deriving the step count. This
prevents the division by zero at the point where the incompatible
maximized geometry is selected without changing explicitly configured
512-byte ECC block handling.

Fixes: 4796d8655915 ("mtd: nand: sunxi: Support ECC maximization")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- reject ECC maximization on pages smaller than 1024 bytes instead of
  selecting the 512-byte ECC block mode
- leave explicitly configured 512-byte ECC block handling unchanged
- clarify that the hardware documentation describes 512 bytes as an ECC
  block size rather than a supported NAND page size
- Link to v2: https://patch.msgid.link/20260904-submit-sunxi-nand-ecc-step-validation-v2-1-6e3ba6200948@gmail.com

Changes in v2:
- fix ECC maximization at its source by selecting a 512-byte step for
  512-byte pages instead of validating the derived step count
- retain 1024-byte steps for larger pages and the existing capability checks
- rebase on the current MTD nand/next branch
- Link to v1: https://patch.msgid.link/20260811060651.227431-1-james.hilliard1@gmail.com
---
 drivers/mtd/nand/raw/sunxi_nand.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 83666dd6cb2a..c84f304fb749 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2084,6 +2084,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
 		int bytes = mtd->oobsize;
 
+		if (mtd->writesize < 1024)
+			return -EINVAL;
+
 		ecc->size = 1024;
 		nsectors = mtd->writesize / ecc->size;
 

---
base-commit: def559a215699aa2f2d8ef98f30156b9d562a154
change-id: 20260904-submit-sunxi-nand-ecc-step-validation-0e571088b5e7

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

