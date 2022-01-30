Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECA72CA7
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 14:27:23 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id w14so21706057edd.10
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 06:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZUNpG29Fm+/GYPPOfXv1yZJI+FdzI5pP8ZnZ4GLVPiY=;
        b=K6PlWZ8k/OkqI57X6n7xKDrUyMSVAEiPB1e8bjZIgGUJO0H/uS67TkPFyUDKPxy68/
         HpQ4irXPi3x3IzEzQrloyjdjGK6qaVW91G0GUjTPaKQIuUrnyasqtzPbXcnr9BBuRE4F
         P1BPkfNIrxKdCuLmz1UQHMfb87Z7JEZ1JGVGXIxsJV57b5ak8nY1oCJ8By0Uj2P9Q7iG
         SqeGPFmzkv+QKkrk7tms1BbE0WGesdOaQrGxT74eR+sJtw++TLIO7hILPE8xNhp/zEB2
         vc96PCRVoYLhVdrhre6vSdBU392MHT2c6E9MZOi5Me+s8CoQxuGgdxtQ6iGFuo0qf5z1
         F2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZUNpG29Fm+/GYPPOfXv1yZJI+FdzI5pP8ZnZ4GLVPiY=;
        b=fykFPStxsqFsQ0A8pXB1q3dGocMee8tASZnMghh/XFNAh/kN+MDddA3VDsij06Mi7C
         lWLGYdMCK4vbB3/p0vlOc5kImSw/HOrLSwbPfNhbrLHVqnIf7Zof8j1vZl0oKhtydJ4U
         hK2Kpe06k3iN7FDWmbGfpaHTLyHx5yP3ob9LQssG6qX5EJwLf4c4BBF65sy1iGLL2Bcg
         KXdn9dbf6f6bZyifgVmrBMQKi1YjVhUgRH8vO9Qf5L4GoShBO4pmxzMONWStd9/qKahl
         +dvTLvkfeIOy2Wr6oKVbMkjTqa2vifvt4vSSmNFKc01bH+PEEs+qzQpvSyoRMPSHXLtQ
         Bu4Q==
X-Gm-Message-State: AOAM533gHtWwQUn3w+d6S70odK9QLBER4cYZxQfIv52XNiCh57vUkL3p
	ukDlSMIWKo6d+HG2Oo3gIMg=
X-Google-Smtp-Source: ABdhPJwPMmm7B8ycVmCh28zOA2fGOOMbAvnHh3Dl3vHOlhGooHyCsNvyHBIM7OgMu8wZm4yvPXyfAA==
X-Received: by 2002:a05:6402:345:: with SMTP id r5mr17151988edw.269.1643552842238;
        Sun, 30 Jan 2022 06:27:22 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id o14sm12274616eju.118.2022.01.30.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 06:27:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: samuel@sholland.org,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 3/3] sunxi: clock: H6: Adjust PLL LDO before clock setup
Date: Sun, 30 Jan 2022 15:27:15 +0100
Message-Id: <20220130142715.291427-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220130142715.291427-1-jernej.skrabec@gmail.com>
References: <20220130142715.291427-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BSP boot0 adjust PLL LDO regulator before clocks are initialized.
Let's do that.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/clock_sun50i_h6.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index 32119ad16555..7926394cf762 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -21,6 +21,13 @@ void clock_init_safe(void)
 	clrbits_le32(&prcm->res_cal_ctrl, 1);
 	setbits_le32(&prcm->res_cal_ctrl, 1);
 
+	if (IS_ENABLED(CONFIG_MACH_SUN50I_H6)) {
+		/* set key field for ldo enable */
+		setbits_le32(&prcm->pll_ldo_cfg, 0xA7000000);
+		/* set PLL VDD LDO output to 1.14 V */
+		setbits_le32(&prcm->pll_ldo_cfg, 0x60000);
+	}
+
 	clock_set_pll1(408000000);
 
 	writel(CCM_PLL6_DEFAULT, &ccm->pll6_cfg);
-- 
2.35.1

