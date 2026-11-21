Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223474;
	b=oClNAyWqpqTDCyspJdrnpCsVXISGRL4i+rP/ZAfR96jWraJwtrKfmphpawC3/qexwoMk
	 dTJAo9Tx8u224XYNBO3Vo6WGBBJbj7Hn/Qyo5S/1XZ6tLHoj0DKlAfIDmh7VdiGV0V6+9
	 akETofRMGCw9ERZxugT138TKELAmccdxI/ZFY7Xv0vlZb/is1VKnPGp88M62m9xNgYFbm
	 y7QZjhDXEsKo+ZiTHR8BG8hIBIuexrrop6OKZmnn4tBGzoQkfU9tEHv0vBgMfT7NX7EEg
	 yoC9aLiO5Ag79i4Fbub22KUFWleodYfHJYJgl+D9dUFlu9tRH7ZuHi840z/eYZJ50EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
	b=1GLQbHL9OKiC/ld2pqa6jZTZUgOwObu8+EFPOG7t+X+dRB1o9sx2CeaQqG0J0yX2LY0V
	 dWp/+W79vhkBz7bGglKei37nWlruH8AkSZPh3DvLQFPS1CpeLZtDfSsmhA238YpkE2K4n
	 LLFNlpepsgU6t3BFBNEntpLDZKRnflA+faSHWj9hAyKp7HE9VFfahs/p0SyfMfLMwIlH/
	 DY3+GScL7KNn1OOOGMPVBgPWlFX+WRb0H6hrKM5b717KEOiv8YCkViz6ZvzbcvFIfdAF+
	 uCHA30vVznuuLR27Pp7S04aP9mG1ukoap8TTxgft7BXWjjUptw31IZQPHlBkfj4GvUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcOn6EqE;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD0760A2629
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Nov 2026 01:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD0760A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AcOn6EqE
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b28d7c729fso1187915b6e.0
        for <linux-sunxi@lists.linux.dev>; Fri, 20 Nov 2026 17:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223471; x=1795828271; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=AcOn6EqEuTrh46YRUAgHrxCIOXmaP4c2vGk73HZlRKB7bxD++wLNCuP1dsPEnyQNEY
         /b9iKKjkjZyRnmzpbzveTzAdI20pmH/g+7VRk0Yt5jb3o4nqXLGn8Ca44LZP6Z3jOsWU
         zKPmBePmmqs+sxXaPBHzKy60dx+64c+ief9sv5d+Nr3DfMcnfC/HycHFcdlSiICBymuC
         4n9ZzwE39xExQgiuJvq9D8rYfXd6zFdZiQNZgZh+Z0ZE4ANY0x/xLzDVyCcHMfrJbJUQ
         uQgi8cEvCDpNDFn/Tnh3I7BUYoGed6CmlvVSc5VdIBwjlmNb5y5iXJn/weQ+ITtJUO18
         JeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223471; x=1795828271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u89IqnoAKi5kjnWBIZSz6wZn1oqd6Ypo53SPsotyUk8=;
        b=fTB4+njBrReHcPcH6IblSYCRgmIlNAcwVHcS0seznuUJrzhFvLeDHAOkHIFMdb9Ct4
         IXnt4OJW37pcQiOHzBOdwFl/lSNAENHrNIgdF0hq0oasP4L5UX0Gpe0bdEPhrqcGdayC
         Tthlpz8Cwb/NrMBdTX+krE9lkHIfVFGHCUXoRNOAw8wBV2xe8G6PhXuB3s/NoaMmkL6e
         ioRNTWeQZ5xdVsvLO4Sue26VdqMelau7JKoN0KW+94NOSSvXTnXTIfej+RMTyigS14ND
         Fg1p1HAtnvZycqxxMQv2qPJM3/OoQez+V5mOSawJRCFtghe87EHV0uHx6trN0WF3v59u
         J45Q==
X-Forwarded-Encrypted: i=1; AL+hErE+ySehsKlpefmFuVkrGoGWfd+QO5+ploiTeCSD8/Pj4JbtJChLAjZ08w9oMQGwGsQ+6e0P/UywVxJPvw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/KbEzd6jk4B4PK+pNpIEnZqtRIk1qtR0eHkukz7PqFs/fL425p
	d7bNRs7PiUMvFt/yjv8B5yrKxTJ3Zc1LKop6dvvNZEOBV6RxTCy53YkG
X-Gm-Gg: AYBFou3l5jbvTGXVXZRgnbO1LIIYy0L2Dm40gukUOKUh2ZTuZQNsseS2gjGLcb6B8WL
	1SFdk5+hUk/Fjwv/MriF5qLSvhluD60zecWkF+l1fKQKrBlt6fslKaU4Rre8/5gTE45BVgAIeT7
	RMabjHG15rQO3/jot7k0x66hv6DSPTuxw4GOTd8mT/Q978HHAzdVhPYmeiI66nhLDAeGSbV00sN
	/6b9HtG1RjtUCzhk3ar1oOVln4/L6kqEG7dFUn1bzu6mX0IK3fWvxnEYurf0wuZiGOF9QMtoBZq
	qmJaZnnyU7lHK0WcurajQ/1kiKkXn2Wp+7VAOOxAAXDBKftk9PNa8pSmVQC+5S7wW+wvyfQ3dxF
	WgtTdI5UYcgXavpllsptGUzdzSCUfWRbXkTeybIMGLHT05iQbQoYLGNM5AN0SuaJy/cdlf15lYW
	9TZ2ksa929Ankvv56ocrU45cjT5D4jYjMkqSshquJctGKxVjJxSW5an5uNIdAfPUs59ucFx2Bnc
	TQU1l2gogla32T5mL0mSTSaWAAFsEh35VX+Gq41ZuNMxrgqvboVymtkonKK67DU/1y799QFMF75
	AQq3GK6xQRWSGRyIWoKVQojGa3BNwuT9YD8mu1cDOAmyCI1AEcsaA2YCmLwQDI5hA1tssCUxcE+
	Dtq5LX2l44im090u7tDgL56mSzcTJcmFqm6Z5eJYwzDC4dRIoZ3XceoSTE+0t3bkMIzQhxEOs7j
	M1O1U0CXMOJX+F3R4ZCc2JIEy7WdX2Qw/bii6OM0hRZrFmvZ1OgdzkDZsst23v3r5Vig/yJHAm6
	Q==
X-Received: by 2002:a05:6808:244e:b0:574:6f37:671d with SMTP id 5614622812f47-57a056c81c5mr5959981b6e.5.1795223471048;
        Fri, 20 Nov 2026 17:11:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:34 -0700
Subject: [PATCH v11 11/26] mtd: rawnand: sunxi: preserve synthesized
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-11-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
X-Mailer: b4 0.17-dev

With scrambling enabled, a PIO read can report success for a physical
all-zero chunk but return descrambled SRAM data instead of zeros.
Both PIO and DMA can also reload the requested OOB after filling it
with the zero pattern.

The ECC helper fills the buffers for either hardware-detected pattern,
but the caller skips normal buffer retrieval only for an all-ones
chunk, the pattern it treats as erased.

Skip normal buffer retrieval for either pattern when there is no ECC
error. Only an all-ones chunk selects a raw read for trailing OOB; a
later all-zero chunk must not undo that choice. Keep the physical
reread and erased-chunk check for ECC errors.

Fixes: cc6822fb756b ("mtd: nand: sunxi: move some ECC related operations to their own functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-172123@kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 43c0796d953a..538ffcc79108 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1226,8 +1226,9 @@ static int sunxi_nfc_oob_read_batch(struct nand_chip *nand,
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

