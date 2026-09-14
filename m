Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD6248F848
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 21:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420222; cv=none; b=cH3eMdFZ9jXCEDFwf4M/wPVx4zIoxQueuaK8ghlouoBLnxrfy8dgxcMioFM/m0y6YqwiPuQl0w97x9YPMGdaa/4WiDDCox5iA0OE8BQ8mWAl/mVJUOSCHx6daJNZfe80W4CJzS8ne04ijmfTgXCMaJB2aXVLXln/0zjchB6sKp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420222; c=relaxed/simple;
	bh=bniJ2L4Tvp9lAApOs8qjlReFeiPBCiiQVEC33ZRnv2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHvZgbyspc3zWh2m0kxgEJJoEIgclPFmXLL1SKUGVTIm41kgfXAzRjMN2VnkMhK9zTprvKabfruOseBsV9cEZgtI9YEen6deXrFAnOalzRjpXbx6AORfLyHdmeM/oquJ5AiBFaGgWrzq86GHnNxzoJ31YjWmfErcDiQvnjPL9ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT2jSE30; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT2jSE30"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6bc475ffcbfso787673eaf.2
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Sep 2026 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789420216; x=1790025016; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=;
        b=TT2jSE30zjQjmq5crvljO+HYZw2PwxDZn+X6YUqVmPokaHOjR2Zle0F7PMGA3/0Fwv
         VrT9wLk6s+db/cnSXEfwyDu+3lVhtTaCQrFvhCBufujjIgYIRCyIoAw3TOUGbSl2X6Bl
         Q1dHvV+9fyyLTjdJHvxZ9wQRleE/VQa1Awc0Sy6VxdbDAYxRUWcup6OkIXW8TZSHtY8V
         QkcMwD7Brwgrwa/Hbz2ceyjxOHd9nFe8WzXuZX/mx1APGNXZOyEKMmgaWZnuiF+9HrdG
         iyG92WyeVEXB9gIUodpHE36zknLezY9ONHRiBsO5UgpJXzyLxR6cyRISDQtsS/UnG0yc
         EgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789420216; x=1790025016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akH24Z1lLy7buBHyV5efDWLsUp/yg44TnSGfRiXVwiM=;
        b=Iw9lnScp9tbFBvF9LHi38uTpS1tay+3jdevq3+N317AzgKHRYq2t4VJ5NC6oPXbCVZ
         WNLTAbWOAbaGs2AFwpe2kH4jmGnJo8y0xbTE7tYzBB2dY/S0N+k+vFXlmebNsjdDlxCV
         9fLgRIyYinrJFcEjfEFPHMjiKvFRfirNIyl9/yBhu0c2SoqwMoKaP5tTrXZifBL1XiVw
         ZAHMUANE8IFVwAfhz8zdTeQ/RbJ8Av58kU+Mu0k0tR/CU2Di4r+INppu7nnafKeU9NI0
         NtXMBqD2MxYBWy2miXQm7VXTDelU5/AuxdPWFphgO53tcQGJc/IJpiMiM3eP7CAs5kHO
         DUGA==
X-Forwarded-Encrypted: i=1; AKwUvBwKuS1z33ppKAumw5nqCQdjOoH5p6vWGYWF9aAEO9oOcNcMr7NEriQy0xNydMDAPVruI8X1v1sGxfeuqQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kKAGVTijT6GA8o66Q9F/7agUMNwqyNCKosf3zkyGfRAU5h/xgF
	WyqibqwF5QvT7SXlR8agmMWGVwFz93KSrYdBqm4uIZ6KjvaBfN/mzPPX
