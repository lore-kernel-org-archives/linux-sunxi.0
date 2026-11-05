Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904950;
	b=Wq07KBT46pts609ICRWv33JmWmuwYVXJBWWNoPWEVUP8myw1XgE03oKxaAYWxUvE2H38
	 fVE6wXwxwvdhDCb1M6nA6K0WNxADMNmrxmfWkxYH7tpfOL9B9U591fDny56GsoLnQOtV5
	 sNebz6q+EH/FcVPoZvC73FckXoMvHSXqYWaGmW1xnPXY49uQsB110+n/J8B4ah/Ap62jU
	 Yqr/P2cNCpjihxHndEfWQq6oZanreS7CvfwU7gqjEQsZLISxuGTm1bP7x84cm39aUCOrX
	 wF7+Whg8FBO7GSfRGar8XMlONJ3AHm7jLE6kktJ4hHNCxjPJhBNAv9NyLmIVbr9b82Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
	b=QifKbcTyGwhkpqFJN4juoWQnEI7mZHw1vu5qylJNuQKXrCr8j2yE2xFqTECrrQR0HH7l
	 A2osvTkooyv2eDnaBiCv2IzvcaUj/gdA5eUhK7uDGgazhkPmqCRbMcyUbRku1ySf7JPim
	 qI2TKpOp45fTD6oH59svr2vpCG7jO9/HF5fscfMnWA7Lb1CE4NHR2+0hbGDZy7azdG0xe
	 HVk1bKPToj4U/cB/6JaOot+GhAHWHSO86QL+91Zjmaeya9eIdOHL6b2Z1nwom5IqrdeC3
	 nP+zHbvSVLxwV8ckb0TzaovJ/VFLyFqIsnQ+Pi5eYn+7OGmjFpLW/C6irNaseGtoS5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h6/FWWi9";
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB393606A336
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB393606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h6/FWWi9
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6df5e315bd1so1891499eaf.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904949; x=1794509749; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=h6/FWWi9gCrCgPwyDgHERAragFEu8ncd1Un3n354F4ueu1Wa447bY+bfWwnVD9b9yI
         f6iaHDHvnJtYzX38F1SmgxSV2EFfqsWFvv09TZOhYfkqCy5X+l/64q2U+HKtH/blk+EC
         uHj46uoqGB5OR4YpAXEeft0++drfR8Tff5sBTnNx74Xl8dOO/gEoz3cffIMQT3TzIZ4W
         pQV0mc1xHsYtE+hqtdhY0fvzZ2hFoU1karCzcvNZf0pMDWN0l7+hcm7iK2rcYqtqYZn5
         zwq0slkTxe3PtoZGdl00N2QTjqx8klgUpqYxAx189A5mYESoiO+XpokGtY+tozyczv4o
         IDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904949; x=1794509749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTl2XZPhy5va2LFZZWNF4agNgxit/6PdmaEnjIQ29V4=;
        b=VYY0kWlTqBxgeqJwL0hSaD5n5p21+hUUVeepOp56QKA2HLw311GAbmLjcMG0jK69GJ
         Ff9aJvko9fhECW+PwgEu8IaRMFure60V7qMsSbtHI7q5LKX8pQGfLQgIFJdt7Aa7OzkQ
         GESyGawi61w8HwYf2MO55kcUzmOKSiE1SKL3lTUs7Dy6HkOdfaURQBI9Ab6KqT6W6wC3
         x4jJy4fwk+QleZMh7SxtOlR407T4DIxnwo9t7W5mqRwYQVSlCKL6zFvMz0huFzLqQYgS
         2Tqh3D5G7t9P8cYKwQUgYVF8845uUqBBXgcyhGkgE2NQJbI6V2i0GCk6z2YS3VLAXaZp
         bCpA==
