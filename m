Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938262;
	b=abhTP36M5FwEVzX7r7HdGZ9JUa3w/V0rISs+SEIdnHTHYwGnVSyo/UoKSolMR2Zjcvtq
	 a6rFkjnRNRKcsHz72kimhKu979K2545//FEmOcD3D5D6ys3tXytrjE7YpqYz9NntBAFHn
	 bw/PKhh3/IMBllvAI8zDnixRBwu395GOkqFWRY4t25Rn9imsey64LqIae45qj+IhEKwpA
	 v/zunEMEilYSFwSxV+5VvzYpA4d7B70zYU7+48kw+czCfND9KR93ke3NE+keakbCyzkXA
	 NT//tleABMn7l7TrUhp0R6bc9dgAzVXSGkvRbqlbqr+39xtrnADAWVTPcM2rtkPWGVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
	b=v+QJZLJPMyStJrEFicdbsMlpR2MTKC46gWYI8T+2kpzFvDWCj7/cLpYzWoObZ77Bn8xd
	 3mfGUs9bElQRGPdbGUZ8WaacXOiD5FpOSUjiGMQDdj1dvTSGAx6QZ97HX/zf4V94tRs1w
	 GvNdtu/of1nnJqN4QUT1HjdU3wkw3+PSysKjz/T/RJonEy84RpR0TIdpuQRiIn1cOnRe+
	 Udj6inS5rLg8IYXhOvcviBJwTUPVfDud3G5nFAkDfNE6Ta8YPEyFrpEjo3ISycygEK750
	 iveXUfvYtivlxXui+SOpDgqpi5guTANu78TF84Q6XXW1oTkfbw2PKz8+4bYQ0aIcmBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J874SXOh;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF40606A31D
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 14:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF40606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J874SXOh
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so2206455e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 25 Oct 2026 07:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938260; x=1793543060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=J874SXOhdAZTzlaZNlS8F6Ik+CQvdnTnx+lKiGlXkqwxUHT01wNYvMQz+nrCfvWPJZ
         3zPD8cYEPZaXCdBJH9niATV6JQDhYn6M1chXo9h/qAQxg7AoKcUwIA9IL6E+VoKLlWlE
         5zoWVIA0/Mt2qFPZS+AvcM9xjzMt76vK5qF9LWwIfDFtwYFSjh0+4c8N7jm31omgp9h+
         KPAd4PU5e+ti2hIFahAzZ29/py4B0yPFcARCZyZM1YBLGcY3qVQ7eMwXeX9ydtOqPMHm
         xpIL9xOP5y1JmUw4n2SzInCEv6Q7boTUHfoF1RVQAi8oohDQOLC9ouQzVIjVk+vVzgRy
         Xfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938260; x=1793543060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4O/RvzgiTmhk2/YkAfbJDc508W14Kdf1yTv/20bx6AA=;
        b=Sm1TQX3ErUqhkAzMtHqHIr/3TDusAFBS7Cq036IVxzFL4SLckszkFYpQo/Zdwvzg3Z
         Lt8RDlM6CC8NGAe2D020XX2BKIuFkrciO7zb1K+kmt9xc44WNNloaKPO19I5gq943JPB
         /koEo4jZI8ZOUDERqKTP2t1SmMBUCNrwZYEeBVqc5emKThn6PJnq5l/9Fq+XTNvnrgXc
         ign/AztBUW01IhWgc0eA8TjWLB3A7YBtlZu1jacOa823jnKCW/1CEc+eo4mPYXtow/Rz
         toqr1t70Klsq6EdBMn3yj9sfP1hfbYbN1JgQ0ke3OZ87gsTPYlEC2LQkZqeqpZtd5w5a
         1k1g==
X-Forwarded-Encrypted: i=1; AKwUvBxKKJodkwnRsB+Ttln5V33UW2YRDjAJvYzTqcvQHPZXR+y/y1Dq7MG2vtifOXy4x29FhNbbbnZRGQu1JQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJzZ8WLMGggrZRQ1Xfe9JMFoIR1gFUtMrvCo+uSmWDGEcEwG44Y
	Hwro9yTpqvApN6Ez51nqayfEVMCDE/60wptEjx7evvOLS5Ao55XFnQW9
X-Gm-Gg: AYBFou2Hq2sTXgRtAlBe41I0hJRL73SBCdfJVvdOK71mVTIV0EnxEDD7g/d9RawAf7P
	CdGQ6eoSwt4eethQISyfGBEnb0UdHCJcdCxs67O8YCs49HvJz2WiaL3JUjjfxbfNeteegC9+Rxz
	pfsMjkxKpvKR/G/rfc0M5um+SvD4DQ2c8G73K9a+ZiTmtcnQwVpjE4E8KnUPr//fzDvbDVpnED8
	4Q9QPoYl9fQuxrqPqAc3LdnHtFC9VwcFFIJgfHU8HiVekZ7tWfOLWDWDErp7ho14eqEDtky30ir
	gma3+C1AGpG59W+4zzhfRYj4c9ew4+BEoUrEGNtOwTEvCtaIvHGDvyU8TVrMRQMlKMQl/u62MhS
	1sCOIuDCQFPYDaGvy3vHHsYxM0MWcXG3ffY//a486QcUeEVCdDAN3QYLiYkS7IffCaVMP/jisf2
	6DMm4PIg0fr7vp1FSb/GYZnSwA0ME9teqm4ZMCd83oPmgaHPL2AqN7r+q2rGZ8h9ULrgSxodR9n
	qFwzYQH8dC0IE6u15E3Gg5B120rsSMiUhxWMBWGKhaYJaMCN3nInq5c3bOPL3VrdXgDotc3BH1b
	JT+clSWVALzdKg==
X-Received: by 2002:a05:600c:3b2a:b0:4a2:148b:c890 with SMTP id 5b1f17b1804b1-4a35ac45770mr72563585e9.1.1792938260396;
        Sun, 25 Oct 2026 07:24:20 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:19 -0700 (PDT)
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
Subject: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the first one that has IRQs
Date: Sun, 25 Oct 2026 14:24:09 +0000
Message-ID: <20261025142412.112216-1-pmazzini@gmail.com>
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

v3:
- apply irq_bank_map to the A733 register layout too (Sashiko)

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
 drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
 6 files changed, 17 insertions(+), 16 deletions(-)


base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
-- 
2.52.0

