Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFC830F7FF
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 21:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495626; cv=none; b=UfRRofqOXvq/T76tW3fV6jO/iyyTSBHw+1ncyYUxAiKHGsNW953Slijh541G/QzF1FtPAmsH9yJ04g6vBLjO90fsPnjOksskly+47tCL+udakqx6iPKg1QadldDQdnL/hud70I50VXtY0b2LVbBTfZcMB/YMabh+5nUyNxAhWpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495626; c=relaxed/simple;
	bh=rQT7FnSJWSbCZQvFgg9XlhlbtVZ2Cd5f1GzQeXk++wE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BBEywrOJz9dAZaEUE2EZnQUfcA3MQU4p6z539NjXmJLo/VChSgfBh8XMGzFOrVAkg5aKjMWaKP6t6vx7WhX90hqsvxSM0g9b1Yx3TgDc4dLx3ZsEcPGWL1fygJbR+8qq4SyRlkUUzL5dTJuzFQsHWFUqdD0imf4zC65SnGt0IAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hxByl2i2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hxByl2i2"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso4694985e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Jul 2026 14:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495623; x=1785100423; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoqurlPSvAJxWv157dNwPLL8InVlGkCToDlg+t76AwE=;
        b=hxByl2i2eYqPMjXYCfMWWgM0At1Jf8GR860a2F7iGu1353t8nmEkwsauFx7u/5svsw
         1adGfFqp19r9Mmdj9TOgWRxT/+T4olC+UbKBHayw+MQzcNrXVxAt6D+tXpGF14J5eUuN
         eVc3nhG80iIUSuQCcr4P/MrDMtCsj59VU3kHbqSRfTBwtIsrk9ey2ij8CdiUqdUhtfFt
         d1I5egnyR0TfxHRH0dQZ4PGuYCgYSb9jh85QUl9YdgdhAOefOvg9Y287dXtHkSoOvB3E
         fWpjRP0sZ8PMtoXO1wnFSA2of3lwTDs0jpcWHjXR1vXWYnIxQswag13NfN+4RMCdersp
         S2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495623; x=1785100423;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoqurlPSvAJxWv157dNwPLL8InVlGkCToDlg+t76AwE=;
        b=hIuYWRaRd8lW12vfl/ewEHzwmGn7EqmuWN3FlWCfrst86+SDrrh9vexOEHK+e4GzjX
         rNhPCc217NF+9qcQEh1MGPccGl97MmgPBELuNPetaUtCz6EVCyJpfrhxyYXkMjvOfrlB
         mfR7Dxmhvw8NSEdzv1j8rQ0j7VNtkuwfVuAvRW3rRDZCYkaTZ1rSuuISnmCSzOiaLbHw
         nPob98mE+O2CBrko8b8bC2xb1SQ8Bq4AHOURAt7OMhZcNtf1j7KOZkdemiSplZKklF9q
         ap9dNiOZtFQGrWc34srwF8VDgDcDLGZ/A8k0+0p0sBwxHUlLo11JRkP67j4bSJmMuSSQ
         Y4RA==
X-Forwarded-Encrypted: i=1; AHgh+Rrswp3eUnsN+VjtjYZZG1uBuomBujCWcrEt+Yu/M6xNfSG5oZXTRG3wKqOshEwFIQGQ+uhWk4F7KOI5AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyY0s+IhcqKp1HDHSFfaHcY8mZD1PlaGUkQl76zIrUXKoRRdAfJ
	+I/kBnJRKmEidD0j3nY9ISu+DbiOag4PCSJTUmBnEJnQcFoHbaIKvUxe
