Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2753B42CB
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 03:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122345; cv=none; b=VkQd2TMoCOdYfgdvKKuN7HMk5M9r7dWqCbGy9yy/SJEG5+r7AESpey48Hhi7hkk8/UTDhS8IdrLm5AaAxaVytNPkrPse0ymo73dF+E1BWT2VX76iL490lWxBiIexffP3vPZl63ecQQc4+y8oQr4KcZhexBEXoArWc7Q+X/E1hiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122345; c=relaxed/simple;
	bh=L/2f/9mfvoIW49CSofbEAEVCbPChwciqXDpasHFoGaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TrBKaWFlPvH+hzeeOgve7CYpjXbR5bFCqF87jbdamHfbNWMpY2yrSHSyNmT0wQQscJ+YEuBPP/I/iPfUTRBiXFE+TaifESBbZ/GRrOylWZ2LCfOaMijVx3VGuBR4YX7COAyi9ruqziLvVsmuPT9193qts+LAsEXYQX5ftYTyeec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIOQbFdP; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIOQbFdP"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6dd7070699eso1929672eaf.3
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 20:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122342; x=1792727142; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CSHtLPHY+Puvgtw6ujh03ffVT/c3YjQWJScgGpszE50=;
        b=IIOQbFdPPiBp5+ZmI4Uj+oi0zda+r+AAMIRlOH9qInWs5idpbIc9Za9i/pWg2VctiG
         FyHHkO9ndzQL+f7VgC5Tc7YSePDGd3Sj0DIJYULLJ5Ag2GDDUc5o0qHxWyp4NrNwZcwS
         1gFirkLuDIDYb2CxNSr083+060Z+zHn9Kg2wcPsUdFmgFbMMKGcjoGqO9FWZTyPYrAA7
         p3AKaGgeWvBeWTwo+aHzxt29+TPREDVyMTzvo0VXIr7ZJZK/Mz9ZSo2yIoyqVvk1TwnD
         44O7UEPON2E9thSYVrp22sQlgRKJI74kN7uk3gxMSPlW4qKKCiYkQRoeXBJZC1ChvdVw
         blYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122342; x=1792727142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSHtLPHY+Puvgtw6ujh03ffVT/c3YjQWJScgGpszE50=;
        b=a0NUpdX/KKQtQ6phcR9FmC2YuxV9MzihvpkhANuGMWGmtQKNPxrCCKaHHfAbqTpKHF
         3JA9VSt979mujjkBo7cgRb2ObF2ko7fXGrpTuPNMMOzft28JYNKYM7wyOJaWQEtSNWDu
         qDJBMQUFiAVvAjDTetBsGdEyAXNUZ/3sIgK/7bAtwEd4TTRRr3IZqvT9Y4G6u1rQFgC4
         gEVoTTsAYcvNeWDSA/FAlvrz96E9eokDU96IbZBGmAahcvmhaYFQ9JU6bOELyubEanLk
         AltfOdN/dA7bNQ1Tnf/qzzeKpIQl5sLgbBA4kMRT7F7juQfn0+q86mDQyGrFhMFLRq3j
         k3sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIGrBO/c5j43zkWE4xhsNcgQa4J0akudSY+Xadx7eJsDOGBvCrdF6MLsSKjgoMCUbRxGUU+UgHRWEJiA==@lists.linux.dev
X-Gm-Message-State: AFq9FYK5VYm6DJtf1Ad/fWrSDOE6UrmEfkVPjcATk8rayZ8KFT/xHhA7
	FjiwnWKqqD/RPmUvYXFd1V01Q+ytWd2bdfLEuAHfVGlP3kfpZFTnOzny
X-Gm-Gg: AYBFou3fKm6DzWLhR+O8Ttdk47C9vLUB1YuB9yxyA8vTQTekC11ZvjB+AgYs4x/L98e
	H3YUoE2uy4cMtjPC38VeEH+OaAEQglVl1B1GS75yV9Pkj5UjayuVN5Wp4YdX7KgN1Vtf/yGiFm5
	eXzTrIvWPx5dao6YGw9GhPdWJkqsIvwuwfOQ9fhZCaUW7St6IFXJV7hDuCHUuu426KxBJtbguog
	AVFDbinLcocXSxbJ7m4rnXZCxbvyHiiy9Z3RKwiZ9JTRjtaR1NwJdgEq4Htpp/5rYYWqZ8Pa1sP
	D6ena90P/wJ7RB5Y+EZxV+d+64ogWOtfLfnLLRkd5uWcmlaqqrmdSsTIYvIzqfICF1RquDy8aQ/
	V3UX3aeXFSvfujJVFqzBb75BQnRCc29wmODEQrGTMRrd7ss0kWmNivGuXCKHRb4k9ql7jwXChkK
	tOJ6WJUZHDhtpKzfxfysP+HHEbvqlfvonvNLOw3BJajiXhhDaUuwVYDyEx7wgkVDsgS9gsDtP3s
	qm+YLiSRHIDDxess3uE+uFV8VJVGN9JpZQlfEoFY46Ne1c/NwT9XG1b9UrcegjB0SPiKUcKzAf1
	QRSFJHrBEQDq3m66zMMm/v4aEkelp6FMxtrsGNTgiL2I2zSRTPwBrjqli7O3gxuWAUppOB1fYo+
	fuMWPd4ZcWu423KWfdajVmhYC8DLunRG+
X-Received: by 2002:a05:6820:4c14:b0:6c8:fb02:527e with SMTP id 006d021491bc7-6ef102aa365mr15532787eaf.39.1792122342481;
        Thu, 15 Oct 2026 20:45:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:24 -0600
Subject: [PATCH v8 09/17] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-9-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index fcb017f048db..9f03ba22b4b7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1832,15 +1832,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
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

