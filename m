Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9D56C620
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 18:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002942; cv=none; b=Kj0Q5Dv3F0IGPD4+A+YzG5TZeaX0RERVVmM/4WEZAIZ8iUiZuUmph/Loz/LorwtgcWJfQveQepCioBCc2Nk5ugM71jq+MzQl3lag/TMgs2xi+5lrpjDQg7hjVW++eEbjELdcmgFQgLGhxGKsbiut7mw99dhMBFChpMf/kl63mO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002942; c=relaxed/simple;
	bh=88113piBjDKcd3BEuRd6GgwtB1S5y5KxGWl0ypNsWv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uER9kBaJ3o3q+bxLwBHJiDhrIOlGRSqHPw1DgWHVETG54tBKI4w3wTE8QJnmAYQoQvvRFMtcDlFYAjJXYCj/pzgIDaOz2jGLfZcpl3tb/3ERmOMl67KW+2PoCFOYN0ihRtwdUTc7yCVizB2m07EmeqXclwn8UENHDGwHq9nT3fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOnHUh8K; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOnHUh8K"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-82109f51565so1858356a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Oct 2026 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792002937; x=1792607737; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ypJpkmQRRV1BQV0ur1VLkim3Ln3Ci6KGz+PKJeDImg=;
        b=aOnHUh8KIRs3vlefHWQl/gkdYinNjrlEN22aqaPgxOQVO7CWkLok/gcLLtNF1gdBsg
         tUPdtmM514uCniTVJN2VHFcFmra439sKa2WVzuCqcQYTZEECfNTG+MQ2f8sGXsXIbEux
         j8EfJXbJXXH9YU8euhEReXS5L0/cmHk2eNZ52K0ymFcEEE3VMrVGyGSRI0YDVDgSRH7p
         ZSsRufhn+7HRyuOArnwokCcIhPh5egK3GF3pyquTImLplqdYELERjpZ+fo3cJKe4MCFG
         Myw/oqcoVx3FBlmgMtyLgbrpnkZXnLXhXiN6c/Zd++fiQ+7GlF3UcddOyzv8gPAQzlBA
         pcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002937; x=1792607737;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ypJpkmQRRV1BQV0ur1VLkim3Ln3Ci6KGz+PKJeDImg=;
        b=mL8OhHaQFMhNxlwKRBbdFNn6qbyoE1a+nl3kBd7YLQoUaYPmkyv32QEcmcjp4GBKal
         tP4qO59DqdJLM96Og+pWeqEu7Y3nIWw30tvgKJ7GINKBONAujiwh3G0LlapZnRiWb+Ug
         Cs3VndCHf5HrV4BReX2DvZD5K3onBfDsMui11qEz5U6x2QK1ucdDV+PSvMq3WJrDHy3B
         0lbj8O8OSV4j1/r2zrkWI4CB4FGCmxJt2K15Z76kgjmxIpMIgKU/M7KheFNuppqZcCoS
         JYhLlXUstTJt5TqOuhIvlAdrNpIyWGznOOhzvadPK3SZgi3Deh+sv4OALny67EM4cKsT
         pvJg==
X-Forwarded-Encrypted: i=1; AKwUvBzz6PciofGzzHw39ZwnBGWQ2MkfXBXaXiTouyJ+uqkDy6g0Z9DJOp5sraYDMa6ENoVPkC+OWXRCIpcETw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLxz46Itjkl8O6AYodSfk9kJZMHvNHmlbs6tKdv3YdXv0l4r5eu
	NkvftFivrR6MZy6taPYmRxwsmBNoR/0zCTpT0JbpdYJLj7muLazDm9BO
X-Gm-Gg: AYBFou0PYWGPV8T50EdKlgAEg+mUxv3OkRsAvllQr3Rhj7YHps6tozVCTsVfzJaQRYZ
	/uuvEmmLpDl2+CumJnQs5I+v3eMotDE84SPBZxkjJKgZA5NY1cQLPB1bjLTdwiGWWeXl2Ni124f
	BaN8o3zKl+G17wkEcvlnCnRneByKFyUK2LNTFMfTc53BcgGwd1r7FIiYkGSBtvDfZgwJIhnK4a/
	WLZ+QQHirw8xPcAOmeuZhT2iQFW239Kw8+JYata+0eASKAH7cFJwybOhUdl8bY3nvQC2WBZvAZV
	MEkIU9/FE8P3U/xPBuEpETVxf/PbUN7KBqRu+4XHBhs+09JH03RPTxQpnbjCH7cPy6THYpEiKzt
	gdQzDePJ8ZGCijC3YC0ZJMsC3piBd/rGz4UVrmcr7T+J0Em8tEE5OC8A9DF9Lb/gvUCgvdfwa7m
	bCQ3urG4cAFQDJJAGE7RuLLT8Y5HGUSx0tT4Ec/OMEGqIhQULOxawUfwLVhbNw72cHiwbHdm+Ht
	ixTKDtaKNjotTwYQke5Wk+Dfl+y4M7cNj+67p08MEgfBAXfsGBla3dp5hmQDIXpZz8WrVJOHEq7
	5nUoaPb4Zivoyg==
