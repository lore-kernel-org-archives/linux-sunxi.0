Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4BD38DC47
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037092; cv=none; b=uGAdOQTxSd/zP+ObI0+Ha4BVByjxIoTDxWrTs1JhYgt0fKQKtZL2CLlaymrNSzieZQpJvVoQOnGkjgs/ut0F2pRVWD4RMMs9VsyeYSRRQnlnLuoy9cp0SXvp1aulrLx/JCnrKYBTDSjDMCYcKnEzCJwtnPwcvtIxkBqLSO2KW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037092; c=relaxed/simple;
	bh=v9SvlQTTPC8msrAjpqACpgkRhrk2SZByhdgymL5efvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IstgGx4DRt1dy1x5k5XPpZZwChOtf4FNPGU5x5b7wSRQlObjYDr8lckWPXTu7YWNqewGZo+tYEkkwHpQUISs/t9dhXI6qphecuWHKvJe9vsD/FavJ0IYQOApC1lFgXkc60/h8thdw7ZDzgo7BbcIHppir+avWf/nLMA4WabO184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jFfZU5ca; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jFfZU5ca"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so87991885e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789037085; x=1789641885; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eocd1TrCP06USmsC7lSoJaG2tjHqdhNNAT5kckVmtUY=;
        b=jFfZU5cake3SrO+RUaPD5bAQmk4h/NYqkcXbqazkDoaQ7mhYQRcqPEoSfE7qAgS3Ze
         59vdbmzoNPC33ozOOqNnql13QbbGDPDcXXRVdypn36bNXupg+Do8TH726veD96bKwNu7
         +cHPym6VmovuRw7U4zlSAfmAjnq8NesV5GzZLvbXTCtxHa5drjRo583MGzK+Fu5icA/K
         lm2jd6BsSa/7faZaHZVmaY88IWFiC0G1WnLfBh+np2h+tYXydtLLY2Kie/CtbM6qBVGG
         52BDa4hn9T+FpgHs2HTisGVfhG8yGIIXjjSwJpO1kbTlWkhwY/2Z59j+ZkYDUOzjOCJb
         LeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037085; x=1789641885;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eocd1TrCP06USmsC7lSoJaG2tjHqdhNNAT5kckVmtUY=;
        b=af5khWT/L/IgTtkcBg1d8QwrWmUDWj1CdFPUifYp3zVf+CkfjY7fq64EazHdoo2NyW
         hGrlii3reGIJPxPHtCjlNmVsF572RTTdBm6IxvEIxMk6aJL1CalL2HJx+LGCndPtKfP5
         uuwT9NVQOgZG3tiqomGw7XE18x8NY1Osc/R8bJEKBIjuLO06PUr02fuXmUmu5VbJ2MO1
         2O81Vyfl860NltGmTxUc1ib94WOZJH8e/IdaTVk8kobt8hBPuoLzcZ2jycx3x6tlU1/Z
         n4kN7BOJb5+cvXhwHUAMF3eDPEt5LdTA53oNAKf056hZLfSmXdxF3ZecLo/s4abzyHBU
         abyw==
X-Forwarded-Encrypted: i=1; AKwUvBwe0gjvTRyyp5OBJt41FjQqJjJu3VKyvFSnvwquhwxFxbepyPkjLNPSG40IwxUukPQgUDQk6XhBzuG08Q==@lists.linux.dev
X-Gm-Message-State: AFuF++nfItdKsbw3QM7H0oSEuvrqMnFG/GrkEMQ5+/oLD8EZzfDHvUXB
	k3r4e6xS7tFCWMWTjmiwr/UmislSo+WBk/SjI9qv1jXXzPHQGzfoc/HhAVtnQskjjj8=
