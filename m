Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED27C29B795
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787712042; cv=none; b=XC16Hvrffe29ZhjpjPIV9LQeUkuB1gvnJobeSkVe1/bUxcrzsNx3cUKSnCnSQbZ85MUdA/rYzA9DZ8bTT98Wldb46QtYt+4iwC65pnbYlNcLHPdhs7g7JfwqrfXiyXjYVWtMDkTsodY8X8u6R/M1zmN1d6ztS7s/N0sk9MF7Jnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787712042; c=relaxed/simple;
	bh=6NqPbrTNcDkfPzxIiV0u6zMejuf7e9xVv384zw446gU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Orkwgad/1qN1W7Is0QqaVpxU5setL1DFWLtPFuv8+dUdSHlR6zCRgo0JV3oqzd4hffYQx1q88EfvR6SgXAhHlIc2drNdVyhByB7LZTJyZzxPjMCICNgExZO1M1ZpYHDdfKhEQS/CMV11p61Utv0l12zkzZOGzFQRIznLMFy0jiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kG94h4Fj; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kG94h4Fj"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7dbcb505578so4264817b3.3
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 19:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787712039; x=1788316839; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/L0BrN75JY1mhgBnEyAnTnOfgXkVAUPIfbIhimeCsJY=;
        b=kG94h4FjbcNp9qiyzxx6kPB0PlNRfNxmZN82YbOoVhjrEsnVZLGvFG69GzPnJO4D7t
         E4AkE9wD9gNms4Jc2XhkcZmdvWzqalB1lYMY5jIUkgt3/c0Hha2L9bInVWZWDC8LjpeY
         ffl2r9oojALcB9haWdba5FmibwyfwGuV1ziHPUQLuprvG6VHWssUTFf2+SCBW5JACJK7
         sP46OdhcF+HBWZdZYDfd4KeYg/SZibBbQ6CavP7NcEyXxDpOWTBQy46gpsDPrxdVowvK
         SR+bDbVqQE1qm9t4afqKhZ+87UNlooCEIpJmu1/JPMWj4FUr3RTbr0wU1iYRpOre0RtJ
         3iPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787712039; x=1788316839;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/L0BrN75JY1mhgBnEyAnTnOfgXkVAUPIfbIhimeCsJY=;
        b=ScjK4CIj3aVl4YQX3LyNujBSEBcOyhHEHZA9k0IcRFpxx0s6cf8u/ZPyOp0wBdeFNC
         xFsA/jRIgm8MJPtlpZ+DrDfsGHlKRieG81NxD51jSdsdmTTFOgXzEuDgTK7T9//EP4PO
         y/DSG7VVZAHWFYfYFW2vokbEFD2sqlSLHHKsLbM9edIPh6nUNGFjPraGpRtYET9FGgtV
         EusT24U00U7c72He0La6vmJzjlYOTTw/SZc/ftuqhaqNd564gee9f3oDGlvQQD603W3X
         7K6stuKR52cs+pgDKSpO9Vz+Bt1mOtn5es0Bx/U/7JXKnnDZXOceb1fRFnJ//ZeqIKoa
         MwdA==
X-Forwarded-Encrypted: i=1; AHgh+RpjNDs8vEDV1Pb7gKnIrdWvalSWjJjJEyqYAgXnIi6Fhx0oNG7kBZdTCXullZV3z0L4y8l7DN3Atiigbg==@lists.linux.dev
X-Gm-Message-State: AFuF++kRlnhD1zYKBBdZwc7J2M58rjZxMLkDo/Fbb5Qx5uBwE6lQ8C7i
	s74hilSe7kb1T60IrJe5TkbFwJoXoi5/vp+X1rMsIT9NBAVJlwEJlgjO
X-Gm-Gg: AR+sD12TlBwD6q8dDLFSWqdAMw2MqyykpiOa/oN0ckB2oQPatChwmSWdvDV5ufc98el
	aTZjuZyikEa5XxyR5yoVizKK3ABafmo0nS2VpTKdNsQmKgK/n445HC0yqBD2hiiEGbmvYUGEp3y
	k+6VGgAV45qwv7UFOvuH1Ry4XNSuAtGRewZX7OD8H+DXYKLcqueC1wG6LxNI//C1H4ep4eDCDor
	OnFKqNy9kci5haR/Tk/emtqHOMt/EvcuW9xl4F3M0xjyWASc/mB8RTcov1g4AsP/MOOePIO1NRJ
	L2UYBSHLY/i5EGReAEC7XwP2PxcPgmNUx45uGXLpsLp9JkHqJR2VZLksvCxtA3L77FYraH8vi7/
	XOk5ZNN6pXtPUOccpamldh0lZGjGJybFTv73KK2sqUZXw1uODB5YNebRII8sg78Gf2Qz8RGtoJg
	JwM10ESTNnCoViVk5UzQiYkWhAljXVt430BmnAWe13lagE+wyYJAt9CckakUXNoWs0sq/kGoVf
X-Received: by 2002:a05:690c:c3a4:b0:80c:cad:c4e5 with SMTP id 00721157ae682-8574335d605mr11800927b3.30.1787712038777;
        Tue, 25 Aug 2026 19:40:38 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-857053839fdsm9976087b3.10.2026.08.25.19.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 19:40:38 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v5 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Wed, 26 Aug 2026 02:40:26 +0000
Message-Id: <20260826-sun60i-a733-dma-v5-0-abc5229b441e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOwY7CIBAG4FcxnGUDw0DF076H8UAHUDa23RRtN
 KbvvuAeVm32+Cf/98/cWQ5jCpltV3c2hinlNPQl6PWK0dH1h8CTL5mBACOMtDxfeiMSd41S3He
 OE6DWEq002rOivscQ0/WxuNv/5nxpvwKd60xtHFM+D+PtcXKStff/+iS54N5ha9BGasB9HjqXT
 h80dKyuT/DkQS49FK9QRBB6YyXRu1fPHpZeFR+NbUIEa6hdePzzGzBLj/V/gtigjij8i5/n+Qe
 KES2mgAEAAA==
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0

Hi everyone,

This patch series introduces support for the Allwinner A733 DMA
controller in the `sun6i-dma` driver.

The A733 DMA controller differs from previous generations in several key
ways:
- Support for higher addresses (up to 32G).
- A different interrupt register layout and mapping.
- A different number of channels per interrupt register.

To support these differences without introducing complex conditional
logic throughout the driver, this series refactors the
`sun6i_dma_config` structure by adding hardware-specific parameters such
as interrupt register offsets, address masks, and channel counts per
register. This allows the driver to support the A733 and future hardware
revisions. This approach also achieves the same functionality as the DMA
drivers in Radxa BSP Package[1].

The series is organized as follows:
1. Refactor the configuration structure for interrupt and register operations.
2. Add support for variable address widths using masks.
3. Add support for variable channels per interrupt register.
4. Update the device tree bindings documentation.
5. Implement the A733-specific configuration and register mappings.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v5:
- Use field_prep in bitfield.h instead of the custom version.
- Add the missing function pointers for sun60i_a733_dma_cfg.
- Link to v4: https://patch.msgid.link/20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com

Changes in v4:
- Refactor configuration structure to use irq stride and offsets instead
  of function pointers.
- Use GENMASK and field_prep in set_addr for different high addresses.
- Link to v3: https://patch.msgid.link/20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com

Changes in v3:
- Reword patches for clarity.
- Link to v2: https://patch.msgid.link/20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com

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
      dmaengine: sun6i-dma: Support variable address widths using masks
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 153 ++++++++++++++++-----
 2 files changed, 122 insertions(+), 33 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

