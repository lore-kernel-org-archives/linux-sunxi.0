Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAD7324B2D
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Jun 2026 04:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844870; cv=none; b=ujsc+gwF/C/y0DKGY0bDzVrUX8yTiQJmxUGAnAWuzXkOKHElki/piNdvYABIaKseEk8fMvjZheYgpgs0zX+f+aU2YqQMt4VOQKKHHobyV73QLVicnZxYyRVIsxDJ+wUx5EF6mk/PKYnPK9fxX3eXugGmixkbsLAklVGYOxjbdc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844870; c=relaxed/simple;
	bh=mIHJ9HoTX3sn1912y382u8EeVqWYJrR0tLkSaCIQVi4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UD0Nwl1/N2UV0l14DaR2TapYI8xUlyaDE/nRLIGRqByXCD6gKtkXzLTnWN8sgA79ZsCNy8tLC+s6gVzMY6JeN2GNmSEqx4ynJu+pr6/M5S5U5VNcxeDmnhe0rnfE8O6APT9CQkfsQVkY+zpSE2d7xBIX0vgcXGYQgpcikU0gM0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6XOAaxw; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6XOAaxw"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-915aa0a9293so300638485a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Jun 2026 21:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844868; x=1782449668; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGt6y5IA37sjEJinxGUW8DV1fePrVRHX/t0SjqpgRkI=;
        b=s6XOAaxwTn/clin5QB9IMhitdMkv/jn4tav+geM8oX43tU9t8hr+PStAJtBat5J6fQ
         nHf8gMbckq97M1MmUl+Aqwgx7rvE0Bnb2O4LTIEB1u2Y8rVnKWJodLnp5t9uXlF9wFr3
         UDUrG9WS78xmaOJssNH5IKEfFeQbPf1ClyLcf+6NJOxg42rsP9yS1C8MOq0Eswgex+aV
         i2S1jC0We8IjY2YBKVeqsHzuF29CrUZW2h6adGqcXcEzww4sjdfMBaj2DMinwPpiEvwZ
         cooceQZfSEumTEyLZAf8F6PaFyAMBFtUFaUTmEGsuAxRwoY8wEHPs78yxmPRwNggciin
         koSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844868; x=1782449668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGt6y5IA37sjEJinxGUW8DV1fePrVRHX/t0SjqpgRkI=;
        b=bGMf+EncIN9qDNzmzgkTxl1kxA001Y0VYvMg9Oerl5dMT42MNmBnIXk8gv8KHdPg0q
         zQgSdoUzmdr7wy/GscwRG3IQVVsbAkjcspDTDZoEWKTVGyPYMgPJwstVdqc5BYk/orfc
         iQVwl40zyMR4XkS55NKp/iENNlxFpX/zC0RArRQ2WR+/dyuxdoR2ibBkO1XOqD/x78wo
         EwN1RrrJS1Bwzhp3fDrhVKoLboy7oi3yqefHoUZ5cKEK/x0tXzqvFXnHj2pxrV7AUb0m
         TUEV20lv+L2UCcVsclGsyLstIKPQw3IVZEF5+VjmRCqKSzjcghf3Mnv7Ke8VISU58nA0
         QNQg==
X-Forwarded-Encrypted: i=1; AFNElJ/MV4WSf8FZjzQcml6fuQYjHKijp2wpa7sl6+BJ32Y1p6vMQyVSlqhE0mqJgTjwefSGeyUKaALbx05SLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPDG2oyilZUnf1M3XqNcRQ/EHEuVC7A2SKSV3QGLyvvYVPBpq0
	SA/kGC4kni3PbBk7sailiTSGJEWZcdUv6BzAC+6nJeFx8jgKv1oju0Tz
X-Gm-Gg: AfdE7cmuJcfRYUIlOPrTD+pjaljwQqBmiLjQiekwo053jLEeQ8X/15EpBkxyjoMZbLu
	aQ32Oe773ccwimDaElXKd5yJsE8yxohUcPCmCFopksycuu/+D937nmoUYCmVmjLld4VbCKJtuXI
	n+f9MAOtDKGvHL68/NarF1YlrIcWs6tlAGxWxkNu+pv9ei8vRrSzAjhR+xvqy6wYPw5CY3T5zSh
	z6Y6hUJgQ0larbcL/2hWkrFBEnEdduvh8hn5Lrxl1p/A/i9QvPioFZ3mL8OTqL0Ezh+mOQwTKst
	vXx5zZoZWyUZiRmr3AdVgUTkNv63aCexYn4lryH2CuY2XYdNoizizPyfT7B9EfygBUDHW7GICtE
	jUUDFdRFgZ0iwa7YE4LfMsz5jEPrLBb4Gt8Kefb3Jc2MenD4VRPLqc+4JgniS9cBRF6YqcQ9eE5
	NP4Uspcnm6yETRpg==
X-Received: by 2002:a05:620a:2589:b0:91f:27bd:ded3 with SMTP id af79cd13be357-9208c8133femr270065985a.21.1781844867940;
        Thu, 18 Jun 2026 21:54:27 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:27 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH 0/5] dmaengine: sun6i-dma: Add support for Allwinner A733
 DMA controller
Date: Fri, 19 Jun 2026 04:53:29 +0000
Message-Id: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1IokmxVxEXMZm2U2haMiqCe
 HejXb7F/xsIZSaBe7VBpoWFv6lA1xWEl09PQo7FYJRxyukOZU5OMfpb02D8eAymtVa3nXY2Qql
 +mR68Xsd++Fvm8U1hOjew7wfgrTu3cwAAAA==
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
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
- Implements the A733-specific configuration and register mappings.
- Updates the device tree bindings documentation.

Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.8/drivers/dma/sunxi-dma.c

Thanks!

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Yuanshen Cao (5):
      dmaengine: sun6i-dma: Refactor to support A733 interrupt and register handling
      dmaengine: sun6i-dma: Add set_addr function pointer for variable address widths
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dmaengine: sun6i-dma: Implement support for Allwinner A733 DMA controller
      dt-bindings: dma: sun50i-a64-dma: Update device tree bindings documentation for A733

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 223 +++++++++++++++++++--
 2 files changed, 203 insertions(+), 22 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

