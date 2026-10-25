Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792936687;
	b=0TP1DD8eKaZboqUUPsT+NdrXynVhyzjRrjCh1Cj6qi/pnuWQ4mTt3y5dMjRWGONq3dI7
	 h7IzGAJqhpriOG80gRAOMqVFAVwGGZyRkaURJw200fEQuUFjbJ0D+Y2v+5tZ0sRbuSM2f
	 VeCvGoBX15j1bZL2B4QrgLd+735Br7A8URmFvLNzaIMZ0FIvZUdR0EpWdHyFJChDN0L+E
	 PqcwWlwvLwjWDiVvarfx2eApILt5wbHflmv7fI5qH2xI8XrKPa8bvd9UAF7CqoeIuM8H2
	 D0hSNde3EB9NpXzrVhQ0A8fc/Z6wHli5dB+TobwQfQEN8LYpA3W4jMNrPWlzpEVBJsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792936687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
	b=NLbdyllXf4JzKCp4BPbtnd59hG/VslHglTCanlQ6j9MLxMfWGvMDcIKYQl/R6OppywC1
	 E0qo+qVl0CJRvlQkImHzKf7AkALES4MnQzSoQhNkS+0d68+zhiukbzbvNYJE7iT0LIoCQ
	 aDN88TXm6uF7isnqFu4E6RoOpKxIY9MqqURnT+dm1EOSlRmLWIjrlQd3QjClNd5EW/S63
	 62XnEneIJyVKqQ0FN8phiusNTA451E+w4sc2Awk5wi/4DdbmX2SYxqj5SOXx5A++ClDSD
	 tjQEgpKNf4D62K6qfyFjSQWw7E0UZAnxLRs+JgrM28uv2Z0G7JB4OqmRdAfE5/F6flg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lwmCupXx;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C94606A31D
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 13:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C94606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lwmCupXx
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1705245f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792936685; x=1793541485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=lwmCupXxS9u4P+fNzVoLiGlh0M/Yej8TxpM/P3Ci7NP/byJIBR0tdSeHqBH5HoEVh7
         WTIefihepw/r2BNJc7XTAlQOx5iXyHobmHYbDSrs7awG2beAWfb70xYdVAo073o09SaT
         Ome+aNeTteTi+PlDNqCGfanuVjFwRK+7CoFvjpHil6qx35gcKhySM8OhVLcr2yRu3h9c
         GsjborW+vNfYlXCWPTbzVHnIwA+iz5x40qp6S+VIgIOjlY6gP8MOTDAGtlGa0UoYpwRB
         ews5DquowhuQmZwvd6mL+TMdumv4NZ10F3ODOJxV+HuH4ijvSAF8gXb2v+bjINzJoV87
         VXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792936685; x=1793541485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkMrb47+RHanbLgsTwNr0QXPtl5wufkJw6Ld4BtzfH4=;
        b=SETJGdlikifpPTvBUKVZh+ExlN/B4/EyYrulLIcA9PZQ57HT3xxEpDTta371W15PWI
         pKhv0PHWy+0Rw+Iqu/S0DjFSGbpANd/hl6TE6moAcOM3VZTm8RYCRMEXgySyBPh9ItFE
         +dRUkaQN9TMtOErdaqMwVys/DYt9tn6Tac2tAsV0hxIrNcCmxkCq3MWdD+kq0f6Lbjox
         NcllhFMxW9Yy9BRTqg0e5BMnSAPYTRY/hPDKBy5btra43LFBMe0bbLJKznNur+IKBb0F
         c3uBI5s0iWqiGqs9DVkXmJec6tBOz9HpmE9EcTWGYxDDdHCZwZCA4hrA7AvySnfd5xGz
         VXgg==
X-Forwarded-Encrypted: i=1; AKwUvByiQIcTtZl5M8ICsKtPtCoZVfAxnCmvo6XOISAyfXXC4jx/2yOOE52Jp0vuprVkspbyLZNGyBzMNMq1tg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJgg33kKqdJNxhl+fgWfLe2yoADnom/O77mFNVW4JoY8wK9SYnL
	PZoGBur3+iEq7al0S90oCEeC9J6EROSfn9dPdZBp0epcxQerkQ5qHW+bb5BcyBlLwE7Ckw==
X-Gm-Gg: AYBFou3yuE3TT2XRbCqG5D7vuQ0/XpADtLHKcxiXMuFCbLsojJ0v5L3I/9BgXvTMP43
	CgZyGsGlQ5xc+yBKV7Co9D9hJfPQ4qUNkwF/aNCJXqy8d9/6LGW9vP6MblPLkWn7IRRCttI+y3q
	Gl1qlXDXMG168kWG66e1l/pU4dmLBgKC4VaKYloPYhuomj5ja2PJ3NeZIYc/VHZ2f2Rmrq6vRk4
	1tkID8/Y3n378V7Q/bJ8b6CjHeQJFVFCECTwyPKssLty/vugVvt5kWClzkmHtgLbuEXeXPlTliB
	7gb3CDs4NXfgoWSwSQWxX+8DR2u4XCKPvcG+mxGSsCABhoJfRKfvheMqzbJSEaTtTOEWtVaBvCa
	P148fFuh0fr1qlECfwowJUKxn8KhaDb71KCl5KLdN8SbO8fZZ2d9teU6/Tiby+x6ettI+bJtXmn
	YqZIO16PwigOHmOqBt6+4ZLHhkMBH31gStaEl78/sBP5dbLbqMkdHjoN1TcZW1OKwL1wZ/CCxko
	B8On6aDdXdNFiq2ADCW0sAilTRdSgjQgk9Kw4Eoayr7NP6Z4mg9g66B9JB6BYjdMmYLLo5bvESy
	HpQdAzl1esZWTQ==
X-Received: by 2002:a5d:6308:0:b0:48e:20ed:ce67 with SMTP id ffacd0b85a97d-48e3eb8bf9cmr5477047f8f.23.1792936684892;
        Sun, 25 Oct 2026 06:58:04 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm5663415f8f.40.2026.10.25.06.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:58:03 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 13:57:42 +0000
Message-ID: <20261025135745.102970-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
none. The A523 got a DT interrupt for its unimplemented PA bank to work
around that, the A733 would need the same, and on both PK is written
past the end of irq_array.

Number the IRQ banks like the static drivers do, with irq_bank_map for
the A523 and A733, and drop the PA interrupt from the binding and the
A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
made-up interrupt.

v2:
- give the A523 and A733 an irq_bank_map, and drop the PA interrupt
  from the binding and the A523 DT

Pablo Mazzini (3):
  pinctrl: sunxi: dt: number the IRQ banks from the first one that has
    IRQs
  dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
  arm64: dts: allwinner: a523: drop the PA GPIO interrupt

 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++-----
 5 files changed, 13 insertions(+), 13 deletions(-)


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0

