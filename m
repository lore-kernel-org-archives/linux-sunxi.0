Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795159335;
	b=FVFItxDE47nifcietwsT781Q9HNP8+hOj5wJJEfzSKb44KwgZZzR4KkrHBPopVCqZ0lJ
	 E6NnvtCi+yQikgTUBJESGUFcL+7/DaBgGM0WyLfVSt/IU/et2tXnZD1jFYnuhqwHNiK3u
	 LLAo0uGcS+MHmVn9wa3ljjafV25JVCGBfiPxzBW19g2ACuljEjw4ec+lChna1pmb3r6Ui
	 q4DeLXOBmc0QMoyVHl2senFlh+oka9cJ9doqx7YeZGotSPAgOZekmFsHt7MBEM4b8y7IL
	 KG68coFTY+9gzdlWobZc7pVcBiJun8pwWqgmAyFFzhVjZtHCN0vuL91iw07WXuwLDWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795159335;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=SgGlaD2qvSZTgKkBZYUiqasXOgAILp8sL1oUkZRojRA=;
	b=mA5XsTBbi8HfzJS1t9KO48w38gfVWi0GjPAnB0YrVKiKwoM1PsexUzIFfbGR+rjqVRYl
	 kN+YvjHU94IiU83QisU4gV/AwnXZOSCHVJaUUXKYDpr3ao4/65wNSqbaflNQOjD/ilNGO
	 8gFwiFNH8mQIikJtathvl+qJ4xuABa//oo6oUWBHd8aGxVfsVnFzD+lC0BCz1xdE3sL3w
	 R1el2gTy2fhaDK8cvCW+u3b1UUi19hk3qPhodPq7jXs90G7BVr2nAq3gpQFgJSRpvIbpM
	 GVXn1w5qhl3PpfEuON1THhPk8pV5E+qB6kqVFac1b65GUaNbfd4N0G7uSjrbUllreJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4acv0kS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85829606A330;
	Fri, 20 Nov 2026 07:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O4acv0kS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795159335;
	b=2/0XqR1c3W1fBlle5dCcHBGIrQLV59yue0SxoGGLOmWOGfliOvlyMlrHbyBUzb+iBZZP
	 GxModWwrhMsDdyihamm2MKZfmrsRhyZCqUFrTsMkPDUTqHVV+/7OpAbm29OQRYEJACdbA
	 T40XV5UOT4nMU+NOfR8AG3e9XtsoYhZRajz9Wbt/3AGUv/ROJcrB78gIrfe5f9sxug5Fv
	 IVs1A9gX4YSihJoOPs5bl9bOytDnGb6qM+aVXsmrXbT2vHcnOmw7U6jEvyZBU1TBDKty+
	 1qa50+5GxmJYYFmBMXa+4hj3fVQKiXgxkJ3yc06LVqpBUuOQ/6qf68L1wlWY5OTM4UQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795159335;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=SgGlaD2qvSZTgKkBZYUiqasXOgAILp8sL1oUkZRojRA=;
	b=TkKMPLz3HJ5/oyKNzh/97eLUhL6OXoP9VHQiC5F9XilYUkvmDpOaAGpCwwSvDCOwP+/b
	 FUbjlwUAVNB9igCN3ov/7SB09M2aKMbwjSq/moKluqFOPJX/jeIlRD31c6VC494uTh2uQ
	 WPUaqmuaaFT0bfgGSJO2VvzdqOcXPhbNwL801WMBsBdErP89q6b1ekYeQdR1qdSGEC7HX
	 yq5FEgkyEX9vDp20Dmc1jcJXUuTA4fBh3tIIvox07IkSX2MQQ9J91UJiy04ugfsg4NC6o
	 18/9/qc1uOkvii6UE/nnmuh1TmWhWdlBN3dTFca8Xd9g0G1KPZQM/gT1xtV20mlxdjw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A50F1F000C4;
	Fri, 20 Nov 2026 07:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795159335;
	bh=SgGlaD2qvSZTgKkBZYUiqasXOgAILp8sL1oUkZRojRA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=O4acv0kSmwJdXnnLIgsXmADNzHJkcQgQwRyoi5DZtNixkXu4r3/5SqCEQwD4Wl75P
	 sKEv+b8z+lXYyUfsPlNNg9E4Tr5yGpeF/RP+wxN4e2OTfsmzkJpf/T8Hc+sNX95yR+
	 L9EOpvudiWtsqr2dBdanNQLPQpMSaob06srovYPzMwGjSAnnaeTY0HYMXi+h7AY9ej
	 phwtPGp9fhPrfeHvC7rzgrVqyjVeXSjSfbSHotRgzli906tEoy8SnO0Ao+NPy8u2S9
	 JFTH5YGENAu5jlNXD5jaZA2ZI1OxYstzSOnTh4J+j4gLT1ncSp3KqG5hURwcqKPhjF
	 kMA/0PL7hkWjQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9DBFE4974C;
	Fri, 20 Nov 2026 07:22:13 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Subject: [PATCH 0/4] arm64: dts: allwinner: Add KickPi K5C
