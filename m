Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1293D43802B
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 23:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403107; cv=none; b=kgOcr1tldBhu0fz26d8fMJVXvPIdZBuYdycWuFS+dzt7WBAOCE9PndlHykMHwn6DOnT87JmHfrlULKEvLpGXBFI4aKThthQnLpsPC1okEJwiJHuMRV6bjceJG71d9GgdOCCvZbDSYNyNfCRkcqnZp99G6N38ZVzXbTy6eL3hMVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403107; c=relaxed/simple;
	bh=d2jVZl2zwD18x6XmwVp2/7ZIbxAPDvJYdaWhpYa/9+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AhNn74cLaSQovEKCDVtxNHP2JuL+nQPUEy28V8Q/NPnVBAJaV3bJQnHoUhavUEBO42q8Qqd8+vr9bc1O5Da8vX7jhuVSB9W7D6H6NJBICVE0o90bOphwvylNdISzWauxg+py9ruvnKR60q+LC8CHu9lc+2Y+iyXy2vud209xgPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceqK+l46; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceqK+l46"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7eb63dbd229so292611a34.1
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 16:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403104; x=1787007904; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgRrZ9Syd42HBAGwa14VS7M9xbVwRyd/vuhJqBFFn7w=;
        b=ceqK+l46i+7tUBGJ6AOOmSGQxGkXU1VSRQvgxKU417w/Nj3ODqU6LQiaue7PcaGCcz
         Vac+dg+aaffqcVlkD6CdYP7mM4YJ4MbOtHn5CLKDuOJYUbAgYeWw1u3u3OlVaiCfKN1h
         l10UA4F1P/PngRk64xJWO5iBCxA9FB8bWQFl8OkEVlhPbFS2lWWIZVZNbm4qWyEjwl0e
         eYG8IUMaIdShFVHhS/WVXY/fIh7MtjjgMabvcv+ALtEhZnPPXMrSTAEwYgkP4pRVdd7P
         6uJPLUw+ztG8yNC6uSSNvfFqrel+FtiOaQEHKLWC52kSSkg1alzGGrdRyXZMcAgrRTIH
         YaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403104; x=1787007904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgRrZ9Syd42HBAGwa14VS7M9xbVwRyd/vuhJqBFFn7w=;
        b=j+venERLKWkZbcOEo5oGdHV6dR3eAldHn0q09/wv8mJp+2GJvl4ZYKwI1Ehx/6DEhW
         PR3QzIZSS7vf43Mm9rXT4RZ84Q8SL3fUF0s+dIaiw9dMVQzlIxAX5lm/ogzyxXCfD6Q4
         yCDimav6YSlAtlaRHRneWqHBEd0cvr1GnyjrL0ARbCw8nSyue5N3aMO1Jbb78dNdP8Oo
         31s3HF2JjQ+wKRPvI75FGiVSmusVAyi3zKloPGMwFlloL27KFg0gz92mL2ByBVKgV3El
         OzHSo2sfXR8ryJf6/MvlzGpTgpkpn5jRqzSmSA1grMJP31F3adRKttZlhqmhJn/GXKZZ
         i68g==
X-Forwarded-Encrypted: i=1; AHgh+RqCduf8rKxh4FOL1QY4eRncfWwxL8BknGyVEPOHkBPR6e7zojrbN0HF5Zjae0zfnHD/2jgs7c1x60PFaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywco4WvO8PRuHNhjmUi7blbCC9gI5U31h73RO5JdxvENa527k6V
	O5xHUMuxdRbNgiARlOPXQwoNWv23rxSomBrGxJOKyV0J2OZX/khQl4b4