X-Gm-Gg: AYBFou26cQPioQSeAwthpCBQL54j+Dwl1z73Gw4knaJ5pXS0EFP5V+8YkD3dOTTkicy
	0JQm6zmCZuibx2tXPWcaAkqPafarZo9Ajd1wAT1wufiORofg/KJEaYXnJmqtfoYaFikedEFZRUw
	JWTNsLQDhP1rnvznn6DFQzUIArwqdmDuZ9qLVvPl4tk8dpKT0LPE4HYJIoV55lfbMiQhEDn2fCf
	EsgZ+zVN21vGHKhCTaezwy6ggJRMQ8L+vKfIXtRpOaKjTBi1jo3zgavpmY4o97yzhizv2hdqWRn
	QPbcXoQ3mhpNqJkP4U6qUnRpoWN1VdHV1sDsWxCVFeP5XuNKFlthDuMg8ZV3tvhGZ9r7Eo3YyYi
	4Y0H1444F/Yqb41/Mw6OYE/1lb53N+7eItoD8bRQGiOFA1s3gJDXaqCsS87krBKqIQA271Lt/rq
	cXkiXLAdDUlVeOk9CVvf0HhIFvkzFjeBzNg2Y6aEJm2AB0Wy3fXs9SIDG2iwcQMRv1Bgbsk6Tgv
	sZJL3ipRqK26fsC3w==
X-Received: by 2002:a05:600c:354a:b0:49c:fc6e:8cb6 with SMTP id 5b1f17b1804b1-49cfc6e8f48mr382783535e9.26.1789037085141;
        Thu, 10 Sep 2026 03:44:45 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm137213565e9.3.2026.09.10.03.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:44:44 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v8 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Thu, 10 Sep 2026 12:44:34 +0200
Message-Id: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABKKomoC/4XQTW7DIBAF4KtEXpeI4ceErnKPqosBhoQqsSOcu
 HEj3704VdWoQu3ySfC9B7dmoJxoaJ5XtybTmIbUdyVsnlaN32O3I5ZCyY3gouUGOMPrScKGZdp
 dDnjuM1NSK+1JihZiU66dMsV0vZMvr195uLg38ufFWU7E3B/ZeZ8Jv2kNXACA4CDXorRYLhkw7
 EKm9Sl/TO+YcYv5uPb9cRH2aSjV0331KJamPwaOgnFGpCN43Tpl49bhdEiu2Au3bBzlo2Eqhiy
 GMTZ4cNaEoCqG+s9QxdAcY7SGb1QIFUM/GKL2Fl0MBIxoiISKtmK0D4aEitEWwykySmstUOqKY
 X4MW/1TU4xAZaMnZx36X8Y8z59imNoXWwIAAA==
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=v9SvlQTTPC8msrAjpqACpgkRhrk2SZByhdgymL5efvw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqoooVp1GIj89lIXLk4kqEA11q4ukkurtJ8IqnO
 UIG4WWF+heJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKKFQAKCRDm/A8cN/La
 hQ7pD/sEPON2uG18ftINPRBNQANqgW0FluxFbJcdfnrxgg564u5kIOIwi9cm9LSPpUlCXzWGRSe
 HxFB/WBCgiKEZsBQYj/WEcySspTINF2EBFdby4xQOYPmLCJQHcgX5rq2oJfWVaRQWDu/fw+jyWg
 QbBhUS0L1XNTQLBbCImcBSpepewRDNQyYRQNscdkfRiALGsJYqCOoziOVOaC0v3LLiwmId++6Gz
 UTQ5Mxssg/JM7ZylIgkvFivr4a6BgIPOOMSmO7gQh2C1rueHdlwyt7msIHgsptvIhEaSaa8LZAF
 st0AjKcSWZF+tV324IRj6iQcf3ShoLl2pTw1/mXfch/hZ2BhWukeUYOQFyn9m5/kbw+IlIObx3H
 U1JtDxw/Njt0nVFFZd9Hfpssl7lzaFV8UaDj+fzJCgiOcmkrMquXOXDCOZIl/Jn2AIuhBOXdSc4
 6lZK+3BqnnIT+bfc2fsqc7RkBSHmugIx9dCyobaVHg0jk6nWuC8M1RcppNBUvDfxJCp/Gy0+ahO
 lqznBTcxgKWG6udGe3YJT4/IUjwPUqdmfaWcdQtF7ypQ3VtaSLLezWqwe9p7k/Ut9mmdsngF9Is
 VkUvNbcniZSnpZ7R1MeX4GW2zGJGiLxEQm1JUZaEdKx1NO1925+eQCQ4oT40o/fTl0nY+/btrwu
 O1+4NV+9/d8E2og==
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
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260710-axp318-regulator-43545ce3261f

Best regards,
--  
Jerome

