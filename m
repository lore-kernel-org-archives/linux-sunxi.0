Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF15475F
	for <linux-sunxi@lists.linux.dev>; Tue, 22 Sep 2026 00:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035605; cv=none; b=rLf5Wsy8/H3PPSXyOI0ZcG330LVPwKRzp6a73kHXnplKncUbZfPtZaq5aXYS0WQ7mjp3Te5ApupjLWK37whMc6w3OS57+DK+r2gwjxpffv6Vh7NRl7JHEtMwqB8Rpu8u1u3D4JkSB3Zk9TFp8ANUjxUIacnt7Qfp/CPMMD5wDzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035605; c=relaxed/simple;
	bh=3ZiEYgs66JjMcCuauFx46eZryUSdHAq3p4tb1mdjWFo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cg0XefA7qvuIvbq5p7bIKeeFlFkDXhldaVPOBhTJ5fsbZikYo96Dvv68J8g6mNFLk92tnHD5ySn3qtO2kh8OktoiLBA/Y6YPLZykcv2zv18gkfdWFE+OqyY+quM7O1/jTWQZrLp5ne8zwrKLh92/EzgQ8mZkiUJ6cFrtxx6yP9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoMFrh//; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoMFrh//"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-48f69d8f72aso211507fac.0
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 17:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035602; x=1790640402; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FslmR0HpZwY9vTBSDa8uVLgh32qLwFuSXvKOlSjBkqc=;
        b=ZoMFrh///CUcroluYLqSV8VBN7DK/18dw4xraEt0XzX8CNWLbdgehLGlCdtC1U3AE/
         iXDEpOMgcLiqcu5BzYEvMXY2liNqAbW5W5H3kujHgbIUliUJW+asmhCtXms+u//tVkgj
         8vzvGTCj1KqYbZ2oVz+ovgZggNZqpMB6i9XoZPOPat+QK0Dh7/yLWmaiUAkb69UbqpTu
         7QuOA7SnLJD/C7//48xsoUnU03bDfXSPPbpW3vllaPB78ACgGLSSoK5zUpcmAUfN3EoK
         VtRVpgErVJRp+FjoNRcMYvhmihZQAmCcrWdGxczJz69dqVxlh9i3JW27v9pzEgdAmBNP
         PGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035602; x=1790640402;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FslmR0HpZwY9vTBSDa8uVLgh32qLwFuSXvKOlSjBkqc=;
        b=1MkUtRmiO7Lf5AGqMkrzLFKqGy8smZgETtqjevifwEDA61e/9wjkBUtkEbM/347id+
         9Rrt++P97kHHsUviAuPYb3CfWycCsuE/cjiS5mCCCyZxPNgcdRm1b6HftYYyUjZXZImW
         RmC3PfoGzuQ65+uS2QfvIWd/SKRiZ5uc8pByPM49SKtPNbuFF4i4sF5nr2ijumdYP69O
         a0UG2mLvIe4LyvKg0qohRBTQSRjTxnYt9iFnOeo2N/QdWnLQHJRBC9u0iNj0UZsYa+85
         KOmqFaq0+aGjfHmXru5JzxWX4Hys++9usjKFeHtne8boR5Ez8N0XqLHonKc4rjRq7+7W
         E97A==
X-Forwarded-Encrypted: i=1; AKwUvBzPvPnpQg4OvmV+LKpL6pzhFb/oY3vq7Oe5r1TAD7yE1NsGKTUOLv2QXqeLUsnjl79iGCUABFoJ6SRwyA==@lists.linux.dev
X-Gm-Message-State: AFuF++mAW8H1qczQGHDxI4C9M9glM8qTxZla5S37ZUtmv3/UE7qEbcnQ
	HbMsdvKw6O2jzG18Izt9KNd4WytYa40CsEZmNh6Hpjp2SqGPcqhoVYtc
X-Gm-Gg: AYBFou1r+PkCQcDmjxQ8QlhBrwhynyvZ8HSM49o/LQpYpDdfnl4cZELlPW74YA2Zg+N
	lGJVGJIapf+oApBiAK4z+ZkEzsbvK+02LkyzAfhX79WtKWMSgX4HrXWeQ4I0ApIcPYQndJ8JHWa
	vK07ry4r/TV34+dcn8Xsbn8yf3M4gQitgFecy/aS3eQ6zwYXb9voxLTitd/KanmQFC1JDHHP3uu
	wwiOnbtIT8UD+nuV5QyUN3xQNTWgnD9ksnTMwjg7af2qHJAfoXByFiUBJzT4qJZ8+RQvdXng4od
	OrhmWuV8kq6sKXtryVIxjsJ0YADp2s9oORv5uLa2E0Ktpyd52byewjxkHP4e4GNPyrJxoevQWMJ
	IPsGJKq8/pHmuysJWJzjzNvR3i5rIgCdlbvfg3/7X6umhevnIOQ5pThVdfpzeKWYvAYvBcQnjO8
	fj4TPQVOY/4f4HOwTzPOlWvMt9arXQ6oSEifVbhiqnLHPc5LaeaW0S0TlXAuKb1EHnT3ciuieLL
	ySKc4C5RC8if4kVPWCdmy2mi3vPVVxcMANx443CeZsPS1yTVDbbzGAjq1sgH0dAbo18AhXhSQdF
	eizfpdZgUo5KGO47BpUVcwbNYN/cjaGmZPIy+VsIn14+gYYUA8Z/26QT30TDdCqFG5G8vN71RMG
	4WNQTZTk8sL8qgRt4wtH6bX0Vm7z9d8g=
