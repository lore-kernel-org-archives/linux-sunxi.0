Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA5424BBEB
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jun 2026 01:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782092319; cv=none; b=Fo5Sc5TnqgfWlQVOAT1RHwoXMAD6ppKLAghjrfeVzpq2sK3l09t9r9A+hYQrcJEVXNGKPRX+D7ePnVXiLRly1p9Q8b4u43kXSjHn7MkpcK86doCFHM9aU0ZneyF0jBu4gYR4+L2zpMdSjRpxkrzlOrIAT9bu0u0Q5d3/I0PD52s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782092319; c=relaxed/simple;
	bh=uhIvo90yyNuSPEcJaD9VYXjhX72LdlUeeMyWYoo59cw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uMq3HW4UCALMNCwJWC3dC3qMlNIluL/FhRmgcCvxBErzXUKA+8D26/AiJRC2qqvfWwyNzXsH2qB/xTAMoAVbIW80uhtFE82z+XiLJOUe6fvXWgxcsLV6s+vmIxefXtgV0uxzz467PJ+I/nZ/OXwtMCzJNDRyC1Xztj2MUz21fSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rgUqjHJA; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rgUqjHJA"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-519eced8cbeso36758121cf.3
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 18:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092316; x=1782697116; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+utPNMRVTmNzPHuEyrqqa9jsDCRNXUwMgRtH5CJYOFY=;
        b=rgUqjHJAyZg1Gd68NHNb9AmSeSgz1GpZhZLvwS4QNxC1C76P4XueJZ0pYFGhnfx+zD
         SIz6sE6CEmPmpuszxYoZxtTAw12HLZ4w6DQ4Kzo/OjkyQEpykGWVvosZOAUEv0+srXay
         ZlNAQp4jRZkyeRyXSuqaE5btWFX9TeHMEkzO7AipDDHBtj6h04lQll5fKTmJqB2jy6yN
         sfluJHux3Zqn2EIxKfe+gMSekG5tgkiZa2y5L5Xik9/eKReDASeM+4D/eaPVW6rhmKlv
         vcJlPlr+MpCZzGFg/d87XpD76Uq31gM1R1p8p3SXPexnboUw4CI40L4MmCwrCi615h+y
         JAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092316; x=1782697116;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+utPNMRVTmNzPHuEyrqqa9jsDCRNXUwMgRtH5CJYOFY=;
        b=GigZC/cfRSCaEt64I2DwqwNRLPSwp0dcfyrbRCz6/LTdsZEiC/DmxHz04JpviW0ETp
         8h3pCF0nUyj9QyoLUwYnNrasMcTrHUl3rb7jaMei6EY0RCNECxfv+ntrSrv/d/Pc4j7A
         /U9q/KX5/+UuHQPWEuMaEiuNeYwFwrTR1eyy+mAoUlOcG5e37dXJJUjUr5dLc5r2VR66
         whBbtZitYIQwQ6QZNCcnlNuQPfknp1dWOeHKuhFGP/IY3iCvIFz2AaPHPmbfCzrkteZ+
         RPZQT1a6efvKPyL0AXb2MyP7ZKfhD/50cFdn+d0UDCQbe3jp3IZ3pM9Bsqw/ljzkpyDg
         vd6A==
X-Forwarded-Encrypted: i=1; AFNElJ/kLmnkcEDnRK/Ar3QvAZywV9+UNmoM2Lxh7vI8YthWMNNk+OplPpMcblRBJzxcPIHWEBpBgQsubjl5Ig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2arcVrIQ7mqgKAntjfR2C6eTvd+770dvw1HKBI6lHnb7naADv
	kuxgkMGaJ8dovCyoQxbpSVV1UofDiG9c5Y3CB/CsmGZQgZHWLPvxY7Qi
X-Gm-Gg: AfdE7cnjk6zdpl/zBndvtoEfdA1cFs9wTUuLRD5rcRCGE8eLr4k1pXpZlwU8gKvfdqy
	2jyOa7qB2PaoHog6pd0abwWQtseGeVp9GPlUEi7jKcwEDTygXV8L5kFF1Yj7Q4rsmvR5VcWvWbX
	4ENvjEryA2GKVdgtrtzL6obeEGHLaX9PON5D4rrj7ZRtdLpwekUsGCHKH5/M3YS50IDyBnUlco3
	GOhXarspBsKpoiZmUfN0KfEMlZkiTYp8Rp5zizs/Xk+jvy5QXpvc79NQDAIm68cCiU6Z35W5Lrm
	OoNIg6HZjP5fOfnOpYP6WVSuVKMmJuRqMohXExYO1L4IPLR6vvMK7ZH0Wj1he7fCccIsQBWbH5c
	VouzuvaetArk0rEfP6S0mMvNfuHwA6ZoDCdIhMeMG8X4vtrpQAkxLKLzZ2pAKCJthWsDs9qnoTv
	r5HdZk5PxJo3Fjeg==
X-Received: by 2002:a05:622a:a04e:b0:519:f2bb:1036 with SMTP id d75a77b69052e-519f2bb1203mr115543741cf.36.1782092316301;
        Sun, 21 Jun 2026 18:38:36 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:35 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v3 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Mon, 22 Jun 2026 01:36:22 +0000
Message-Id: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNTQ6CMBgFr0K6tqb9+oO48h7GRWkL1AiYFhoN4
 e62uCExLid5M29BwXpnAzoXC/I2uuDGIQE7FEh3amgtdiYxAgKSSFrhMA+SOKxKxrDpFdbAhaC
 8olIYlKynt417bcXr7cthru9WTzmTF50L0+jf22Wkefe/Hikm2CheS141ugR1aXvlHkc99ijXI
 +x8oL8+JJ9x0gARp4pqvffXdf0AaAIbAQABAAA=
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

Hi everyone,

This patch series introduces support for the Allwinner A733 DMA
controller in the `sun6i-dma` driver.

The A733 DMA controller differs from previous generations in several key
ways:
1. It supports higher address (up to 32G).
2. It uses a different interrupt register layout and mapping.
3. It has a different number of channels per interrupt register.

To support these differences without introducing complex conditional
logic throughout the driver, this series first refactors the
`sun6i_dma_config` structure. By moving interrupt handling, register
dumping, and address configuration into function pointers within the
configuration structure. This allows the driver to support the A733
and future hardware revisions. It also aligns with the DMA drivers in
Radxa BSP Package[1].

The series is organized as follows:
- Refactors the configuration structure to include function pointers for
  interrupt and register operations.
- Moves address setting logic into the configuration structure to handle
  varying address widths.
- Adds support for variable channels per interrupt register.
- Updates the device tree bindings documentation.
- Implements the A733-specific configuration and register mappings.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v3:
- Reword patches for clarity.
- Link to v2: https://patch.msgid.link/20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com
---
Changes in v2:
- Implement SUN6I_DMA_IRQ_A31_COMMON_OPS macro to avoid duplicate.
- Move set_addr into helper function and revert back sun6i_dma_set_addr.
- Rename chan_num to irq_req to avoid misleading name as suggested by
  sashiko.
- Reorder and reword the dtbinding patch for more clarity.
- Link to v1: https://patch.msgid.link/20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com

---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Add set_addr function pointer for variable address widths
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 197 +++++++++++++++++++--
 2 files changed, 181 insertions(+), 18 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