X-Gm-Gg: AR+sD13fSy+OoFGPpwSh62Wt2qQv2Oq4kuOuaYc4ode1s2Es47dV0j94pnooIaX+ZXo
	e+4/NG+vFsXVydOhfBToEvx7n+Y7u66HgMnNwR6sErldwcZqrdI9H1BVPYKXdrJkrNuF0Bd41TA
	B66BWAKtoCW3rxQ+UgKnqa4Jo7NsCWQy1fFWYH02GWXSwGoNMVvP2kF2Bfzts0aC5+1xtF9cJFk
	x9uXTURTliiRoDLZHvRRX0U1ex/2SawypIRdBqHO7dNmkRWCpniTXZGBVguqe/nyuGTXfkSQFul
	OBHZx9nezN4RiMj5Fvhb/UPmOaDHfFQhEPm+wRJR1taWr5zmr9vEGsUfSddvqwKXBbRYASp8NpA
	dQPNExZq8/LqV7/6pKKhMinQ9R0vPHX5bofJRbuE1Up78Yv5GgiaOjVVnzECy9iRQaBiUCBxmjI
	XCIt9TXRu2D3XmPwawGHscpFUvQYkxlOoA+AygWxeBNMjxYPvY17quiHTzIApCYd/UAAtS881gD
	4pqizu4KAmkuz8h2uu6ODdd0pkMmZyxreMWhWmKyD9N1qUsujbBmNt5U+6wmSJahVqIKtg7lmLx
	o9JKutf/iC8O941Z/gtv7oBEdRONTSDMY4tN7j62QDpodSwhCyhQL3vbITwszvfTpFJ72mla1vo
	weatmERjsbI/AS0wXFghLdj4sGhg=
X-Received: by 2002:a05:6830:ed2:b0:7e9:f6b7:7752 with SMTP id 46e09a7af769-7f3a12ff443mr383041a34.12.1786403103828;
        Mon, 10 Aug 2026 16:05:03 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Aug 2026 17:04:50 -0600
Subject: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
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

The controller randomizer covers the bad block marker along with the
rest of the OOB data. The driver currently compensates the marker bytes
before writes and after reads so that they remain plain on flash.

Allwinner NAND firmware instead stores the marker through the
randomizer. Media using that format appears to contain bad blocks unless
the randomizer is enabled while reading the marker.

Honor the allwinner,randomized-oob property by unconditionally enabling
page scrambling and leaving the marker in the randomizer data stream.
Keep the existing plain marker behavior when the property is absent.
This changes marker handling on all supported controllers; the H6/H616
protected user-data placement is handled separately.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 45ccbce91551..92b26371a6d1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -264,6 +264,7 @@ struct sunxi_nfc_timings {
  * @clk_rate: clk_rate required for this NAND chip
  * @timing_cfg: TIMING_CFG register value for this NAND chip
  * @timing_ctl: TIMING_CTL register value for this NAND chip
+ * @randomized_oob: use the randomized normal-page OOB format
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
@@ -276,6 +277,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool randomized_oob;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -945,7 +947,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 	}
 
 	/* De-randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob)
 		sunxi_nfc_randomize_bbm(nand, page, oob);
 }
 
@@ -1006,7 +1009,8 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	u8 *user_data = NULL;
 
 	/* Randomize the Bad Block Marker. */
-	if (bbm && (nand->options & NAND_NEED_SCRAMBLING)) {
+	if (bbm && (nand->options & NAND_NEED_SCRAMBLING) &&
+	    !sunxi_nand->randomized_oob) {
 		user_data = kmalloc(user_data_sz, GFP_KERNEL);
 		memcpy(user_data, oob, user_data_sz);
 		sunxi_nfc_randomize_bbm(nand, page, user_data);
@@ -2219,6 +2223,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 
 static int sunxi_nand_attach_chip(struct nand_chip *nand)
 {
+	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	const struct nand_ecc_props *requirements =
 		nanddev_get_ecc_requirements(&nand->base);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
@@ -2228,6 +2233,9 @@ static int sunxi_nand_attach_chip(struct nand_chip *nand)
 	if (nand->bbt_options & NAND_BBT_USE_FLASH)
 		nand->bbt_options |= NAND_BBT_NO_OOB;
 
+	if (sunxi_nand->randomized_oob)
+		nand->options |= NAND_NEED_SCRAMBLING;
+
 	if (nand->options & NAND_NEED_SCRAMBLING)
 		nand->options |= NAND_NO_SUBPAGE_WRITE;
 
@@ -2457,6 +2465,9 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (!sunxi_nand)
 		return -ENOMEM;
 
+	sunxi_nand->randomized_oob =
+		of_property_read_bool(np, "allwinner,randomized-oob");
+
 	sunxi_nand->nsels = nsels;
 
 	for (i = 0; i < nsels; i++) {

-- 
2.53.0

