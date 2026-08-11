Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4106233933
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Aug 2026 06:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428135; cv=none; b=BPN9c+W6aX8aJYqXNiLyTy+pcSPRiv2Z/H4Rh3W1dcl8MwZxwB1eb8Vhop7pkLmXlrisnI2tG0cBhKm5q9VLhUDeHczu49DsTFLaOrJV+mXpPVp2z4Xx5x7+QL2b3Z191J0oblyDF8dJl6VoOef+zrbKnvRO8VgF8u62cs7c9xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428135; c=relaxed/simple;
	bh=4KZsUTIpMXmhBOS4m3R6yvkvdE17tCSS42Tb/E/j4vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QaMFMaVT8l9iJKS+71tecRg1aedw8iZosdNztV02gAiDiLYuWgPX3+pOyGu1jsZIGfRljPTo+9bnQ+UqCBQNB0MDex4fbMRY7+HzHmtM5qRRpHdp9hyCx1qJ2tXo60JoGtpeaR6nYA7lhs0GeOvWNz0/rjMz+ZnnDa/xk2LKSlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAC5SU00; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAC5SU00"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6ae9b721927so1721082eaf.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 23:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428132; x=1787032932; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0tAM+5Cw0fi8Tu1hyOveYDdch8B43Cz5ASbfygeqT0=;
        b=pAC5SU00YseNU2xG4YeKqE6DkNE3FS5OoAKAjNRttLHZvr+X16MDDoyFqX3+/2K05Z
         fVc1yM/8zgaByf3X/DbQDAUerV/7ZUJbDIkPPQMc3d1Syt78A6d43Qc9/ss8+pTB0FwR
         vcZejD6wRGEFITBk2ThUFn+GTvuhOTmu+H1UEzfxga60qt3n7KHMC7nDF9kX78ku6q7I
         WSf9Pb7DJDNc/WoufpKcFOYao4wL1yUBAFL7UQaQXFN2kNp/yaSgxb+MohtYmQGCJWr+
         jAqIaYtW2LVzY1mkz+vkIMhCLTvjbzRRrrNtUd92dUgzt0pHtDicYjajGUcGB/roIN9F
         WCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428132; x=1787032932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0tAM+5Cw0fi8Tu1hyOveYDdch8B43Cz5ASbfygeqT0=;
        b=L8bYvH8FLeePcZTU819WOaiiYATLBKGqf+p/F4Qe9ZOXoyiGZOUOd2F+U9AamLRL3q
         33VH7TWzk/aAek0flmUcAWVgtBtDh8edXr/ZXedLbrCXu+Rg4N9vBHe8FWOtlXyLQSZu
         8ogbyJ+W+uc6Hcjpy5HGYBUzsdDhVjg4kZQJc9BhlphV5oiKlR5Q5/nIWhH4hZDOwepk
         ttKEBFxaF7onMCwBWILpmljHF2o2DphVLGKGmZFdFQSXxfoenIaRm6kxDig3aNKcNQ76
         XsOKX6NIb/dugHbEeCBemkyJAGtgbR+tr8P1queAVHaKkrLO/rXQdfH9KalGfiFRQfZd
         dXkg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7PvIQpfnuzIY9+jHgoagMHoMpDwKe/CGwVMtyVnl7gimDUhS164gIrSWY7XhGJh6Oq4ERKt83uRYnug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz60aY5VQqwKPo2Bu2sDfy/jfyxWEZZiupzleYY3/V+2Nk80RXr
	Jc/9qI/AgFYyrwpCJvLLKiWfUb+CRF2Wavan8nXscOVOwDmiqwuhuYyt
