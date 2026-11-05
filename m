Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904949;
	b=OAOC44y7T39na0iEVt95g0hzKEC9SuBT3nqzK2UwlCC7kVAU/Uj8C6TIKpf91aA257MP
	 Y8pGJyQwt8xBMk1hcGK8Q/BeJkbYTYi5F6UdkMYxbrSXHz6tIGAlj0P8quZVkqLBfrfIQ
	 uIHLoDcaNmHuX5bySEymuMQEB6PoMmbzvNkSd80QqJmTUJDORqj7QDajYjzukh3acoMlh
	 WQYX1m5I8YQJQTcC2y5j1TBwN0rHO7i3WS2Z5PI3DYxGk69xPLGzGodmIf5DfpWYHIhEA
	 kpu3583h25/ZeOeSaBLYfcyJe1EqzD57cl0bqRIEM7zbet0KeaIQk8oB+DcomFeyrZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
	b=N54q/mAXjfQr/LwlDATdIcMf+JKH/jMOok/DIrqfgJvQbtsGKYN0oyjMhKMKP6S9zuWl
	 MycBWhHwzxDD2gOT/DzdBwWPSQj//f46QxZRamtgUgwnHKKhy3TaXFszvSatJ6StAEvqI
	 uBf/X/HV6mihwP9SnHOSd7f8Y95yRLqGK1phQJHza/MEu9HhxHaNVz5k1CJHg0nKGSGha
	 WXUFcdJqX5zZl16+ycclsJYJepDko4fIY3e+nYigFTXoisNXJ2m/3YgWTutoWBqO4Q9fC
	 akobFncM3/Vk5cHQhG3+fh6ATsdrqEZvcXSQ8cdBShJMXZla71B46R55k8qseeUyqjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rF/qN3Mn";
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DA0606A330
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 18:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62DA0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rF/qN3Mn
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6f8a519e215so1084206eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904947; x=1794509747; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=rF/qN3MnuFpHWAY+cClqvLEhlfpt3Wtow8s2iNBZbzdZ4U7JBx2bnzWGZTmWe6Jf9E
         jBIYaL2Zf0A0LoMoE++jtPGqA+36y1+/5HBHkbSLtPPtPsDtcufMDwCMujda7nkUKY8H
         LOPeup1Npb52DQTPPDsVNRX/dCW/BBlGqe/dmfFBAOKtGHQ3iHsK2JP39YjrpzpiE8GX
         iA3mXYC5p3EQK24lYR/cxPdUZWvcPOFVJV2m3oSC4srJXvtx+wURJx/SWqxFAn3hXnkk
         5n4uzCfsmnWBrRDs0U22wNDwdDG02mSeaqNumVI/oH58tmoU2PQvcEbmXwDwEB08CNsI
         iGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904947; x=1794509747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjkwKej/qk52hMyec5U0ZIa7X3INzm/Y08ET6LW7Wyg=;
        b=jZ950TvTaxL28zKmKcsRiq8pekoQNwgB2EDMRvVcS3nTfR0YriF0lmXipqzsVv4KZq
         etBQ6Zb/nbdpKYeQYRmlz8HjBjdmwrVcy+BN9PvZCkt2vX1v5rKquc+Q9c/WyfoFaeNj
         LNFODs5FUONqkOEog6lk9Uebdg+Srl/u4bQp0Qiw5pniSXxMv3eMCE7sdCY2ZxCaCofa
         5lMSXwZZ1JlIPnakFrBKZXrQ8c8Moh479MR43+E9bCtpXDKfFUhgtY40vmQY0OiX3j6E
         1VuImhcyjvYSuUtyxgsdWFg8id9aJWc/dGFoIImp2bDk7eeU772t8dQlND5fMI/LH8vu
         2u8A==
X-Forwarded-Encrypted: i=1; AKwUvBw8Pz2mnuwPsf3VSzZ5N3Yhsxr1bKeT20P3i9A46jIB1NmJyDxY+rx4g/ehPtPdllaXG6TAGYDG0b7UVA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/dTce9cCYmjWt378V3wdYQdwGJjfHSwgKVWlwwFUOUvFPyqlyo
	LxM46KghFyWfrgtYTQUf55oqZhb5sa5SMMjo7Nn2y9Ww+wYHKywIsu1t
