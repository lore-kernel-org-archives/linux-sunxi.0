Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858613D6CD3
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032703; cv=none; b=o7RvV3w6SUBzhia1R04noiVBbiy2jAfoH/7AHJOTvfY9kX0+g1YLBuzVTdJF/PhUGatvJwC37YkHMXkBSAkXgx2O1PgSlCf2uaYowXYjwIzt3JT2Hn7CRg0wV3icNLSuKe5pxco5ScjLKc8n/cXlE1FwMbMLVAQmCvL961QePDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032703; c=relaxed/simple;
	bh=U65vA4iIr02MHl2n6QXZFfU+NDomKjnZHbkK5Rr1iqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ih+GN6G9PuDuR8jTgUDidD5fxd/BALuGtaNXSXW0kJVTM1DiQ3mBphlz5MDT+12T2MlbtRt+BX0cNAOGEyJmAHtjgj02kN9VWgsSAL4+N1eN7h8HvrseRvTu9J9fcIS4Oc6LU2YN+Lc5/GJ1yPw43t6JJ84k9UaxPVCT1vSdjnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nOILmYuA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nOILmYuA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so86822825e9.2
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Sep 2026 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789032695; x=1789637495; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DGt/68Seh+Cu/MXxxMelYUkMWN3xBNuSwl1SfYB7jDw=;
        b=nOILmYuAEkMpebm//SYj1qGaPO5gvUZn3DHOFrnmCMPvicx3LrS4OCQJKf/YpJSCFo
         50l0t6IqwWbKJS4ythjZxzAinQPjYT/JvAkbQBMRKgLI6pEQiBbNRYoYubqnMPg0MxpO
         IUjFUo/8/yZZjQvJYaLZ+qxSttOpIJqTr3JcDUG4LRbwr7/RocIKRYT6sxywg7Otfcrv
         HKTOad6qrT9Okblon35C290oZvBMLGVSqGhI+7m2f8Vps8tU3sJ5dPLziKu/RsWjiFBC
         FymjOR2Md8CxWxv3dmRcg4nHJpZP9m8EJP3Zl1gQPNO5LDZIy/omF2cib95H1LVXcOZr
         QG4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789032695; x=1789637495;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DGt/68Seh+Cu/MXxxMelYUkMWN3xBNuSwl1SfYB7jDw=;
        b=oVS9XJAcgflgeFGo5pxKR/uydRbtX/p6S36oqUuVwY7kfg65OXAceFFrIoja0NshVb
         ksJmriD4e9RNgqJf1JQ/IWWm5L/nxrp2P1htxKkjfv45KmajVMKQscjcHRJHNB5UeZRa
         1uskdoZhZw0ArP6KBPufupqwllDaZXo8d3wpWmF+3J54It8NJ1yMxeKdz5epyHfLgqyP
         cibrX0jBqRrlPJwxg4jUrUlv+L8oh4P+5aUa+CAc8SWhqkisqs8oXd3Wbg/BOWUF8QAZ
         TFRAA9aROZDgWm8cTGoRj52JOig1xqpITN2evKX0U68/480ihGlHCQWD5NtK6LZ2BIhj
         fKYA==
X-Forwarded-Encrypted: i=1; AKwUvBxX4M94osMrXTI2nbuyLxFb/QAOagvwIfRQHQJZ0alKtCbzqZr1xV8Ba5ViHbJCA5DjJFY5qZzoxtN3ug==@lists.linux.dev
X-Gm-Message-State: AFuF++kNpim4hzTPUT3LPD+9BHSOoSNrQbecUqoH55n1kzuuzhgmf8vi
	oj64IIh6MqpY/gSerzXJ8jWSEkj2hDEpMNgSAVKOzs5dizMOUXjUMDfBVxcDLwmvDVs=
X-Gm-Gg: AYBFou10Y+Fz86iTje+WU+0Khg80Rsppmk/7SSAPm3pXUkla4v93ktYE8Z+0jrUxknj
	EvM0sWNGmY2H7auel9n0mMHvbla5RPC+3ToAn4CiL57kPHTYe/BDUrWEk5J/rzG+qKHT6SpfeIQ
	t7OnGB1iJhHEda4qId9ySEVJJraO41JAtBCVjZN/WComW98QfBdEfZHxjzSUhXQdaA5Uikkwz6H
	Qs/ksKEZrI/2UKheEt29tS8r+CriKfEiKshHRX9KAAzBczPqnNRL8rSgnrziGxXvd5k9uqevKgE
	g3aRMZeRE6PL4dW2PPJQ5v4JvSh7yGiY+fPwzqCw3dRWjS5jH6dYNheKbOFwoBUgy5h532z9TEP
	5sAZj7GU3TDpuT5iVcUkjGXhGziFZBjRAU66RKSq8H6tCb7eQRSpQja4G6EGY8kC3LtnwJ4+WyM
	AcqGkBL9viirT3ZPKwEneeTPqnaNTXYkR91a2y5EfqN4887i+EjLOqiD7MmXdDM5dhz0tYTSZqU
	HZ4TTIO9CRQoU0kaQ==
