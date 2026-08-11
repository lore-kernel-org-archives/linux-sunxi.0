Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE25E37B41F
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 06:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428131; cv=none; b=ntdWVq3MGwAEU3IOm/euDqAEDWe1Z0a/InqlRweNTkJRhv0yh934vZQx3lZroCOR5rl5g5E5AxEVe/V/4LAL80huTLRRvfAEqjts2dvZfAQ4ZK2ZhcIIqKqixPSiUvnA2hj8Wm6RkCA+b9Y8Vck0nJ+y0m9S26dJOkN3rpZ3x9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428131; c=relaxed/simple;
	bh=a+rvHOFZ/RlMQKFoJxRxWN/30vRhfT5kdAtQoaSfUx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QhFfgKEd5IYeqIZj5haKtuQeFdwPiVdDtyQahsy8MhFAZGnNmNieEcwvTBwg83fSawY28coUwUPYkHLgoEH2I9YtzGrDMaJBmdsoV38U8Ydehls3/YM9zCw54zWOhMPAuBhsEEq1ZZA6NBYMQaRMOiNU7yDLAjAocjPIIOPdR0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ql8NrTky; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ql8NrTky"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6ae88f4e4f4so930587eaf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 23:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428129; x=1787032929; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvW+vlkykLKhHUV+ggRmJqGjwZhBqy5a9qXoHb1/+wE=;
        b=Ql8NrTky/BL1vz7kRwKsHsyFq3OwFVDbBidqmYIcM4gMdsK+SHyxOq7JDkZQ2/R3i2
         lS7CvRNH+2asIKGhgYgbSykRf7hQPDJrm9PQAaLw9/upRficBd/e9xIZ2pkb6ZEaBfAy
         YVEusDGijBDajUbyNpqhZ/QApcZyKFiG1yxNiH8ePVKNGZQFanL/nhql+oxdwTutiWAE
         TZw7Vm+l5ykA6pn5+Y/PN7V4siAFyHYT1tpA0j0pRzcpib84PpRjcYARCHyyZ5qNe2Ya
         31+5QnOMtTfdHyLBwCZTtPeegk4HbK7IdbMJXeF+nDZKe1OZOH6Umnk7c+qJV/Xq/p5u
         HNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428129; x=1787032929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvW+vlkykLKhHUV+ggRmJqGjwZhBqy5a9qXoHb1/+wE=;
        b=AUJSR5BlWS+ZHoWjLpKTca1UDB1eLH0L1+asLsNhnAdFJs1AtiN2BDG/0w8q1ZXOvF
         Y3YiEVFmHNE213mrnbKnY3cQxtgW1RO7p3MP7NwjtR8GakLaK5gHckfOVM1BpYAgcTgi
         uVSequyE2G4M3514gbmqgX4qyDi6+lPSbgLuLjfvkf1InUXHNSYpZ12rgk+qe/vE58/8
         jD1Rb67UFSueULJl5aRs5Pww5T51lLeoHUZuoXUCdqhsteuIsci9CQxPjHiDhb2VJlRJ
         jLD/LzsWZ0utLG2hevR7pzu4lJKH3THB++I+OVpycsPa6t7gvEicdICJfayhgghGkwNe
         bVyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIEmZBYXw7Yt3XK7nKSbV8bo/jgz3ZEQzzJVKPdWklkQProc+5Vzp+/RnzxKVjVogInoQDS2H2Z4fG5g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/dFhFDaQaJkYY+KN9UQJjnFEX2RPm8Msi+J32IpoY1HCS/vaH
	SdUquu911T2mSbBfyKEJNNUapq8QUIGyr/nUDI6VK1h24vXddKY+BGgg
X-Gm-Gg: AR+sD10rnhhmkjkTvaTzXNZyUBF/RQjlZ6/M1NJ0zdLnKPzACElVYKZpn/PRhDL1zFn
	ubyisYrJDt6TRl98zCTsAtz8sGIhti6mHUq8UjZSnGKCnbR5ncj6toJ5JMiBC4w1Qkh/kdPpmQo
	anGBw6owMRoP/cmMX/3RZRFfDBelFaShhKZqYXKcEvJbFaGCkHvdxsxea1CO3zzT8f421KWrP8G
	4j+2pcA0C44E3bKTh4HtDLWJ3w1mUVhoEVZGLvmOBv/I6OB99gi9rRAbW4QnWF+Mm6Gm/A/YTNC
	7DCZl6yoQY3xbdjMJcRXVs3m77QgfreoWnXhzwqiIMrd5knbebwmG0sHzqQ3hgcgsS/P4k7/pmR
	YW7j2+AT8QBIt8MbS8hm+a1uSj0DjyoQWIE+y9w/a+w6XZbFFLiJWXahlJ69ZuUZ3Yp6nF/DTYG
	G22dJYHJxkWZQlr+hq5xycqZAz8DICZlhOBfCzfVbFCmOHcY7fnXrmAROWjtDeZ49bTD4zcTgJZ
	0Wir+Sa2lwDM00ZCUZzIAZCj0VgmgJIKiKPu7GCN/3/UpgaZ48uxywa0hbSqgJ98prtgD70kxf2
	zUiWPV6CO4LUwKm7ysQ4VG7LQqBuNNguFz/xwNOIXFKcSaMQslrQW63jYHk6rbva+QWV3smwwvI
	OM8bQooU85zEZ3z0tVc55st+UzCA=
X-Received: by 2002:a05:6820:2015:b0:6b0:4d2c:1bf1 with SMTP id 006d021491bc7-6b0a2ff070amr388872eaf.11.1786428128806;
        Mon, 10 Aug 2026 23:02:08 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 00:01:59 -0600
Subject: [PATCH 1/3] mtd: rawnand: sunxi: propagate user-data allocation
 errors
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-1-412e50444673@gmail.com>
References: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
In-Reply-To: <20260811-sunxi-nand-protected-oob-fixes-v1-0-412e50444673@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

sunxi_nfc_maximize_user_data() returns -ENOMEM when its per-step
length array cannot be allocated, but the caller ignores that error.
The NULL array then makes sunxi_nfc_user_data_sz() report the fixed
four-byte fallback, which is not the layout that the variable-length
setup calculated.

Return the setup error so an allocation failure cannot silently select
and validate a different OOB layout.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 45ccbce91551..108161fe10cb 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2072,6 +2072,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	int total_user_data_sz = 0;
 	int nsectors;
 	int ecc_mode;
+	int ret;
 	int i;
 
 	if (nanddev->ecc.user_conf.flags & NAND_ECC_MAXIMIZE_STRENGTH) {
@@ -2169,9 +2170,12 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	 * The rationale for variable data length is to prioritize maximum ECC
 	 * strength, and then use the remaining space for user data.
 	 */
-	if (nfc->caps->reg_user_data_len)
-		sunxi_nfc_maximize_user_data(nand, mtd->oobsize, ecc->bytes,
-					     nsectors);
+	if (nfc->caps->reg_user_data_len) {
+		ret = sunxi_nfc_maximize_user_data(nand, mtd->oobsize,
+						   ecc->bytes, nsectors);
+		if (ret)
+			return ret;
+	}
 
 	if (total_user_data_sz == 0)
 		for (i = 0; i < nsectors; i++)

-- 
2.53.0