X-Gm-Gg: AYBFou21bEreoyW/q1nf6jINQMDUNeG0yESjIpwtnZs5wRpQM/7ZXM6LMkwzalEhpem
	P0ap+J//fr+8CosMjql/tBaZcZnXWUkh18iA2IcLWLXm4sQ8HjFBvkdkAPeyyOfsvBYNDqQGXwu
	oQwnNGDUn5hgRlQoy7i/jGQKW2M6cAgGz7vwyMePXuMPF5JWq9lfrQ0p0F6GoQLK7bB6cu5zq3u
	JY4n5qloIOmnIBMgC4N3ufM+NxHspXXdxhZbRATjgktWQ/HfTyt/0zpzEu+IkSdihEM6oBZFRzX
	t+N8np4fTWK4lGQh3JXqHl1Ijys5e6O0nHR1xK/r5PohTNeImEYOWWwVQw8tzHHh9hEz7jbOF4Z
	NFF1WEiw1+Fe1xDKOQkgEIQoMcSfFgQXwaCHo07KT/cu2Q4DW8cjKUu/5PJTaBI+Iy3338s/kZE
	jX7nUcb6R9ktMh5hzs9E52mYhiL37tUZj+Hxf6s/vVuvb7NiFsBJUebRMbQQ6CD0YGY7fCQAfA4
	fZ+46NfAoErmLNswWkn4Bz7c2z/OJBZ8q9ng3vSEozAQIEzgIJu6WPDU1T2d49KQy5/amkPSP8v
	34g/2ichdyh8ZBpXxt/kqEyp/1J4KCngRN/b8M3FSb0r+k5ECN7TZOGzgbrRZVG5+J6rx/6wY+q
	Vr3XvWJzFzn2YTBh8k3hTo9vkY9Dic6aNviIv1zA=
X-Received: by 2002:a05:6820:8c5:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6c53ba3546bmr2248641eaf.0.1789420215927;
        Mon, 14 Sep 2026 14:10:15 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c45bfc3fe9sm4698544eaf.15.2026.09.14.14.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:10:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Sep 2026 15:10:01 -0600
Subject: [PATCH v6 15/18] mtd: rawnand: sunxi: combine contiguous
 unprotected OOB reads
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-15-2fb084fe0751@gmail.com>
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
In-Reply-To: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
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

The randomized-format OOB reader fetches each parity region and the
unprotected tail separately. H6/H616 pack protected user data before the
first ECC step, leaving a contiguous range of parity bytes and tail data.

Combine adjacent parity regions without crossing protected user data,
and include the tail in the final transfer. Keep software de-randomization
separate so each ECC step and the tail retain their existing seed phases
and PIO/DMA representations. The NAND operation parser splits transfers
which exceed the controller SRAM size.

This reduces column commands for OOB reads without changing erased-page
classification, data-only reads or the plain-marker paths.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 8b0d0620e1d9..f3234d2831ea 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1435,14 +1435,28 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	int ret, i;
 
 	for (i = 0; i < ecc->steps; i++) {
-		len = sunxi_nfc_user_data_sz(sunxi_nand, i);
 		off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
+		len = ecc->bytes;
+		/* Keep decoded user data, but combine adjacent parity regions. */
+		while (i + 1 < ecc->steps &&
+		       !sunxi_nfc_user_data_sz(sunxi_nand, i + 1)) {
+			len += ecc->bytes;
+			i++;
+		}
+		if (i + 1 == ecc->steps)
+			len = mtd->oobsize - off;
+
 		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, ecc->bytes);
+					    nand->oob_poi + off, len);
 		if (ret)
 			return ret;
-		/* Preserve each path's normal representation of ECC bytes. */
-		if (!dma) {
+	}
+
+	/* Preserve each path's normal representation of ECC bytes. */
+	if (!dma) {
+		for (i = 0; i < ecc->steps; i++) {
+			len = sunxi_nfc_user_data_sz(sunxi_nand, i);
+			off = sunxi_get_ecc_offset(sunxi_nand, ecc, i);
 			state = sunxi_nfc_randomizer_state(nand, page, true);
 			state = sunxi_nfc_randomizer_step(state, len * 8 + 15);
 			sunxi_nfc_randomize_buf(state, nand->oob_poi + off,
@@ -1453,10 +1467,6 @@ static int sunxi_nfc_hw_ecc_read_unprotected_oob(struct nand_chip *nand,
 	off = sunxi_get_oob_offset(sunxi_nand, ecc, ecc->steps);
 	len = mtd->oobsize - off;
 	if (len) {
-		ret = sunxi_nfc_read_column(nand, page, mtd->writesize + off,
-					    nand->oob_poi + off, len);
-		if (ret)
-			return ret;
 		/* The unprotected tail uses the page seed and its 15-bit advance. */
 		state = sunxi_nfc_randomizer_state(nand, page, false);
 		state = sunxi_nfc_randomizer_step(state, 15);

-- 
2.53.0

