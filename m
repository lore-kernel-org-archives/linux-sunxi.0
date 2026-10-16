Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3053BBA03
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Oct 2026 03:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792122352; cv=none; b=LvgMyMKL3H6GmKpsMyutnPqZBkkFwZ27Grx4Dg/bj9wjWSZVe2Shbco4N5izvCPi7g7vvDjEUtcmM3hiq79X7CDiHXa3hIrcK7R0uUYC8Rm+wPf4tUiMQuxMie0pCFZSghpkhT0X+1Xi/iXd8q2Innae2vVCrCjvIqKQN+l1ww0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792122352; c=relaxed/simple;
	bh=8gBZUPMs/8ybH7J2DLSL0LxVyDkr8YFuS4UrXkubECQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jxXIpbFJ0GFBFEo5FrpETWzHQrUXpsC5TSK79uSpQO3ZfnAUf57fihJfrVfW4q7pog10WPc7hpKa8zMw3ko/7q774Z99IN/BpyP6QU7ep1GiIyGu4ZNqxkzgG0pWWqiEBoff5OLa1dSPDJElPSsqEjV/7jo8CiI94BRDcL46Ito=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1rEV7O1; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1rEV7O1"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-82478760557so2035368a34.3
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122350; x=1792727150; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=q1rEV7O18FTX1+tmSMSsXMF4Z+oe63gjeMUJNnyq3pK3dOMpjmCRDUvs1DGQA4jyb4
         yjjQuNapGEhPQPoDYjHvlQ11pILFOdw7vRcBn+vieu0BSMYcwPurhZpglCeaFv+vysPz
         oiIlc/Bda53wm96aL++zmlxguUS4y4r93qhLHUVDZHfTx8aVGcwbRsq0xIzmNhOApH0p
         Wtn/Q6IYBFTCaMuUzlOI/bQqXHz7LRoMVg0JZmrhsn9Yyp1fhdTIfTkwxnhIA4QBSQV9
         NYDz4MF/fY3VjMlTaG9vTyeroW2rop1L5xvRgJOvZWceM/yYxhKUW1MXMkabJDlgc3Nb
         3R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122350; x=1792727150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rczNXeActkyUZxhNs2zIIuhfq4VixMAxBK569RVDfs=;
        b=Q8oREaylQCvoQeki5VcgC6rKFIfLOWiGtqXj9moYviL5CBXm+mDVjfwDHUCXJcAPeU
         vwHSjkyWC4zIOEET4vs7l/YBzxqWL0Sciw8Yu/i6wk0Ykv5Hha9UMmjNyS02ElBOkuKL
         /NcohaaFLMdrON3MFeXZl2Nvzd9u7LC7jE5R4wmvf80IZKBTo55ZILRVUHGUCUp3IGZh
         OsRCS3+RsXJ8sydEJvRmCRNKtTS8e4p4NrfUMlvJ4ri3NQ/+bogvAAtIFeTknPXpKEEO
         1DFZ3jIjCfTQLKBenluqOztWkkhdlshM4idZ1Pc6jW1xB3e36p1MJIfxKfEfKV3AbIoc
         Bx6w==
X-Forwarded-Encrypted: i=1; AKwUvBzKsCt8IlpnfUm0t/geUrh5VwnFfoqqYQNKtVxpNawC4mQWFj/drNkhviHKGBjFj0bTi5e2tMk4PIpbfQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJcx3y0xDvxBLoI/r9d5cg8lt52BbYept3mcGx/R611LdN1BIN7
	WySFoaukGGBbaY/nyhBkvheK6QX3aVofqM+vQlmMT+CopyH6DyajYdHop381yp+P
X-Gm-Gg: AYBFou0CkUBEc5kiBwnGrEpAh5qMAwAzCfURKpW8EqRh0H5M/kq1kOjqFxhilMQDB47
	SkUPI0zu3x36djAEJ6pzozBtxi/81pgRiunc2+hyY/+H9beE5u1JYrgHghHfwgdm7YlSpWolR5P
	VMIsmZ2R5cG8cJT61F/VQ48w/CWuk5p/sMRtiDPPQOL7bncNMFuFtmd8H2dsLDnKk21DALNA84q
	Mv9aN9+P4Rss2D9dA085U1CqLKszYVe5ON4xn0aK+qUw8z22iW89QCgjnlKSouRaCWqnIhReWis
	7Rm6Lfuur02ChnXoEo6uJvkjtxyn6sAuGM7mwQUPIq/yYVLbCv+YJLN7bvltm2y7cRSFi3mShBM
	a+esG8N8FsAUdtYkAkVv0gfCjS7T2Zn/Ece42smU2R6qQjocNTSFDcQ+/eRRl//DE9NwpTUQTnx
	RRGPKxh+27A/JtYJRj+RiiTNLwakcTUm7Sn8RrVWXI09YuV/uJZzPdRdzyvL1JYlTv2oIL6OI5q
	voIsZd37vpHFovHGlHWxbO6eYWg3iVhNVe2Q2+x5K3FFEDnrZlDBWFEWeaKsIbgvlAmiRPr1/Z8
	BS8TUyP7lgFvmR6P1jw2pCEo8E/SWSU/QsyGIDf3xGibyoPl4okNUS8m/d+CsU1EvlN/kcIs0E/
	IiSbrV1niOeP2N/h98Na/Uw==
X-Received: by 2002:a05:6830:640d:b0:804:ca33:4aff with SMTP id 46e09a7af769-83094e783f6mr19887903a34.9.1792122350229;
        Thu, 15 Oct 2026 20:45:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:28 -0600
Subject: [PATCH v8 13/17] mtd: rawnand: sunxi: avoid redundant column
 changes for extra OOB
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-13-8ba4881fbee8@gmail.com>
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

Extra OOB is the spare-area tail after the last ECC step's protected
user data and parity. The PIO write loop tracks cur_off as an absolute
NAND column, starting at zero in the main-data area. The extra-OOB
helper instead compares it with an offset relative to the OOB start. It
therefore requests a column change even when the last step has already
reached the tail.

Add mtd->writesize to the comparison, as the read helper already does.
The comparison and the column-change command then refer to the same
byte. Keep the command when the cursor differs or is unknown, including
the DMA path, which passes no cursor. No transferred data or OOB layout
changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 105374e93b37..dfb2a64c6b50 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1620,7 +1620,7 @@ static int sunxi_nfc_hw_ecc_write_extra_oob(struct nand_chip *nand,
 	if (len <= 0)
 		return 0;
 
-	if (!cur_off || *cur_off != offset) {
+	if (!cur_off || *cur_off != (offset + mtd->writesize)) {
 		ret = nand_change_write_column_op(nand, offset + mtd->writesize,
 						  NULL, 0, false);
 		if (ret)

-- 
2.53.0