X-Gm-Gg: AR+sD10Q82BCvBwjJT6OBjLqqbnKZyAz8zP4G0soyhLOgxS5E82ohLxaQ0+/gHCPFAi
	VEux6/O1vlFAL4d2QNinyNIn7X5wr0qQROjjqMGqbYi8gPtFUTNCKQoPT/ASd/8EF2/m+xUDsN6
	TayNUSyjyGVO7bdfjuMBCPlEXlzMFGvpD0xY1r2tr/X/HGBBb6KEyAyksfrCDOHmJHb4rtVtkV5
	o5w1koFxf5NHR9SaAIe5/R6prTam0r/WbhiNJF73nzfolVHzNWWOk7DjQ/19iudDPgoOpXLC12g
	AWXtVny3X1Ii09oTEvlkrbmW4ihWLUiuW3+M/yWqHPYUlN324xkI0suvdfQSN/lZ7SMl722jlct
	dpa3tR5kcp1bsbtTqoMlDghgL/89Ghd8ak3pKckvNAJDm/6ZcZ4X5un49nSs+UxeJXsXUoV/YXw
	/nn7dPRy6DcnV2YB+5gFyUj4KFAfCmw1vsRyQCINDuDJsedxzrDOh01Nad2I5loLkp4O1ffyloj
	haas5GKUBzhNZfFYOrpZTv9A/sKCJDrMj9qb7WBVfNamGuGOlIJRHyQ4cibIMHKmmepjErbW+mh
	H6ayefLoZQtVQFfdktNPfqBSrP4YDvW9JbWZHpxspdSOKNBAOUJ7t/xe2ogKiDkTFB54/UWVEav
	kF+xF9uqc9FK/nJRP
X-Received: by 2002:a05:6820:826:b0:6ac:a45e:ff84 with SMTP id 006d021491bc7-6b0a31724c1mr316204eaf.13.1786428132448;
        Mon, 10 Aug 2026 23:02:12 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b09fa1ef9esm676004eaf.0.2026.08.10.23.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:02:10 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Aug 2026 00:02:00 -0600
Subject: [PATCH 2/3] mtd: rawnand: sunxi: reserve a full user-data word for
 BBM
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-sunxi-nand-protected-oob-fixes-v1-2-412e50444673@gmail.com>
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

H6/H616 protected user-data lengths are encoded in four-byte units,
but ECC maximization reserves only the two bad block marker bytes. A
strength leaving fewer than four bytes therefore selects a zero-byte
first user-data section.

The OOB layout then subtracts the two marker bytes from that unsigned
zero length, and the controller has no protected user-data word in which
to store the marker.

Reserve one complete user-data word while maximizing ECC, reject
configurations which produce no ECC sectors or a shorter first section,
and make the OOB iterator bounds-safe.

Fixes: 54dcd6aa69db ("mtd: rawnand: sunxi: introduce maximize variable user data length")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 108161fe10cb..01a0d0fa7b62 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1991,7 +1991,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	struct nand_chip *nand = mtd_to_nand(mtd);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
-	unsigned int user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
+	unsigned int user_data_sz;
 
 	/*
 	 * The controller does not provide access to OOB bytes
@@ -2000,6 +2000,8 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	if (section >= ecc->steps)
 		return -ERANGE;
 
+	user_data_sz = sunxi_nfc_user_data_sz(sunxi_nand, section);
+
 	/*
 	 * The first 2 bytes are used for BB markers, hence we
 	 * only have user_data_sz - 2 bytes available in the first user data
@@ -2007,7 +2009,7 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
 	 */
 	if (section == 0) {
 		oobregion->offset = 2;
-		oobregion->length = user_data_sz - 2;
+		oobregion->length = user_data_sz > 2 ? user_data_sz - 2 : 0;
 
 		return 0;
 	}
@@ -2041,6 +2043,9 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 	int remaining_bytes = oobsize - (ecc_bytes * nsectors);
 	int i, step;
 
+	if (nsectors <= 0)
+		return -EINVAL;
+
 	sunxi_nand->user_data_bytes = devm_kzalloc(nfc->dev, nsectors,
 						   GFP_KERNEL);
 	if (!sunxi_nand->user_data_bytes)
@@ -2056,6 +2061,8 @@ static int sunxi_nfc_maximize_user_data(struct nand_chip *nand, uint32_t oobsize
 		if (sunxi_nand->user_data_bytes[step] == 0)
 			break;
 	}
+	if (sunxi_nand->user_data_bytes[0] < USER_DATA_SZ)
+		return -EINVAL;
 
 	return 0;
 }
@@ -2103,10 +2110,10 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 			bytes -= total_user_data_sz;
 		} else {
 			/*
-			 * remove at least the BBM size before computing the
-			 * max ECC
+			 * User-data lengths are encoded in four-byte units. Reserve
+			 * the first word because it contains the two BBM bytes.
 			 */
-			bytes -= 2;
+			bytes -= USER_DATA_SZ;
 		}
 
 		/*

-- 
2.53.0

