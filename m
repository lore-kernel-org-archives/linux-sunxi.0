Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483073491D0
	for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782078091; cv=none; b=ONq4ZA8axz+0cCKc9VR7wVEzYa9RQaUTjEm/He14pwVs785ob/Co336OW29UMS2WCvZOX25Myz2+mEX0Y6MYwzjRj6jIkFoRb80HO7VKYsaYdyu9kP3uYubz5xBsObaYu0fdp/HrU5HC2z8ruCyM+3P1dtU9QbZwrtmv4LPn8Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782078091; c=relaxed/simple;
	bh=AaVqPSi3j+R9XLCyLLFs+E/l+JBQxT8UcVIvlLB1NRI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V9sAHtUfu/Nxh1rVclAcCHKAnKSiV87QrXMWE11SZ2n2xQeguqdPh5odKChGaJ50xd6v3PNi6j2U/Ltn41qDr5M7k6LGRfxuflEtsEyZfJY9PgXFOQuLwOeoOA/ET3fmUa7aL4yvl7MYnbfvrC/ROzPFYrxGRAJOQegLkVkAGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iII3iM+A; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iII3iM+A"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8df7a3a6fc3so27901566d6.0
        for <linux-sunxi@lists.linux.dev>; Sun, 21 Jun 2026 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078089; x=1782682889; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/15cxm0Pr8gCTXCRGF6ew4X49c7fRxCykvCsRiSVCxw=;
        b=iII3iM+AWYUyTKhYWGqv0boJ2QDVnvz20XFo67x9ls/rxHy2OgSitzGJDHHTjbwS/p
         n7SqfiACTyqQ/qSTdPQY5xfgnZT5aIvxj/cmAdKZ1avIgmKC8rgZAaV2NclLOGpOqihS
         Ou+tIsWKqK6hZzSi4t3h7vUPrYBuqkwEKH6R/W9dIGam9STfzf1USzf6Ekt+BTlbGb15
         CcsdF/a7U272JwblmQU6qmHlmJNhDUlOmJH62FYUGe8sq4rncKrb+DR4bNVbbx+zVdF4
         shXhqBgV9KaXbkFXQ2kUop0T9gC76BaLVnoJ4+QdgmCERtl18CKIwQlkR5n2Kg6vk/3w
         yDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078089; x=1782682889;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/15cxm0Pr8gCTXCRGF6ew4X49c7fRxCykvCsRiSVCxw=;
        b=jhs2bNrCRmA/7xgwzGOI2pteo+NkVziW5ICRUgUCC6otx5AWCPYuf5+fIc4Zdf34AD
         o8BVjdlYhZ+jPMOUXSlFvllMsgsjCik8R4v2KET1O60tT1TTSp/aDIWuveNy4GftizUo
         /KldmL22ur1TOlTua0/RKlQ5+Ry9TjTuISZ/AwiXV4wzqDavB8Lv0WQuJdnjZpd0iUSh
         5a37TNjZeAim2VMoI+7GHq0k2ndiEVw8tmR7zt/GQjmSmbqKxHGA9asNgEBzXrqccZh+
         x3D2qWXc3G8Lx9EqnANyxqWDli9f524uutBdwiqdUb3Wj5SOpSpkR7P91JOWN4nEYdue
         cDLA==
X-Forwarded-Encrypted: i=1; AHgh+Roil0nYNfn16FFvRBmOdJmXiam/ZZJKgJKRSXX4aWGnNrv4fKKU36HMvhDZBqxvjw7EifnDrKrUA24klA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6WVRfV+eJtfiuJe2j/9raJkabSqNOeQ+yQPtT+VxnYVjbQAzL
	/AWlkdOgq0N/fNb/JZ2DYzIv9ORGp22oEzsZWT8DtIHr/3wrh8jfBeOQ
X-Gm-Gg: AfdE7cnFPlkX42AuNODk4/cc+S8Tn5qC/XlZuo1YQOE85aRksN9s20t/d5V5I3NyKIs
	rdgUJmevCpRyox7LGspQ/x1uYu24aUTB/Wsug/cmwAUra4ngKhhgR0WlCq1+Brvl6G+UIzCfDYq
	CK7o6fUCDF0mQM59lmPo41vezvpi0iysQUBvHKYbGw8/PWtcGiec0Jrs12M18CBIcgqdfJXCKXb
	tM6/ZQ06rrWR4xOhqCv4y7dTgUKEbDlb4kjp0Bt8G7fUVfmsyDbT2zHz+lWAsTzICR0uFgHjgiu
	iUdynfzJcyDY48l/DCv1cijRdn+5jz8xRGENTp4/5jOjbs7POcw2TeiDzCiRusOd3+BuNKdYF7d
	xQ5JA0wEhPj0WSFn7l11rglSK3Ur9B0p+SpxB3pII/7wqzfyIDK5GIikizym2YdDXD1NaqfyHqQ
	c+CRqO2g7npNBXsw==
X-Received: by 2002:a05:6214:5182:b0:8ce:e29b:6a91 with SMTP id 6a1803df08f44-8df927c4decmr137731436d6.42.1782078089211;
        Sun, 21 Jun 2026 14:41:29 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:28 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v2 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Sun, 21 Jun 2026 21:40:53 +0000
Message-Id: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6DIBBFf8XMutMAAsau+h+NCwTUaeojoKaN8
 d8rdt3lSc49d4PoA/kIt2yD4FeKNA4HiEsGtjND65HcwSCY0EzzEuMyaEZoijxH1xu0QirFZcm
 1cnCspuAbep/FR/XjuNRPb+eUSUZHcR7D57xcefL+11eODJ2RtZZlYwth7m1v6HW1Yw/Vvu9fr
 Adhw8AAAAA=
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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
Changes in v2:
- Implement SUN6I_DMA_IRQ_A31_COMMON_OPS macro to avoid duplicate.
- Move set_addr into helper function and revert back sun6i_dma_set_addr.
- Rename chan_num to irq_req to avoid misleading name as suggested by
  sashiko.
- Reorder and reword the dtbinding patch for more clarity.
- Link to v1: https://patch.msgid.link/20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com

To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Add set_addr function pointer for variable address widths
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dma: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 197 +++++++++++++++++++--
 2 files changed, 181 insertions(+), 18 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