X-Received: by 2002:a05:6808:6c8e:b0:4f3:e98f:fa19 with SMTP id 5614622812f47-50c57695fe4mr15959952b6e.61.1792002937206;
        Wed, 14 Oct 2026 11:35:37 -0700 (PDT)
Received: from MaquinaLab.. ([187.14.248.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c0c5fe7d0sm17325426b6e.2.2026.10.14.11.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:35:35 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Date: Wed, 14 Oct 2026 15:35:16 -0300
Message-ID: <20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014001334.54dcf0b5@ryzen.lan>
References: <20261013142351.771229-1-andre.przywara@arm.com> <20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com> <20261014001334.54dcf0b5@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

On Wed, 14 Oct 2026, Andre Przywara wrote:

> So PortB has no supply of its own, instead it's always supplied by
> VCC-IO. [...] Which somewhat means that this is broken there as well?

You're right about shared VCC-IO. A523/T527 may have a similar issue:
the vendor driver maps PB/PH to the shared VCC-IO bit, while mainline
uses per-bank offsets. I haven't checked the A523 manual or observed a
failure there.

> What do you mean with "the board's SEL value"? That's not the SoC reset
> value, is it? So who programs that value, and why?

Vendor boot0 writes `0x01155550` when `0x03000024[2:0] == 1`, printing
"board gpio withstand voltage auto mode". This isn't the documented
reset value.

On my Cubie A7Z, I also measured SEL without vendor boot0 or SCP:

- Cold FEL, no SD: `0x0aaaa69a` (PC/PF in AUTO).
- Experimental SPL/TF-A/U-Boot SD boot, at the U-Boot prompt:
  `0x0aaaa6aa` (only PF in AUTO).

SID+0x210 bit 10 is set. The BootROM code uses it to select AUTO for
boot ports, although my SPL also sets PF to AUTO.

> So this means you hacked the register in the vendor kernel, for the
> sake of an experiment? [...] uses register 0x70 to switch PortF to 1.8V?

Yes, I deliberately changed SEL from U-Boot before booting vendor 5.15.
The BSP switches PF for 1.8 V UHS via `0x70` without updating SEL. The
SDR104 timeouts with fixed 3.3 V are consistent with that.

> So can you say whether you observed a real problem with either the
> current (broken) code, or with one the fixes?

No functional failure with current mainline. I found the mismatch by
chance while comparing the manual and registers. The investigation was
preventive, not prompted by a failure.

> Thanks for the confirmation, and just curious where this revB
> restriction came from, originally?

Initially, excessive caution: I only had a revB board and B-version BSP
descriptor. Further investigation shows that vendor U-Boot and Linux use
opposite `POW_VAL` polarities across silicon versions, while boot0
enables AUTO only on version B. This suggests revision-dependent
behavior, but doesn't prove SEL encoding differs.

> Did you find any recommendation? IIRC manuals for other SoCs did
> recommend one or the other method.

No explicit recommendation in the A733 manual. Its prose calls `10`
adaptive, while the encoding table identifies `01` as AUTO. Revision
differences might explain this, but that's still an inference.

Given this, I'd return to the `BIAS_VOLTAGE_NONE` approach from my
initial report for both A733 controllers, with a separate A733-R
descriptor and A523-R unchanged. This supersedes my later PB/AUTO fixups
and PL/PM programming. I wouldn't write `01` unconditionally without
evidence for other revisions.

Without vendor boot0, `GPIO_POW_VAL` indicates 1.8 V for PG/PJ/PD while
SEL remains fixed at 3.3 V. My DT doesn't use these banks, so there's no
demonstrated failure. NONE leaves that limitation in place but avoids an
unqualified write. AUTO could be version-gated if needed.

For A733-R, the separate descriptor also avoids inheriting the A523-R
`CTL_INV` path through offset `0x344`.

My mission-critical background sometimes makes me overly cautious, so
feel free to call me out when I'm complicating things.

Thanks,
Vinicius