X-Gm-Gg: AYBFou3KI3QeXdSPixOih1VQu++5drMiSPQAPv1dlGlXsM3APOpNMaueStJBCXIUStA
	RrYddkquyx/9Pm7oPcYWWMaFy3+9DOSaTjTmMuSm2hHUc5CLLAPZQgrQfXLm/qjHJTUV6L8rpn2
	xIOZNDHXPahXx7WBiDiTOa+iBSrOwRR+lR/2xz8lsqruXJcq/0O+S1c3ePVbG9rCu4K6nVI8TUl
	PegSINy6FdsyF47QXXQMs5G+QjeVLAXrXzvtjRhec4MM125dzhEX7yeRLgFY3Ayejupnh1Xftvc
	LWsk7m5PFHpB+pUEO0B6sP9dzGfu5UiseFhRETYQWlBjlatuKyljRTkkEchtY8oNQWeyH0viuud
	NB6nRg5M9dnplaZ5GDNrwgQZk0MZU0nUQSnIyrJRlm9WpqvuOxfb8MoP6t9yF8ieYPOJJrCWjdG
	bEA7iNxJHgpiBtZTpxPVFcX4rn6D90k6JvBaTYRSxOYackOju8pKSbV85NbwUINs+sdjGMSATnl
	Up++p6DSqNMufRK6L0rRAJbRi6kUfOBCWgmRJJunkXwSSrCtKNbVFjRc00CeM5UJbOIylGiQMYm
	V3oM/1LXwAgEDYEPsbe+AyHLd4yB3ULNlIyyridMfEYPXZHU3CxCtrshukjW/hWNQWkG/GidIa0
	9UfJMxWncom21iKAYbYm7acIWlFDX4Elgsf94qKZPy+ADfPFhP7/ffB+sPOeLxRkjziMFwJq0rY
	wAHNqMvfmPnRrwxo7tEzktMfe6E2FY0EgQ+7uOINeXEMm2qzYSDBps
X-Received: by 2002:a05:6820:2308:b0:70e:177b:eafd with SMTP id 006d021491bc7-716e78881b2mr244556eaf.16.1793904947324;
        Thu, 05 Nov 2026 10:55:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:25 -0700
Subject: [PATCH v10 09/26] mtd: rawnand: sunxi: select the pattern ID for
 the current ECC step
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-9-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

ECC exception mode recognizes physical all-zero and all-ones data
blocks. For each hardware ECC step, a pattern-found bit says whether
this happened and the corresponding pattern-ID bit distinguishes zero
from 0xff. The correction helper checks the current step's pattern-found
bit but always reads pattern-ID bit zero.

PIO processes one step at a time in hardware slot zero, so it is
unaffected. DMA processes several steps at once. For example, if step
one is all 0xff but pattern-ID bit zero is clear, the helper treats step
one as all zero. On scrambled DMA reads it fills that step's main data
with zeros and reports success. Requested OOB is also filled using the
wrong pattern. Conversely, a zero step can be classified as erased when
bit zero is set.

Test BIT(step) in the pattern-ID register, matching the error and
pattern-found bits already selected for that hardware step.

Fixes: 614049a8d904 ("mtd: nand: sunxi: add support for DMA assisted operations")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 02aa02d2cdb9..e952d7f6abef 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1125,7 +1125,7 @@ static int sunxi_nfc_hw_ecc_correct(struct nand_chip *nand, u8 *data, u8 *oob,
 	if (pattern_found & BIT(step)) {
 		u8 pattern;
 
-		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & 0x1))) {
+		if (unlikely(!(readl(nfc->regs + NFC_REG_PAT_ID(nfc)) & BIT(step)))) {
 			pattern = 0x0;
 		} else {
 			pattern = 0xff;

-- 
2.53.0

