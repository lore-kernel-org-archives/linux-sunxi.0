Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982ED2598
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:29 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id ga37so11156719ejc.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1yM1/EDM4MBLG1vCeuCd8tshmmhDmZi4FSZyd65pIw=;
        b=pEBeNmTn3LuP4EEm6U1D/UFUu2g4/b4+h6614dUZ6cTVnA6GMwJsYK/RZNY/SOBFXC
         btmFN5fUKvJyDmk8f43OmrMBCOZ6cgt35KveDIKw/AmYDu3zWxpvxuYU0G5tD2/LyB7d
         Z4QX62jbXP/0GZaqLOgk0dnzhqcdCimpPN9dRJcrAc6nyVQsbYRs2497Eroe2Wf5hu5B
         C9OW43kwxw77hQH6l/c3eFauQaQXmkMPneAADH8WJf7wVhnm83pHZcn+b+ZHNd3x2HFv
         78mwpS+HKV2WDFc2e3YOy0V4xKKThhlTO4GF6+Aywg1RWeAN7FQ5cAK4x+9vp8uN6dWn
         5Azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1yM1/EDM4MBLG1vCeuCd8tshmmhDmZi4FSZyd65pIw=;
        b=6VcJnycOZmvHOzXF7rgsom2p1BJQieH8RgvFXnKcSHpwMtRZgg9FcFe5pcHSspHFSD
         V/I4pSn1fO0xcY1vx2iZUaB/duUSt88i4aVcX621Nvti52qws0I5/k7ke4ySQxIeogov
         /O6+qjzIz3MvjHO9iQ1E4oxeAdufIm/UI6kntgaBMkP+aqNZ6SwXHeMELP6jvqPLVE6N
         iwwd2/X8trwWeG3y3BOE0Pujb9yNSXWettqnAoRAmmGn1Xad2w4WfMyRFN6e8tk9ORXW
         G3fJPtIMC9SngDg0D8Z1j3taSqsoHSzu/wruuYApPVIjmSA6Bo3eMQOpZfi9JxtNDS3l
         ceyA==
X-Gm-Message-State: AAQBX9d3a8FeTYrszSnJ/y2xBi+lTrpPa2PmxjQ39/Tr2DSk08Cvb5lz
	T1umExkdo8MblO871r6ubAq8WGBU3FzB8A==
X-Google-Smtp-Source: AKy350YiL6UCwfoa43ZSUMRfHbzK1YUtBQWWHb0ZdYAdbHvyXvkm6ty95xTCtyz0vRytdvFGMma8zA==
X-Received: by 2002:a17:907:a68b:b0:94a:4499:ec30 with SMTP id vv11-20020a170907a68b00b0094a4499ec30mr5475206ejc.15.1681114887741;
        Mon, 10 Apr 2023 01:21:27 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:27 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 05/10] sunxi: Always configure ODT on H616 DRAM
Date: Mon, 10 Apr 2023 10:21:14 +0200
Message-Id: <20230410082119.24616-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410082119.24616-1-jernej.skrabec@gmail.com>
References: <20230410082119.24616-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vendor H616 DRAM code always configure part which we call ODT
configuration. Let's reflect that here too.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/Kconfig            | 2 +-
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index 1b47a49f938c..4300d388e066 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -488,12 +488,12 @@ config DRAM_ZQ
 
 config DRAM_ODT_EN
 	bool "sunxi dram odt enable"
+	depends on !MACH_SUN50I_H616
 	default y if MACH_SUN8I_A23
 	default y if MACH_SUNXI_H3_H5
 	default y if MACH_SUN8I_R40
 	default y if MACH_SUN50I
 	default y if MACH_SUN50I_H6
-	default y if MACH_SUN50I_H616
 	---help---
 	Select this to enable dram odt (on die termination).
 
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 630c7c3be882..7d2434309b07 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -736,8 +736,7 @@ static bool mctl_phy_init(struct dram_para *para)
 	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x3dc);
 	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x45c);
 
-	if (IS_ENABLED(CONFIG_DRAM_ODT_EN))
-		mctl_phy_configure_odt(para);
+	mctl_phy_configure_odt(para);
 
 	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xa);
 
-- 
2.40.0