Date: Fri, 20 Nov 2026 01:22:12 -0600
Message-Id: <20261120-k5c-dt-v1-v1-0-d9681df67bc0@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIACT1/2oC/yXM3QpAQBBA4VfRXJsy6zevIheswVBod0nJu1tcf
 nU6F1g2whbK4ALDh1hZFw8KA9BjswyM0nmDilRGpCKcU42dw4MwLnLO0qZISCfg+81wL+f3qur
 fdm8n1u4dwH0/nClLCG0AAAA=
X-Change-ID: 20261120-k5c-dt-v1-387e65a841c4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795159332; l=5556;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=PNC3qCIwbbDam5Yu7LK4Iz66FU/xwdUVpki3A9YlmrM=;
 b=jzPCYr6zsXU3C0Ttm80LxId1a1QLk8L+fERlK0JT+zYRmqO/7+vlOiilo3obWjLIwAjLrL4yx
 eESescRv2oXAYiui4Y8G/pqM6hpfl9tLRjkO9lyAWftwq9ADSH7kbcB
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
Reply-To: rajanyadav0307@gmail.com

Andre asked [1] to get the device tree for the KickPi K5C upstream and
to work with Paul on it. Paul, I have not heard back from you yet [2], so
here is my version; I am happy to rework it with your input, and a review
or a test on your board would be very welcome.

The KickPi K5C is a single board computer with an Allwinner A133. This
series adds a vendor prefix for KickPi (patch 1), the board compatible
(patch 2), a pin group for I2C3 on PH12/PH13, where the board's RTC sits
(patch 3), and the board device tree (patch 4). It is based on
sunxi/for-next, which has the A100 CPU thermal trips.

A correction to my mail of 18 November [2]: I wrote that I do not have
the board schematic. That was wrong. KickPi publishes the V1.3 schematic
on its documentation site; the regulators and pins in patch 4 follow it
and were checked against the vendor's device tree and on the board.

The vendor prefix uses the company name that KickPi gives on its own
documentation site and as the registered owner of the KICKPI trademark
(Shenzhen Kickpi Digital Technology Co., Ltd., US registration
7747802 [4]). KickPi confirmed this name and the "kickpi" prefix by
e-mail, and their engineers would like to follow the review; I will send
them the link to this thread.

Patch 4 describes only what I could verify on the board. Left out for
now, with the reason in the commit message: Ethernet (the PHY driver is
not in mainline yet), the Wi-Fi/BT module (no mainline driver, and its
SDIO card did not come up after a cold boot in my tests), USB data on
the USB-C port (not tested) and the RTC alarm interrupt (on PB8; it will
follow once fully tested). The CPU uses the A100 OPP table, like the
other A133 boards; once the A133 speed grade series [3] is merged, I
will send a one-line patch to switch the K5C to the A133 table.

