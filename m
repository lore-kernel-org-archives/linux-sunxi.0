Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BF2156F45
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 01:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787707825; cv=none; b=T9wVoXUynzcyAUZdVVOdMty+o3pZqJBe5CbdcDobqs22VM5U8dGs6Y2MW5YRGD1RLS7znJh4uhHrf9luCMbuDqWljlmgqbtjmk3jP8mIAJ0+o/gI5vLk1MS8onNfojEzFhCLaBHGjWfe79CrrxEeupTuLRp+c5qmpn9ep428G7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787707825; c=relaxed/simple;
	bh=beIIm8qKX5xAz1kaK23VPevYeR5bzySrtqmTuOgVCWk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HTQJ0akprg6qXKtey3/3eXmC2NILMgyPhUxxwVUwjJbjqGVcPZF8HAg+Rqkew7F9aNSv1dECGjogpzO1AC2L8/WrQM7R2XT8LHBN90rgyQ6X8prUTIIMl9EgsB6ps0NbMVw/nNuRwpby2QDQc5sBAe7oJMFJidiLpvCsSJjvRjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9410keZ; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9410keZ"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-936dfd009d1so118798285a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 25 Aug 2026 18:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787707823; x=1788312623; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZ92bi0xtWb9sBQgu6ZDoMhAhxRk9cQM2bCHLJFTXQ4=;
        b=A9410keZVTF/YgzTFkYmOSgCJ7BShsGQOtti/jYrdKjOcdWU0B3U+lTtio/AwhW0oc
         eClr3BMc5YnGBxMR5SdrFWZRbHQFAGzzs8Zxec0mekzpcXmcGbY+f+BP9k3Sc+jrgdGO
         kcjYCB7WezpX94bbZXMymi71mg7iQKxIALIZ3KgCHQ2igEOBHuWm+Nqouk9r+7UadHym
         3yfCAQTrkw6yaVpvwCXSTHsZx6psh3z7GM3XjjHh+SSSj89j0d53sMYm4Wgg2udI4RIZ
         py4PeGtji3h5oKXwhlT/g7FX2zGBqsQRgxHgbL7aPJTKiQ8fDf2My5HFYoaQVfFSHaOk
         92zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787707823; x=1788312623;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZ92bi0xtWb9sBQgu6ZDoMhAhxRk9cQM2bCHLJFTXQ4=;
        b=NN/BM77zxbimL10deW5Wc7VLH3oHVCp/ujhTfEAMw4SHlE01d48QHd28k9o+PfAT9D
         VoVHXVFqWDEvgHaYySF4nhjg5dTIzARhvrNkoWSovIGL7JZHBc9PxFzy4IZUoQxgxY6A
         dhFL4dGL98syCOy0cFpSMTjJrUzEZMV54qZr8bLZ8D98Nc2HUJE+JT7laL2i00LLxjER
         d2+17emrHNOTzCqGNHzOUCyclTrlr9RKKkSRYAgOwVg+69sNEnJliaoqSgMUFBseqGaA
         ACv28Jw2KcL2BRgIWGJOOFQYxhgT1UZqTRIVYQqcksTSflo3uKzUAYXsa0kI+hxxjN7H
         V+oA==
X-Forwarded-Encrypted: i=1; AHgh+RqOoxR77N0oVFyKKHKvL0/LohO1DlaRUwmtOOY+3Bb8Os9B2qmoyp+OPHlRnzhCdyDvy0xuowxe2qKihA==@lists.linux.dev
X-Gm-Message-State: AFuF++kJLgxIrg0RhLfEUMXv+wJZX1+HjLwVDRT3rh0YG3gs8gOYuQvq
	8n+VQgvzPSNa/wXM7Hb8d7A5OLbPEFlq26IaenpIPmqttlbpNKJkvPXx
X-Gm-Gg: AR+sD12v9Uh8ExT0gMmbi6Ft0VzzuHPuqK715JG4vE/93TaqhAcBg25yo5qXrxKsj37
	+WFF/UNycS/qbd8Hy+UJmhnR8Ob/UWkJ5qECi/7odHWQh3+I5A5xKQL8vhEMRAzVSixQ024yESD
	AgfR9odRVVxZMeY6Wss0QF/Xm7ibUV3ftB22PLk/7VgRsuB3zHlNDZJg9m2lVny8spxwvwsfTqj
	uyj0VR8ibBwco+T4z5xbClTg+lgxiy3OidR5jtWB0v8qrZgMu7XEC5V4qPNwV1BWadhVdrLxm5l
	2M2t1xe6S14MdOQddmBhTi/ZjV9Ro/uim/vfQWvV+cMFirU2eRQbWmnHk4NTJeDDM6zVzGw+rpm
	LEH4oQecx+F6fGZfkN2BXEnRU9ToJjMzxubSMUzeSbVHzTbNlzGpBFSJvZa+UEDxKEjz8jy4c2a
	AJw6ljSgJ5Sy5raIK6HbF+/H3i/gHu7QFsOa4FVABTYJT33VTtOahSv2alsAl7ww==
X-Received: by 2002:a05:620a:cc3:b0:936:ce17:7792 with SMTP id af79cd13be357-9376f3635ecmr870773685a.8.1787707822640;
        Tue, 25 Aug 2026 18:30:22 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e67c52csm102398585a.38.2026.08.25.18.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 18:30:22 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v4 0/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Date: Wed, 26 Aug 2026 01:30:02 +0000
Message-Id: <20260826-sun60i-a733-dma-v4-0-dc2f745f40dc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBCG4auYrq1ppz9YV97DuCilhRoBQ6HRE
 O5uwQ1KXH7JPO+MKNjO24BOuxF1Nvrg2yYNvt8hU+mmtNgXaSMgIImkCoehkcRjnTGGi1pjA1w
 IyhWVokBJPTrr/HMpXq6fHYb8Zk0/Z+aLyoe+7V7Ly0jnu//1SDHBhea55MqZDPS5rLW/H0xbo
 7keYeWBbj0kzzhxQMRRUWN+PVt72HqWvJMqsw6UNPmXn6bpDUbPGuNAAQAA
X-Change-ID: 20260619-sun60i-a733-dma-c2455149165d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
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
      dmaengine: sun6i-dma: Support variable address widths using masks
      dmaengine: sun6i-dma: Add num_channels_per_reg for flexible interrupt mapping
      dt-bindings: dmaengine: sun50i-a64-dma: Add allwinner,sun60i-a733-dma compatible string
      dmaengine: sun6i-dma: Add support for Allwinner A733 DMA controller

 .../bindings/dma/allwinner,sun50i-a64-dma.yaml     |   2 +
 drivers/dma/sun6i-dma.c                            | 153 ++++++++++++++++-----
 2 files changed, 122 insertions(+), 33 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260619-sun60i-a733-dma-c2455149165d

Best regards,
--  
Yuanshen Cao <alex.caoys@gmail.com>

