Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775870;
	b=OcB6h9ZK2lAiohXU3sQJaIIZdreYmA2zPfrlXuCNAW3cjN75w0AQsMJLkaw0DV7LYEAA
	 q5ui56y8wGpdh0spVdyLlCgnWmetw6wWcxHbV3LiyXDsHx4OfehclrlJ6v+EjKmWwPwmk
	 2wUtqMowFR/wHsZIz6+6ZTn7lakc8OUkZEy6lSmtkH0GviLvLZcXqSZQu4iArK2TaCRja
	 GRkIDdpRQSg/eMhA9ga4MBrzIKrE2dwz/hpVM94e30bGqUaokAHz/MzMjk9vJobrLgWAR
	 wH3be0IS/bKSWAPvlMYMjUDLDxHKuHaPOdn8n8bjNrFwTDaejBwIuwLrDcJO801007Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=86GdDOrVYBSJkDaRa4F2XA72F+Lkoyx5IZhBWPYbrCM=;
	b=qOgHLUJcCPrfb/JjO7qnla/JcZ+gJI7kdMgHYF4SvPQNZfAw+qAUTYvtMFyrJxAzVgoJ
	 04rl+ngHo7vK7Vm/JEfyhmFmqnHfavnjY7gQUYnnEFTWYgWD66PtBoDNB/iO1ncaH2XSG
	 opJsvcEhWQ9Zq/5ik6XQR7Ual10xsMpNQ4cBEZW2su75wm3b6xiXeAEcCg9ivAvYbUDHZ
	 r3V7UKd5io4+XI6TRWNoglWfBpjVpVmdsWjAF7MvicEOwJmlRHrkIv03fEU4AthuNEs2U
	 l3kOsX9lBcIbMMHet13alHcoTiXT5GFjrWGMLq9uvdnXewAAnTXaMiiM+tSi5/K3FAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RDNPKHry;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6E606A31C
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 10:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD6E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RDNPKHry
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-491846221ffso6975284f8f.3
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 02:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795775868; x=1796380668; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=86GdDOrVYBSJkDaRa4F2XA72F+Lkoyx5IZhBWPYbrCM=;
        b=RDNPKHry3opnIoSNGwVaP7tKuRim7Rm/V/URkry4PnSFucwuPfQtGNveHS/eyGuTon
         OhohhuEvmJXLFv1Q0TtwqWv/l3yBKLd3V83ot5HYYZrDR2raRCrpkXCfpRVe/eQasuh/
         8PTV9j9cakrYhgEotGRySmxq90guC8QOTEeuPxjoq2CT2ExGnNUFzcg7z0cuTN+t+Y0f
         f3gz0eNWQPVp/0wZ0PAhxSSbrfd/fagRJ4GN/YSliPwsZM/dwJrmNgJH9iUZZyiT2Eul
         bR8VJCudEJrVPKPfHUkYqPdvcJOrPJniEzJaoquZpYMlulPFNeV3GFw68vQ4AOnWNkgM
         oC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775868; x=1796380668;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=86GdDOrVYBSJkDaRa4F2XA72F+Lkoyx5IZhBWPYbrCM=;
        b=2uFAO6WwPNXGpQBaD8sSTJk90dA/FWGm+IM2IU/Ssh9iyrWIK2N+ujfSvrwsxQ7CQs
         D7O8hcDwss+8Ufdn2CdiMN6sUMB286R6dN5H6Qbs9/x6fYMQVlmndFxBAjRPL6msA0ZE
         vsmXCQRQPlsBEC2QOEW6nEthU0Faahfxboar+XXuDdT7irFY3al7kWxu+3lNI6dVEshA
         Ee3pFH02S61El3uTT/DyPvHfff5sdrgAXuwHZLn64DZ7bkbMPIY994jFLRvUxo2OyT+/
         mrwsBpx2X+LmsyGq0Q6lm8b2/waZk9x2FJEm33sviNRMsLmjYb2xgFaIqWmBqzlB9azf
         4vWw==
