Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7957538CFE1
	for <linux-sunxi@lists.linux.dev>; Wed,  9 Sep 2026 08:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942664; cv=none; b=V7uf+HUKsMQmo5sD9JlkB7veG7PuNaDvgjnjI8k1NYjv58MycI9IKRi2wCdK88sgBhiP8W7/ueq7+Ms3owadiADmlCiYUd7eqD7oJi+TCU6ldUr8cISOczaebCODmf4l/ZxnIDZtffVWrOD33w9ccU7XpI/Gb2Mmx4Cp2qS8SfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942664; c=relaxed/simple;
	bh=Tmcas4j0s3Gf2d4qRloLyZr+HYYU6fTALfwrcrP6U1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+BMfcLJLbp/HhkxGgt2sHTLVGevLWUnmsDZLfbLgUPO8Y4GGaZlmMZfLUL5R9C1LxZ5v/vj3gtl+XRxmQkzRB/y2B/J7EO8mAElMoxVqIkP51ARtTZFFJCqvjCELb/8HEqx7OCoYEz/JytbVjnltrHDQ5scv9YELeqe9Nq8juQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8qNRIra; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8qNRIra"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-467f09c00c2so1643611fac.3
        for <linux-sunxi@lists.linux.dev>; Wed, 09 Sep 2026 01:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942661; x=1789547461; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=R8qNRIra1AVJrAbKJl9nDj+FgGNAqL2OtHEZbU44vIZJgGbEGE7vuFFyw5jEZqb56g
         dnZX5cPOTPG8Mdx2h3sXUtCSnRkS+6K5XZKosP022LmXd6xeuTNr/lwEYeMc4QlNvTHD
         fbHQVkmrprwLc7tAus/OvuzsFF+04xHksGysH423PySMuULwNayX06h2vxXA4wxeizMi
         YqxuBoHRwoMhizP6TLCChZD+nNgwWnmLELc2jFzbCJLLpBqNZIdNfzS1c+hQCbNEtbhU
         YLbwAKdSJua3Zsr9rfAx5y9XYx0hk1WS6HmtkwNpvmLHwPjadSPrH761nTy8Sed8Mw1B
         aiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942661; x=1789547461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wvg8aSvAJDl+PROcGB7AxVuyh80XuZxIbfxWbHKxpV8=;
        b=T4mhCPVQfnrQ0pjYBfGiGWZ5CJ+N7cPlCJXed5DpjGD863H3Ud8AM57FdL9UMARcwJ
         LEI3eq8gxwu+5vRMCoPktfHujpXFqgea0VQdR/2jeI0G3Z+i1HR7y8rX5CDCRx+p3LCj
         vS0UVtVELc147r0mVmlppm444KpY9cZG6mezQKHvFpkOCC7H/PRLJ203sQSJcsc4Yp6j
         /T+LR1Az++eED+dlLntKBxgfn/jT99x7eMvrrQlfn+PPFkN8MSBR3CFaCeHlTQ//ccaR
         PQgKNbT3eO06DTtQoUEG1vkwmw4nPbOu3ao2FapBKGy0iNgDGg8yYk+k4OPrGBO3pb42
         ozCw==
X-Forwarded-Encrypted: i=1; AKwUvBwk8poCPeowPb+T7srayv+tp1+fmJmL67rW+LkpmoTaXjTrO42Jttj1Lx0M54ULPtuI/JmASb6A+IeXzA==@lists.linux.dev
X-Gm-Message-State: AFuF++mSUwMDpx61HjJ29qNFJeszFH9/oJ7G67RRVN7g2GeQfxi3iuvK
	PRnqaFSr0qZ7QUDPCOmFVgg3KHnfznXPpn2s2mSZXJK0+pC5aYXAfryh
X-Gm-Gg: AYBFou0vPDN9AbZYZoBUjwUfXKVJip9VqLzEySaj85k23kMaA78tR4NGnnywGDGTVFL
	AgtPtUqbSkP6ylEKw33x5U+2woFXjNczE2huMwSScmlHkfRlxJm/gtszebQlTowi7pS0LiRJ2p8
	ULW1fxzLP/lMEoh+ML4Kc9/VH8PVFFSHvkAOIRLVeEnTokWO4e4yjc84ot85DCf0Gi2uBcg4tQI
	UwDhIRB5PEpQitYeq/JlRzi9jlwb+GpIaZbUnjA9Cf9NoDYZ8fSpPyl7FTGtgTgSOeCSRZN+l8E
	tsN+kEfGhcN0QmZwMCFeKYM5aCiRlh6bcHTmrfvJRMoeDREFEyB5P6Cs9Mg1ezhCR7kqOmyzDa6
	YcH3UoyVdynfuVlgTTbStwKTf7KRTUwFcOwhjc3Dr0jsZsySMjDXb8ThExKtCtM+01yOwkeuGtY
	qn40GeUr8+uM01a5L9II8L/+AlRG8JNKyc+WQPm6U+/6steM0TDw6tsKbFugJZOzjrUlbEW3XmL
	4DHW+3EdEIJ6ZTWzywM7Yr/DqAQdRYdd6nB7enn5dKnDV5CZNLFYXd1tT2DDzc2dJXVfqEXre74
	JoBhnqvAWqEdJ7wWCaJkrWuPE5p8B7M93gS4y4D4pGMEoRuUt39Utf7nlSbmvjQSGOFNkyaJgw4
	wpVr2O8is2YaasaX4WsTD9FKRBf0z
X-Received: by 2002:a05:6820:1613:b0:6aa:da04:b56f with SMTP id 006d021491bc7-6b6fa7e183amr19522399eaf.3.1788942660818;
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:39 -0600
Subject: [PATCH v3 06/15] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-6-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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

The hardware-ECC OOB writer delegates to the page writer, which already
issues PAGEPROG, waits for completion and checks the NAND status. The OOB
wrapper then calls nand_prog_page_end_op() again, sending an extra program
confirm without a corresponding program setup. An error on this redundant
operation is returned even though the page writer has already succeeded.

Return the page writer's result directly. This leaves both PIO and DMA
responsible for completing their own program operation and preserves their
error results, including for bad-block-marker writes.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 7081df77f63e..545da54b8908 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1831,15 +1831,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0

