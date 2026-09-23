Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA943CD8CC
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 05:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790141786; cv=none; b=HVL1kHTSYKoAm/BA/Z4Bg1jM5mqKYrigWtaYobj+jhMikoU4T4bPH5sXIznZAZAliDTBk0YSQSliygcegF4incOn41nm/9i6k+MFjXKO4cLb5smSP5cJW3HZ8Ih+fQmlshIe4X0Zq689TGVwOny2BtOesyze7qmfo+pDz8kPi1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790141786; c=relaxed/simple;
	bh=tOIIQ39Owc1Cd1bkxrr2s8xvl03xqpGe8YvoBH7XOMA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PJXrEzj9qew3EmKjZimqWr5G+AHbum7zKpafiFnkOk0N8ErXKHcBs8ZWmIUrZ4CvXsqx1dhuJR8Fdc6wzH0/LsOCOpExvsVEIPblS9GL5oe2vx7AslkX9CaSwB5dkEg2BpQQdRmiAXgCqn1tj4VHCPSrb4XPJG4cucMB9SZcsfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA6j3yHS; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA6j3yHS"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a36887bso376309b6e.2
        for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 22:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790141782; x=1790746582; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ABaXCBsTQp5NQiWvl+58UyLd/TE5kIyNOsBQgPALKkU=;
        b=CA6j3yHSiAls59bwX4mLAOg74TSOw45CkI4pPqXqeui0hDlB7T9Wtpl6EgcWADNxcR
         01Xj0bFaJElnEB8zMIZyE0SldrFQEFq2ED/+ah+E96e8NZgf71Xp+R1XkBQZP73lEmvI
         edT5iEKJyQh0T/UdNxKctsKCd0bB5ocAOC+x6wmFh8yEa9t0koOt0MhKTwBIaT0z3oeR
         qInlKC8L77BnS5LABkFtF9XyUcagdVhjoEv8JB/oYFjGPO45fRQEi7p8AIfCVEwiAtBQ
         dgCpSddvgFkQPJpJYExZhZlUvtSFgV1+pLPsU/Bycx3ycsDMRB03WQDlv/5mkKKB966R
         D8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790141782; x=1790746582;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ABaXCBsTQp5NQiWvl+58UyLd/TE5kIyNOsBQgPALKkU=;
        b=DZcAPSx/Xp4F3R3A2GywmH2nvYqlOiQiWXlaoEqVH5aaKNrr5oXo7u0s1u6Glublck
         yhTMSSQ17byvHNHT53jCqMxkhvldXw4AKR3St540Oi8WIrIIzaaWWG0te7rJ+/EvFE0d
         Zm7yTGurfu0IjgCAq+4ubYVIeUZJVEogQf9tcjshLc9pYutszfyxC3wiNDneipw4GXTc
         iZNhAefRya0TGNpKppD4rtYb8l74U9jy4tEX2IsDu6oQQ+CLm7tEAS5OmSV1mLzUb00n
         fQVty/ndd60Au1FMumyHTd9wj8/FU1DcYiw39yVCuZ+tNsUxLzo+e4qUJC1o/5LmftHB
         a/yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ79weg4+WIpi/cwSnR7xnSIUktOR0LAvdRpwQPCVtsWMWjZDdkIxkxcO5KwEdPojanu8FzsQmudq4rg==@lists.linux.dev
X-Gm-Message-State: AFuF++m9wNFDVzJqEa7rEbOyasbhMkdPeEvUXf7n2yJ7SwF6CI2dj96R
	CsqPbbmix1EQ0JlfjLKuO7ysTaRmYJtKt4tEMSl+Rei8TnxcsnbnTSTx
X-Gm-Gg: AYBFou0L9snqg5Z82TlXSEesvHGQi0uQMfLSQc4P88DaD7Pj7iKX7EM3jDseV7aGD1q
	MmI8Eoo5jfZRnD5+yBJJjMannlO7A3pZ+Z/1jN12FUiLZT+xfI6lsqnFv7b3MxMcmPkql/XkPYG
	G759Ul186tgAa5g/VYbwUjU6ATf62egB34L9rJbrZeCrpYfqSAxAB43sOXo5myjyP3jXvCmvBt4
	+in0fXiLuYIsk1C9+/+4OTe7etgN2fdl5uIvUustohDOursnF9uuDu8kZpcoo0+Ks9wfM8GTrpE
	GEM2Bl9JICP5dfrBw9jgYxnIqN5snJwk4oaOrxR2QL5HadYLT0J31qqc5ejvXmc35DqtF7YAkkt
	H1D8yTAvH5FtFNzKSgffher5a7gPWi2dYnMX81ZiGiB6ieYmr/XfHXJcmzcZzRse8nRFhsmTwPx
	Tx5oNRpjRBRM5o05yimekWGRw0KP7vsoEDaGAI2sw++BhIYAS++zq060QHGiTuDYLfcqgo/jRxi
	yVqOGPA2iTvCtPWKxUy51rilE41ZLoVi/ntrpA8MB04N8KEkehCaUp6pXT88DPL4ZkQ4ZcVPHXC
	RM7s+7FF3lp4/JIkSRrFlQLYSApaSRBvLZVPzCyXmin9vgTllIe9mDQbovZ7QgBbMgEWvSRymg4
	kykA3ntkaVKtoJ9ONmEgq
