Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5172AB55
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Jun 2023 20:00:39 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-570114e1feaso59070297b3.3
        for <linux-sunxi@lists.linux.dev>; Tue, 20 Jun 2023 13:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687291238; x=1689883238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Hil+T6tTjsHDCUN56vDP/xOS2TfaWaaGGVktAjl5+M=;
        b=HkQOXQb5m8FKt7OrHyYeKKjOUv0EblsMgC52kHAov5ARFpIVWn0gVtcnwUssstrbkb
         qdqD4FVhUSKz7hyNDbCTt3QogkSAeLavCLrK2xEFULhr+3055R6WOQhCnjhfELxB7yGa
         uKmkfP3Zh83fPD0tngJs2L/5dvOHUHsKYKFT5B3gqjUmm+yaarv91n6cDER1Nex2bmkb
         NvytWmRv5QWvF+5oNuh0hvH2w27pahU3ZwkAaMk+vAjQL2hYaRt4mBuHifdpEMD2RzBE
         oPW0sxt1EL97XnlVeNl4nrEcUNasxtb87ax91owbqY1PxGUhWME/4fVoU2GElIVFRyoJ
         x5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687291238; x=1689883238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Hil+T6tTjsHDCUN56vDP/xOS2TfaWaaGGVktAjl5+M=;
        b=AMczx5j3bw016NjLc+WsFE64+p4hARUkHNbpUlB3pk5SHXT5lv0DZNiJ4Qgduobfka
         6MjWVOjuQnWL3YtPhzgPrAT30dO1fSbF6ccfngbuNX+QB2m3tXB9eV8pEXOogaaAEYBw
         VaJQINhEIh8lBXIHRCAlfU2vzO3/DC4/rS0rqf7D6vRYr63LGMXWXPBaV0IzVctA2dau
         H1XaW/BpXlKnFhyeW8h57MFle0m5HVJ8IYYpsDl5ThPORHTyHgDP74o1dHoYsdEtHsls
         3QDGGTh4QFw+FVU2TrrX/xOC9+yKpCIJPD6yeCT2FRFA728d+ZujyKD91GQx3bsbzCc4
         Bq4w==
X-Gm-Message-State: AC+VfDxTToviqebmRmPyjL165l6U/A5+bzTVkK1tVXQ+kYTCc0+AHKyU
	yy+VtUIbkc64Onb/GDXVzgQ1tZQnDrk=
X-Google-Smtp-Source: ACHHUZ6QDYPE6fxFhGbj+tiznTUs6dZX8ZfyYWvoC6HeXXYTSz9NY+ANaHHB+58+B+NcjpeR5y8V4A==
X-Received: by 2002:a0d:e982:0:b0:561:d1b0:3f7e with SMTP id s124-20020a0de982000000b00561d1b03f7emr13601499ywe.44.1687291238169;
        Tue, 20 Jun 2023 13:00:38 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id y201-20020a81a1d2000000b00569eb609458sm664197ywg.81.2023.06.20.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:00:37 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	uwu@icenowy.me,
	andre.przywara@arm.com,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/3] Add Anbernic RG-Nano
Date: Tue, 20 Jun 2023 15:00:19 -0500
Message-Id: <20230620200022.295674-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG-Nano handheld gaming device

Chris Morgan (3):
  arm: dts: sun8i: V3s: Add pinctrl for pwm
  dt-binding: arm: sunxi: add Anbernic RG-Nano
  ARM: dts: sunxi: add support for Anbernic RG-Nano

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/sun8i-v3s-anbernic-rg-nano.dts   | 209 ++++++++++++++++++
 arch/arm/boot/dts/sun8i-v3s.dtsi              |   7 +
 4 files changed, 222 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-v3s-anbernic-rg-nano.dts

-- 
2.34.1