X-Received: by 2002:a05:600c:3b02:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49cf8220edemr425817905e9.6.1789032695579;
        Thu, 10 Sep 2026 02:31:35 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26d4e3f3sm66092525e9.15.2026.09.10.02.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:31:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v7 0/5] regulator: Add X-Powers AXP318W PMIC support
Date: Thu, 10 Sep 2026 11:31:07 +0200
Message-Id: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANt4omoC/4XPy26DMBAF0F+JWNfI4wcOWeU/qi4GPA6uwkOG0
 NCIf69JVQlVVru80vjc60c2UvA0ZqfDIws0+9H3XQzm5ZDVDXYXYt7GnAkuCm6AM7wPEo4s0OV
 2xakPTEmtdE1SFOCy+GwI5Pz9Sb6+fefxVr1TPW3OduFC37KpCYQ/tAYuAEBwkLmILSWXDBh2N
 lA+hM/lAwOeMbR53beb0PgxVi/P1bPYmv4YOAvGGZF2UOuiUqU7V7hcfRXtjds2znJvmIQho2F
 MaWuoSmOtShjqP0NFQ3N0rjT8qKxNGHpniNRfdDQQ0KEhEsqVCaPYGRISRhGNSpFRWmuBUv8y1
 nX9Ark+bPMXAgAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4080; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=U65vA4iIr02MHl2n6QXZFfU+NDomKjnZHbkK5Rr1iqk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqonjtDS1WT3rALVGNiF8RLi/gxqITHUSlljEgO
 xO6EuQl2hGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqJ47QAKCRDm/A8cN/La
 hdPKEACHNleOvLFJvngqUQQy/1jvZ34s4hRZqzxVQrdmrOFXh4cCPw6ml9sn4Sa+sXyZAZTwX1B
 L55sCnj3KPi+hcy5oVNmosjqE/bt6TEneeSs/SOvZyuNsZ/6Zua+6plZ2MG+T0YvuOKtzV58UVw
 ad/ktw22Tb3JlL0Yc4jiaAUSbobrvzw4sRwlmW1IrWKjy/ah20phF2TLHWRTaxVve89zXksnWz6
 XXUKh3kvda4C2Pj+VvrQbhpUsnQ4jlOMQEDTyrNmLgauXIaE9/oPwX2D9Y0oMtGDKGp3vVYwRoV
 Xlmhrrc1DyaerTrTsgbZHEoHyZsHFjQZPKAvphLfFpd3/z6SkB2cHzTgz7YtkGvI0S2zg7bXkMo
 lwiPBiAseBUhzUXliAr3BntAuowFuz4hFP0kJEXIoSin6pdweqFVUoQAuGJZTSuUmcjrgPw7pPT
 uODWLH8lZOAGm2bGE/aM3H5rgj6IU1mL6qP26iXMQ/Nm96xPIaKjP217uxn3eru/EqAXyR15i5M
 tCnJzooqZl1uc/EKVYJeimGLVQiouco8XLoSz9qdSJJsdOQWjmm/ZnxCv4IwxYrpF3VoEPxXOWM
 pFXf4eFwh/lb6m1sQpv+oy8GPdLlhgFlLQzOl3uVPDDqgX6KCpf1y0H7RlgatMvvALsBZeeiNZE
 TlBRHzMyIEcidiA==
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

 .../devicetree/bindings/mfd/x-powers,axp152.yaml   |  28 +-
 drivers/mfd/axp20x-i2c.c                           |  26 +-
 drivers/mfd/axp20x-rsb.c                           |   1 +
 drivers/mfd/axp20x.c                               |  93 +++++-
 drivers/regulator/axp20x-regulator.c               | 319 ++++++++++++++++++++-
 include/linux/mfd/axp20x.h                         | 148 +++++++++-
 6 files changed, 589 insertions(+), 26 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260710-axp318-regulator-43545ce3261f

Best regards,
--  
Jerome