X-Gm-Gg: AfdE7ckZDYmUwf9m3wOwtdCk6CYcOVehU8WrY1VnqaGBWh303leRSc0rfnXKa75eFYl
	UI2okvT2WvAeEUGKK1bn/cP98LIKbrSx/yo0U69nd2ZqGzjt7MpsjiiWSeKXJPbqdRZ5zLejUtY
	HYQydwoXc+9kyZv9btObAbHCIx/PO2HCxz0yzl+xCo7a8hNK+tHQ3Xc4Yw3+kQMtLVM7vjfkeqt
	UZzeotk+Bz45UHoG+CEx+s2nAZgSHzm4ajZN0YRV8SOb5+z2XoUMG5pi/fbd849yjh5V267ITgj
	/1BOv7Xio7xxU44tBC+2pvk0/pTezV4SJUtjBM5cLDmaNDOSil2nbNzUtnoKDXHi4SxNtwuVIWj
	eUIMDAfxmeLLl3Y6E4EJy1GyhbJBZppWRFkScLiNpXW2KCgxSWCJWH/rIRtAJb/i0Iys4EiHqfZ
	HuMSO7BVR2VN3+Ls1VzwWOkoZanuU+q6hwFnvFGSsLov8oe3g=
X-Received: by 2002:a05:600c:3b10:b0:495:4aff:5fce with SMTP id 5b1f17b1804b1-4954aff609amr121711955e9.32.1784495622909;
        Sun, 19 Jul 2026 14:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:42 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 0/4] clk: sunxi-ng: fix the A523/T527 GPU clock model, enable GPU DVFS
Date: Sun, 19 Jul 2026 23:13:15 +0200
Message-ID: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series follows up on the discussion in [1], where Chen-Yu pointed
out that the A523/T527 GPU mod clock is not a standard divider but a
fractional one: GPU_CLK = Clock Source * ((16-M)/16), with M 0-15.

I checked this against the T527 user manual (v0.92, section 2.7.6.58,
"FACTOR_M: mask M cycles at 16 cycles") and verified it on hardware:
with the current linear model, forcing each OPP on an Orange Pi 4A and
measuring the real GPU frequency with the Mali cycle counter gives

	OPP request	programmed	measured
	150 MHz		600M, M=3	~487 MHz
	200 MHz		800M, M=3	 648 MHz
	300 MHz		600M, M=1	 560 MHz
	400 MHz		800M, M=1	 749 MHz
	600 MHz		600M, M=0	 599 MHz

so every OPP below 600 MHz silently overclocks, up to 25% above the
vendor ceiling, and thermal throttling to "400 MHz" actually raises
the GPU frequency.

Patch 1 adds a small ccu type implementing the cycle-masking
semantics.  Patch 2 switches the A523 GPU clock to it, drops
pll-periph0-800M from the selectable parents (the vendor BSP removed
it citing GPU job faults) and drops CLK_SET_RATE_PARENT (pll-gpu loses
its CLK_SET_RATE_GATE protection once the GPU runs from a periph
output).  Patch 3 registers the existing sunxi-ng mux notifier so the
GPU is parked on pll-periph0-600M while pll-gpu changes rate, as
Chen-Yu suggested in the same thread.  Patch 4 adds the BSP operating
points to the Orange Pi 4A DT, which enables panfrost devfreq.

With the series applied the same cycle-counter measurement reads
149/199/300/399/597 MHz for the five OPPs, all from the intended
parents, and devfreq scaling plus thermal throttling (emulated
temperature) behave correctly under load.

The higher speed-bin operating points of the BSP (648-792 MHz, gated
by a SID efuse bin, running from pll-gpu) are left for a follow-up.

[1] https://lore.kernel.org/linux-sunxi/20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com/

Juan Manuel López Carrillo (4):
  clk: sunxi-ng: add cycle-masking divider (maskdiv) clock type
  clk: sunxi-ng: sun55i-a523: GPU clock divider is fractional, not
    linear
  clk: sunxi-ng: sun55i-a523: reparent GPU while pll-gpu changes rate
  arm64: dts: allwinner: t527-orangepi-4a: add GPU OPP table

 .../dts/allwinner/sun55i-t527-orangepi-4a.dts |  30 +++
 drivers/clk/sunxi-ng/Makefile                 |   1 +
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c        |  47 ++++-
 drivers/clk/sunxi-ng/ccu_maskdiv.c            | 199 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_maskdiv.h            |  71 +++++++
 5 files changed, 342 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_maskdiv.h

-- 
2.47.3