X-Received: by 2002:a05:6808:c3eb:b0:4b9:a8ac:47c with SMTP id 5614622812f47-4d5b9523241mr1514181b6e.26.1790141782531;
        Tue, 22 Sep 2026 22:36:22 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4aed99bsm1436896b6e.12.2026.09.22.22.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 22:36:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v10 0/5] Introduce Allwinner H616 PWM controller
Date: Tue, 22 Sep 2026 23:36:13 -0600
Message-Id: <20260922-h616-pwm-v8-v10-0-dccebbe1aabf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XSyWrDMBAG4FcJPldmFq095T1KD17kWCW2g+y4L
 SHvXjmlOOmhuCAQEvr+GSRdstHH4MfseXfJop/DGIY+LRCedlnVFv3Bi1CnjYyANFhg0WrU4vT
 eidkKT1g4kgYccZbEKfomfNziXl6/1+O5fPPVtEQsJ5o4dGJqoy/WVAOMighVjo6scgJFDKl4r
 POD74dzvS+HYTqGPq+GbglpwzgN8fPW9IxLsSVIIYFCAGKXo9LMiv9OWjqc6Y6jAUsKZG6BSG/
 A/IM1IDE4ZqIcmQxbt4HLlTMocOiUy0kxsJEbuFq5RI2MEl2+XGWaN3D9i8tUNnENis0Gblb+v
 we8abtqC/LhU6UBoi7ZFKXVJAu/P3RFOK7WrdYRPlqXLJvSV5oAm0bd2+v1+gWdiC698AIAAA=
 =
X-Change-ID: 20260803-h616-pwm-v8-e21a92470923
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

The H616 controller has six PWM outputs, paired as 0/1, 2/3 and 4/5.
Each pair shares a source mux, gate and power-of-two divider. Each channel
adds a prescaler and waveform generator, with a bypass for clock output.
The bypass can supply the input clock for the co-packaged AC200/AC300 PHY.

The series separates PWM waveform support and exported bypass clocks into
distinct patches. Internal CCF pair clocks model
the shared hardware, while PWM request/free and clock prepare/unprepare
arbitrate ownership of each output. Active PWM outputs and prepared bypass
clocks protect their shared rate against incompatible sibling requests.

Firmware-active outputs are preserved until a consumer changes them.
Hardware-enable checks protect their shared gate and rate even before
Linux has an owner for them; there is no driver-local unused-output sweep.
A conflicting shared-rate request is rejected while an inherited output
remains enabled. In particular, assigned-clock-rates cannot override an
incompatible firmware-active output. Firmware must leave a compatible
configuration or disable the conflicting outputs for that request to work.

The clock-provider interface reports the actual pair rate and makes rate
protection visible to CCF. In contrast, drivers/clk/clk-pwm.c advertises a
fixed frequency without checking the rounded PWM result: a 42 ns, 21 ns
request selects 24 MHz bypass when available, but can become 25 MHz when
a sibling holds the pair at 100 MHz. The direct provider still permits
CCF rounding; it does not guarantee that every requested rate is available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Assisted-by: OpenAI Codex
---
Changes v9 -> v10:
  - validate the single clock-specifier argument before reading its channel
    index (reported by Sashiko)
  - Link to v9:
    https://patch.msgid.link/20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com

Changes v8 -> v9:
  - split PWM waveform support and exported bypass-clock support into
    separate patches, retaining internal CCF pair clocks in the PWM patch
  - preserve unclaimed firmware outputs instead of stopping them at
    sync_state(); replace the empty disable_unused callback with
    CLK_IGNORE_UNUSED
  - embed the fixed six-channel topology in the pwm_chip allocation, remove
    single-variant match data, and use a channel-indexed clock lookup
  - store bypass clock state directly in each channel and recover the channel
    from its clk_hw without a separate wrapper
  - avoid module self-pinning by acquiring internal clock consumer handles
    only while a PWM is requested; use provider-owned handles for notifiers
    and rate readback
  - use scoped locking and protect rate_exclusive with the register lock,
    keeping CCF operations outside it; remove ownership WARN_ON_ONCE calls
  - explain unsupported pulse/dead-zone reads and rename the waveform
    conversion helper to match its callback
  - pre-encode waveform registers, isolate update preparation and rollback,
    combine candidate comparison/selection, and remove redundant rounding
    corrections and private waveform-field checks
  - normalize polarity readback, use ordinary boolean waveform flags, and
    remove the redundant bypass recalc_rate callback
  - clarify the clk-pwm rounding limitation and correct the v7 topology
    description
  - Link to v8:
    https://patch.msgid.link/20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmail.com