Testing (KickPi K5C, PCB V1.3, powered from a PC's USB port through the
USB-C connector; sunxi/for-next plus "cpufreq: sun50i: Handle boards
with the allwinner,sun50i-a133 compatible" [5], which is applied to the
cpufreq tree and in linux-next; without it cpufreq does not start on
this board, but there is no build dependency):
- dtbs_check W=1 adds no warning (only the existing /soc one from
  sun50i-a100.dtsi), also on linux-next; dt_binding_check, checkpatch
  --strict and dt-check-style (relaxed: clean; strict: only property
  names defined by existing bindings); each patch builds on its own
- PMIC: every enabled rail read back from the AXP registers matches the
  device tree; unused rails are off; DCDC2/3 dual phase confirmed
- eMMC: HS200, 8-bit, 150 MHz; two full reads of the 15.6 GB device give
  the same checksum
- SD card: 256 MB written, read back after dropping caches, identical
- USB-A: the on-board GL852G hub enumerates; a USB stick reads back
  identically at high speed
- RTC: time set and read back, kept across reboots (no backup battery
  is fitted on my board, so it is lost on power-off)
- status LED: lights up when switched on and blinks with the heartbeat
  trigger
- cpufreq: every OPP runs at the expected clock and PMIC voltage; the
  90 C passive and 110 C critical trips are in place
- 30 warm reboots and 3 cold boots of this version, each checked (eMMC
  HS200, SD, USB hub, RTC, LED, cpufreq, thermal trips)
- 10034 random cpufreq transitions under load: every OPP ran at the
  expected clock and PMIC voltage
- soaks of 1 and 3 hours with full load on all four cores and, in
  parallel, repeated eMMC reads, SD card write/read-back and USB stick
  reads (477 passes each): no mismatch, no I/O error, no new kernel
  warning; without a heatsink the CPU sits at the 90 C passive trip
  and is throttled by one step, never near the 110 C critical trip
- the RTC kept time to within 1 s over 3 hours

How this was made (Documentation/process/generated-content.rst): I used
Claude Code (Anthropic, Claude Opus 5.5) throughout. It used the board
schematic, KickPi's documentation and the vendor device tree as sources
of hardware facts, compared the existing A133 board files for style,
drafted the device tree, the binding changes and all commit messages,
and wrote the test scripts. No text or code was copied from vendor
sources. I reviewed every patch and ran the tests on my board myself,
and I take responsibility for the series.

[1] https://lore.kernel.org/all/d4d89cf9-884d-424b-927d-5b6692f50327@arm.com/
[2] https://lore.kernel.org/all/CANxy8yTA7Nqmggk=qn7tCnXn50vS2ceHdZYZC0_OancmZhnKcg@mail.gmail.com/
[3] https://lore.kernel.org/all/20261118-a133-series-v2-0-8bcec9c9aadf@gmail.com/
[4] https://tsdr.uspto.gov/statusview/sn98032871
[5] https://lore.kernel.org/all/20261104-a133-fix-v1-1-d0b5ad3d4c5d@gmail.com/

---
Rajan Yadav (4):
      dt-bindings: vendor-prefixes: Add Shenzhen Kickpi Digital Technology
      dt-bindings: arm: sunxi: Add KickPi K5C
      arm64: dts: allwinner: a100: Add I2C3 pins on PH12/PH13
      arm64: dts: allwinner: a133: Add KickPi K5C

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |   6 +
 .../boot/dts/allwinner/sun50i-a133-kickpi-k5c.dts  | 228 +++++++++++++++++++++
 5 files changed, 242 insertions(+)
---
base-commit: 03b3355ed7a39b4416f0d0a39061479b1aa13196
change-id: 20261120-k5c-dt-v1-387e65a841c4

Best regards,
--  
Rajan Yadav <rajanyadav0307@gmail.com>