X-Forwarded-Encrypted: i=1; AL+hErHuAB4Zypm6XMFx3so6HUXZkjljixVHzS2Oz+pBd/wdkmPuz4C52bHDcSMpQJfaYn9zXTxfQctBJzFYKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/cIbNMisUtvhT2TUYcpsUqbU1M7qHkKzZwb74GdiPlZOosTO4X
	pI68YHmsLRqyZoOs3gamiDbgWIg2qNUjHLQL9tBQcABOY0xai/nQPaZccjMRVfDARfg=
X-Gm-Gg: AZFdTZecS1tJB3UgtlekEedQrX859OL/5EQBIxBQS890aFq3HfGaueJWL+20PTbYsDJ
	rpADE26P1FoRmTpebizF9XH+4j4meJMiVKhAnyPEpVxe6OJNQzxALOo+b3tqeKCwgw+3Uo3eEsr
	lUn+f7uUcLgZQno7tTNP84Bmoyu6MwKo9/U3EZxRPiLout7wn38P0UA8tgZbmMFAL8QKolzbgwq
	+kbGPdwbQMe1FtbjPdNHqUB3vfYvd+9MIwF4wk6H57XHUM51XFJXazTWX5886zdJnol3wjO6aY2
	dohjF9xT2w4GR/zLOTDZyIN2cqb7Aw2AhVnTUpguG6vMcR820KjsT6BNK0GkFPBxu3JFEQRy1GG
	ZlL0h95zPN1VaxefpEWWrEuBip7sA0uyKpGIKrwA/lsdUXtGxW4U7+cJU56Ai7Kt/49orRu3XYm
	u+JDEiGzMTTrLOqP9wnBZ6IvresEJ2yrvLla1ecP0y+xchDTKAlduPamJbRdQSa75JMsPOFXTMC
	gXBhaWpg3RjdNqX42tVOEZR/bgQMBtHYxJAERxqxwod2I0lA5u0tmqYyM3CbiZEzYMKbXNeKbNV
	bMKXyVeyRZIokY1HNxMMYeo+EmHHje8/YG0yqTiA5YtFjtRbcvq5mnArEztYH3BTVFrntg==
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr46062214f8f.53.1795775867599;
        Fri, 27 Nov 2026 02:37:47 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm55968226f8f.21.2026.11.27.02.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:37:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v9 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Fri, 27 Nov 2026 11:37:34 +0100
Message-Id: <20261127-axp318-regulator-v9-0-986b68f3c4a0@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XR3W4CIRAF4Fcxe10Mw+/SK9+j6cUAg25TXcPqV
 mt894JNU9OQejkJfOcwXLqJ8kBT97y4dJnmYRrGXRnc06ILG9ytiQ2xzJ3gwnALnOFpL6Fnmdb
 HdzyMmSmplQ4khYHUlWv7TGk43ciX1+95Ovo3Cofq1BMpj1t22GTCH1oDFwAgOMilKCmOSwYMd
 zHTcp8/zx+YcYV5uwzjtgqbYSrR51vrWdSkfwrOgnFGpBMEbbxyaeXx/D74YleudpzlvWEbhiy
 GtS4G8M7GqBqGemSoYmiOKTnLexVjw9B3hmi9RRcDARNaIqGSaxjmzpDQMEwxvCKrtNYCpW4Y9
 tdwzZ3aYkQqHQN55zE0jP6R0dd/cdygAbRJ/t3H9Xr9AlR/FkKfAgAA
X-Change-ID: 20260710-axp318-regulator-43545ce3261f
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Jerome Brunet <jbrunet@baylibre.com>, Sashiko <sashiko-bot@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4548; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ASTNgEhFduSS6swGO8VL7od1i9VHP0GscnjRjcU9T3g=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcsZW+kauK0+W1X7y5/kY9ZlHySjfHGYKs7HEzeOpWR
 yWwCtp2lLIwiHExyIopstRwV4u/k9T6Mmu6zm2YOaxMIEMYuDgFYCIXrjIyLJXcWpvl991rEsOk
 skD/+w+lmm32nqqR8kj+ePHtWfm9Lxn+2bDoiHzVlXqlbHtUPDdw2+HVOos2h/QarZfyjtkyS+c
 6KwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This patch series adds support for the X-Powers AXP318W PMIC, which is