X-Received: by 2002:a05:6870:80ca:b0:451:ca58:626e with SMTP id 586e51a60fabf-48f416e5dfcmr1173826fac.8.1790035601642;
        Mon, 21 Sep 2026 17:06:41 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f7280cf14sm801683fac.13.2026.09.21.17.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 17:06:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v9 0/5] Introduce Allwinner H616 PWM controller
Date: Mon, 21 Sep 2026 18:06:29 -0600
Message-Id: <20260921-h616-pwm-v8-v9-0-37bec6201ff5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XSS2rDMBAG4KsErysxDz2zyj1KF3asxCqxHWTHb
 Qm5e+WE4raL4oJADOj7Z5B0LYaQYhiK7eZapDDFIfZdLvzTptg3ZXcMIta5LgjIgAMWjUEjzm+
 tmJwIhKUnZcETF1mcUzjE93va88ujHi7Va9iPc8R84pD6VoxNCuWSaoFRE6GW6MlpL1CkmJunW
 h5D11/qXdX34yl2ct+3c0gTh7FPH/eZJ5ybzUEaCTQCEHuJ2jBr/jtpnnCibxwtONKgpAMiswL
 zFzaAxOCZiSQyWXZ+BVcLZ9Dg0WsvSTOwVSu4XrhCg4wKvZyvMu8ruPnFVW6buQHNdgW3C//fA
 961W7QD9eNT5QWirtiWlTOkyrA7tmU8PeztdvsES28n3rMCAAA=
X-Change-ID: 20260803-h616-pwm-v8-e21a92470923
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-clk@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

The H616 controller has six PWM outputs, paired as 0/1, 2/3 and 4/5.
Each pair shares a source mux, gate and power-of-two divider. Each channel
adds a prescaler and waveform generator, with a bypass for clock output.
The co-packaged AC200/AC300 PHY uses PWM5's bypass as its input clock.

V9 separates waveform support from the exported clock-provider interface.
The first driver patch retains internal CCF pair clocks so both patches
use the same shared-resource implementation. The next patch adds bypass
clock consumers and PWM/clock ownership arbitration. Hardware bypass
rounding remains in the PWM patch so it can represent inherited state
and the shortest supported waveforms.

Internal pair-clock consumer handles are now acquired only while a PWM
is requested. Notifiers and rate readback borrow CCF's provider-owned
handle, avoiding module self-pinning while preserving readback of
unrequested channels and separate handles for sibling rate protection.

Firmware-active outputs are now preserved until a consumer changes them.
There is no driver-local unused-PWM sweep at sync_state(). Pair gate and
rate-change callbacks still check hardware enables, which CCF reference
counts alone cannot account for. The exported bypass clocks use
CLK_IGNORE_UNUSED rather than an empty disable_unused callback.

The clk-pwm concern is not that a 42 ns request always misses 24 MHz.
It does select 24 MHz bypass when available. But drivers/clk/clk-pwm.c
advertises its configured frequency without reading back PWM rounding.
If a sibling holds the pair at 100 MHz, a 42 ns, 21 ns request rounds to
40 ns, 20 ns (25 MHz), while pwm-clock still reports 24 MHz. The direct
provider reports the actual pair rate and exposes rate protection to CCF;
it does not promise that every requested rate is achievable.

Keep the period-update handshake, safe clock/polarity transitions and
ordered waveform rounding. The hardware manual requires these update
constraints, and dropping shared-pair protection would disturb an active
sibling. Rate validation cannot be moved solely to request(): the PWM
path protects the rate only while active, not for its entire requested
lifetime. Sleeping CCF operations remain outside the register spinlock.

Waveform conversion now prepares the channel register values directly.
One helper handles rate protection, quiescing and rollback before the write
callback applies those values. Candidate selection uses a single ordered
comparison; redundant corrective rounding and private-field validation
are removed without dropping the bounded divider search. Normalize polarity
readback in ticks, use ordinary boolean waveform flags, and let CCF inherit
the bypass rate from its parent without a passthrough callback.

The previous cover incorrectly described v7 as lacking shared pair
clocks. V7 already registered pair clocks; the later changes concern
channel-local dividers, ownership, rate protection and firmware handoff.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Assisted-by: OpenAI Codex
---
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