X-Forwarded-Encrypted: i=1; AKwUvBz1ICzM1xA3qfTrIlDsEIlFEVAdoxARwimAQ2fRCleXEDDR2hL3kNGDnPX9oyqPAlndKQTGw6j55xdVnA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9UKqsUyI0XuObODcxDeJa9stK5UAXfIUhGTXpPJjm15S9TzDX1
	pqEG+7rotREDHrAl1d5WkGhuGE76IEMeDGdzYdZSaSYasjIgAnSeoJIT
X-Gm-Gg: AYBFou0y96u5VnTo9ncMEjpFiP/XLUC22IYtOshoWc+HLUHche2VpmaszWG4u3Q/GsS
	iMJ+tNFe3F+8q+pIo2pz35UHCK/RslmLUNiqnd/brhZr6CsKyrMFM7sh7tMfixkoyYo8PllWvtN
	icpu2rZ39wn8kV0wueSQpu04EmW7fkbAMmzZDPySYbTZ8r7caX8XMkolrZJeht0jm80eXeErPaa
	+ppKIvQRUxt5CgIHsQaFPmB50U5hUOMtPTUstTa1gJuHxRibavZ7p3o0yqtU3ctd26eeK2+h1Ah
	s+iZVH1aCpQe5+Y2RYdJIKRE6fMOALpQnUsnjsibxXU7CfFbNT15Jsu5Bpsw9D1bvuc1OyvE4Ex
	W3yziw2OvoaortalJeR5VpFQbhmBjw8xrHJWB2A7Ay7IIQg5JyJw3b+4E2Lj31uOmWut7zzBIaC
	TKqf1a1EvgUOqLCyLCVKvJZ7CsEZbYbEot6Pu0q6vUzPVQyv/qpjJyEYr+kaF0crEmcMJiIOice
	iWKRhnV+U10vtapJyBU/YMjC9VaDh4AlGuJxAQarcLLOnf7S/E0em3Poo7ko/pM59GGLJelg5Vs
	9Sc0cNteIdhmqYHqoT4LCBWlWEwsMSfFtruU19aA7OCKTmexWeEsvXyfsxCwxWXJc/FVcMWFAt2
	ubDDEUFwDfduMe2PSN76PTxxtlxQmNh0XZvG3wUEwH4u/he/ENdBdOK6JZ/FqZxw0iCBnBUGPEG
	D1pOtVzycIwQdDeTMljtgSltTjMj+kWem5KtWvrBZknDoTdgJtALcn
X-Received: by 2002:a05:6820:824:b0:6e0:fb60:d5c1 with SMTP id 006d021491bc7-716e744f8bfmr419274eaf.11.1793904948781;
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:26 -0700
Subject: [PATCH v10 10/26] mtd: rawnand: sunxi: preserve synthesized
 zero-pattern data and OOB
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-10-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones chunks.
sunxi_nfc_hw_ecc_correct() fills their data and requested OOB buffers with
the detected pattern, but sets its erased flag only for all-ones chunks.

The caller skips normal buffer retrieval only when that flag is set. For
an all-zero chunk, PIO therefore overwrites the synthesized zeros with
SRAM contents. With scrambling enabled, those contents are descrambled
data rather than the physical zero pattern, yet the read reports success.
Requested OOB is also reloaded after synthesis, in both PIO and DMA.

After checking for ECC errors, skip buffer retrieval for either detected
pattern. Keep the erased flag separate: only all-ones chunks may set the
page's has_erased_chunk state, which controls randomization when reading
the trailing OOB. Preserve that state if an earlier chunk was erased.
ECC-error steps still take the existing raw reread and erased-page check.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index e952d7f6abef..e79fe46926d8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1236,8 +1236,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
 			continue;
 		}
 
-		if (erased) {
-			read->has_erased_chunk = true;
+		/* Both patterns are already filled; only all-ones is erased. */
+		if (pattern_found & BIT(i)) {
+			read->has_erased_chunk |= erased;
 			continue;
 		}
 

-- 
2.53.0