used recently on new boards with Allwinner SoCs (the A733).

The PMIC features 9 DCDC buck converters and 28 LDOs, plus the usual ADC,
interrupts, and power key components.
A datasheet can be found linked in this Wiki table:
https://linux-sunxi.org/AXP_PMICs

There was an unclosed topic regarding the handling of LDOs output
voltage being limited to input voltage being provided by the supply.
Chen-Yu noted the min_dropout_uV would be a good fit for that but
the actual minimal dropout value was unknown. I've arbitrarily picked
1uV because it is the minimum the framework supports. Realistically a low
dropout regulator is bound to have some dropout. This choice does the
trick for now and is certain be less restrictive than what it is in
reality.

If anyone has problems because the dropout is actually higher
* it is arguably an HW design error
* it is a good time to let us know what the actual dropout is

Changes in v9:
- Resend rebased on v7.4-rc2
- Link to v8: https://patch.msgid.link/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com

Changes in v8:
- Fix interrupt optional in the binding (mis-understanding on my end)
  Resent quickly to avoid wasting time on v7 over this
- Link to v7: https://patch.msgid.link/20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com

Changes in v7:
- Rebased on v7.3-rc1.
- Applied Chen-Yu change requests.
  - More complete register definition all in the MFD change.
  - Add writeable region holes.
  - Fix invertion between short and long press IRQ.
  - Drop confusing comment about DVM.
  - Use MFD_CELL_NAME() for the regulator device.
- Link to v6: https://patch.msgid.link/20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com

Changes in v6:
- Apply wording suggestions from Chen-Yu
- Link to v5: https://patch.msgid.link/20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com

Changes in v5:
- Fix shutdown register offset
- Re-order patches to put fixes first
- Tighten DT regexp around swout
- Other points raised by Sashiko on v4 are unrelated to the addition
  of the AXP318 support and pre-exist the series. They are not
  addressed ATM.
- Link to v4: https://patch.msgid.link/20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com

Changes in v4:
- Capitalize patch 3 title
- regulator: add support for workmode and poly-phase.
- i2c: fix probe through i2c sysfs
- Link to v3: https://patch.msgid.link/20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com

Changes in v3:
- Correct mess up v2 errors regarding ops and ids.
- Correctly propagate errors when checking axp318 threshold.
- Fix DT binding regex regarding dcdc max ids
- Add missing RTCLDO.
- Remove axp318 PEK MFD cell:
  As pointed out by sashiko, the driver name did not match anything in the
  pek driver. While the device does support some handling of the power
  button, it does not seem to match the existing driver. Register 0x36
  relates to DLDO3, not the power key, as expected by the misc driver.
  Leave this out for now.
- Constify axp313 and axp717 mfd_cells array for consistency.
- Link to v2: https://patch.msgid.link/20260710-axp318-regulator-v2-0-ee5f1c56b49f@baylibre.com

Changes in v2:
- Dropped _NUM_VOLTAGES macros
- Use min_dropout_uV to limit LDO voltage to supplies
- Add bypass mode for EDLO4/5
- Prevent crossing 1.54V threshold for DCDC6/7/8/9
- Link to v1: https://lore.kernel.org/r/20251021112013.2710903-1-andre.przywara@arm.com

---
Andre Przywara (3):
      dt-bindings: mfd: x-powers,axp152: Document AXP318W
      mfd: axp20x: Add support for AXP318W PMIC
      regulator: axp20x: add support for the AXP318W

Jerome Brunet (2):
      mfd: axp20x: Constify axp313 and axp717 cells
      mfd: axp20x-i2c: Fix i2c instantiation

 .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  29 +-
 drivers/mfd/axp20x-i2c.c                           |  26 +-
 drivers/mfd/axp20x-rsb.c                           |   1 +
 drivers/mfd/axp20x.c                               |  93 +++++-
 drivers/regulator/axp20x-regulator.c               | 319 ++++++++++++++++++++-
 include/linux/mfd/axp20x.h                         | 148 +++++++++-
 6 files changed, 590 insertions(+), 26 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
change-id: 20260710-axp318-regulator-43545ce3261f

Best regards,
--  
Jerome

