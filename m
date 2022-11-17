Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9366517E0
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Nov 2022 06:07:11 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v1so1802833wrt.11
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 22:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UiXSAQsSjwWqOGc9spTfADfVAnOu8H9dxOp6ONZY5HI=;
        b=BqXgBQ7H19xsIldwSJ3XEtEaIyFB1pdOaoIIBGAvsLqPWuYbRoHDUN2CEBw0y3fxO3
         uwXsNGip+B4h9O1rmk+YMJmusJHfaeq7vO88bENdgIc6d4g/Q5ERZP8h+CMGECBu+X6k
         DHr3Vgr6V2tKU6lJj4Je8jANmXUTuaIp0l0++ThbeldD1m97ufIyMdpurrQHTy95XFcz
         dONdw2asOsd8CV8KJJwzAEFz5StzdHnVE0EM+gDQ28o/PqGKMes0ezBU3AmSxPHq4QcM
         SR1e7NutED2dxq9rz3GeAL70s9b4ihla6W7mGew7S/MZI2pr/0jy20LEPAyRCBdyzW3z
         xR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiXSAQsSjwWqOGc9spTfADfVAnOu8H9dxOp6ONZY5HI=;
        b=YmDJ+oztOl/tz+e4WpULrKyeq6MxWiRHPx9UgPcshIVq7P/CmdCHovTZYkoTVOmKvb
         fXTizCe825EP0vLlubzoP4uSlBHz/685bBrAkt2CXu9pZys54KHYAm/foxRLDuYW1D1K
         c4gp38cncv/0LzLcK9DxZwxxwaty8TJkEYA2sgh7pu4XZBy5TdRCMJBalyyVbI7eFtwZ
         hd5da3Ql+MUf6f/qRwuy0Yz1NDgOvi7lSpaeydX7hKUG1V3wng9oQoNE+ZveLXfbHHpk
         p3Og6CnMeNQrxIr9ES8V2cOS4N03MH3auUeoJCIOln5RahIFGNjEWM3bpvPoAUhtehLA
         szCA==
X-Gm-Message-State: ANoB5pkieQvZDkjRUSTbtFAGRJ1DzivnkEU9VQAf9YPs4E7+Ys0VBOCb
	BLn9VWOH80F4DZx4JfTe+JM=
X-Google-Smtp-Source: AA0mqf5SwUTUY/lj91u2/nwQu6g7fE2GFbJh2pd3jLHyIsRrmrwZ+DiGtLaGJyqtt7bLuhpDmkLHAg==
X-Received: by 2002:a5d:6b8d:0:b0:236:4c14:4e4c with SMTP id n13-20020a5d6b8d000000b002364c144e4cmr431753wrx.634.1668665229774;
        Wed, 16 Nov 2022 22:07:09 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r11-20020a5d694b000000b0023691d62cffsm16542568wrw.70.2022.11.16.22.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 22:07:09 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mchehab@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/2] arm64: allwinner: h6: Add second IOMMU reference to Cedrus
Date: Thu, 17 Nov 2022 07:07:02 +0100
Message-Id: <20221117060704.367945-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that Cedrus on H6 actually uses two IOMMU channels. Manual
mentiones two IOMMU channels, but it doesn't specify which is used when.
Page faults were also observed from both.

This series updates binding to allow up to two IOMMU channels and fixes
H6 DTSI.

Please take a look.

Best regards,
Jernej

Changes from v1:
- add minItems to binding
- add reviewed-by to DT patch

Jernej Skrabec (2):
  media: dt-bindings: allwinner: video-engine: Fix number of IOMMU
    channels
  arm64: dts: allwinner: h6: Fix Cedrus IOMMU channels

 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 ++-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

--
2.38.1