Changes v7 -> v8:
  - require both the module and bus input clocks for H616
  - clear the complete two-bit clock-source selector field
  - leave rate and period registers untouched when disabling a channel
  - distinguish PWM-owned bypass signals from clock-owned bypass outputs
  - round shortest-period requests using the fastest achievable clock
  - encode constant levels without overflowing the 16-bit active-cycle field
  - require #clock-cells for the H616 clock provider  (reported by Sashiko)
  - allocate clock topology state per device, use the fixed two-parent map,
    and use managed clock registration
    (reported by Sashiko and suggested by Philipp)
  - deassert reset before registering clocks and keep the reset handle local
    (reported by Sashiko and suggested by Philipp)
  - arbitrate channel ownership in clock prepare/unprepare and select bypass
    only while the clock output is enabled  (reported by Sashiko)
  - roll back failed PWM requests and serialize channel release
    (reported by Sashiko)
  - protect the shared pair source while either sibling channel is active
    (reported by Sashiko)
  - preserve the 65536-tick duty intermediate before polarity conversion
    (reported by Sashiko)
  - keep the hardware-waveform state within the PWM core storage limit
  - clarify that either co-packaged AC200 or AC300 PHY uses the bypass clock
  - drop driver Tested-by tags after the clock implementation was reworked
  - quantize inverted waveforms in hardware ticks and report their
    physical offset
  - force released channels off so stale waveforms cannot restart with a
    sibling
  - track the active and pending cycle for the period-update handshake,
    adapt the sleep interval to bound MMIO polling on long periods, and
    honor the PCLK rate constraint
  - quiesce rate, polarity and bypass transitions before reprogramming the
    output
  - clear unsupported pulse mode when programming periodic waveforms
  - describe the bypass clock cells and simplify the fixed parent topology
  - avoid resetting active pair registers during probe
  - model only shared pair clocks in CCF and program per-channel dividers
    directly
  - make pair-rate changes transactional and hold exclusivity only while
    an output is active
  - implement formal waveform rounding across all parent, divider and
    bypass choices
  - preserve firmware-active outputs through generic unused-clock cleanup,
    stop any still-unclaimed channels at sync_state(), reconcile empty pair
    gates through CCF, and reject pair retuning while either output is
    active
  - clear dormant dead-zone state when both pair outputs are disabled,
    while rejecting active dead-zone and pulse modes which the PWM API
    cannot represent
  - correct the hardware topology to show the pair gate before div_m
  - Link to v7:
    https://patch.msgid.link/20260703152215.192859-1-richard.genoud@bootlin.com

Changes v6 -> v7:
  - Cc Common Clock Framework maintainers  (suggested by Uwe)
  - add missing static before SUN8I_PWM_X_BYPASS_GATE
  - reorder code in probe to fix potential lifecycle issues
  - set pwmcc_data[i].parent_names to NULL in sun8i_pwm_unregister_clk

Changes v5 -> v6:
  - remove trailing junk after the patch 4 commit message
  - remove Tested-by tags where they do not apply

Changes v4 -> v5:
  - fix bypass handling for channels greater than 1
  - add colons to clarify two debug messages
  - switch from H616 to sun8i prefixes in code, filenames and module names
  - fix consistency issues in macro parameters
  - rename confusing macros

Changes v3 -> v4:
  - gather Acked-by and Tested-by tags
  - fix a pointer-to-integer cast size warning on ARC
  - add a managed action for clk_hw_unregister_composite
    (suggested by Philipp)
  - remove the unused pwm_remove function  (suggested by Philipp)

Changes v2 -> v3:
  - use U32_MAX instead of defining UINT32_MAX
  - document U32_MAX usage in clk_round_rate()
  - define clk_table_div_m using macros
  - fix formatting
  - correct the parent clock order
  - simplify code using scoped_guard()
  - add a missing const qualifier and rename to_h616_pwm_chip() to
    h616_pwm_from_chip()
  - add missing error messages and remove redundant ones
  - rename cnt to period_ticks and duty_cnt to duty_ticks
  - fix PWM_PERIOD_MAX
  - add the remove callback
  - replace DIV_ROUND_CLOSEST_ULL with DIV_ROUND_UP_ULL
  - add H616 prefixes
  - protect _reg in macros
  - switch from apply/get_state to waveforms
  - shrink struct h616_pwm_channel

Changes v1 -> v2:
  - add missing headers
  - remove MODULE_ALIAS  (suggested by Krzysztof)
  - use the sun4i-pwm binding instead of adding a new one
    (suggested by Krzysztof)
  - retrieve parent clocks from the device tree
  - change num_parents to unsigned int

---
Richard Genoud (5):
      dt-bindings: pwm: allwinner: add h616 pwm compatible
      pwm: sun8i: Add H616 PWM support
      pwm: sun8i: export the bypass outputs as clocks
      arm64: dts: allwinner: h616: add PWM controller
      MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM driver

 .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml      |   33 +-
 MAINTAINERS                                        |    5 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |   47 +
 drivers/pwm/Kconfig                                |   12 +
 drivers/pwm/Makefile                               |    1 +
 drivers/pwm/pwm-sun8i.c                            | 1256 ++++++++++++++++++++
 6 files changed, 1353 insertions(+), 1 deletion(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260803-h616-pwm-v8-e21a92470923

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

