Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2087B2CA2
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 14:27:23 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id j2so21518329edj.8
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 06:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4r0x/+81qzFyHw/4NROJe0ylRPyD3aTo/zn4PoAdZr4=;
        b=ixtRsrDeU+hMKDJUuOz/IGdbM49WUr/7Or3m5PM6h1DLBfuKaqHoM3y4nS6xkQhr0d
         gRQr1bhxA39nDS0iY2f8EDzFINvzyAKa6SwKrgRd5Ux9+1LZyzMt38EfS0AIx0kq7xaw
         0bOZ1Ao4ZIQ5crhbQ5uTFRQJQdZWyqsDvbOnhwpNG+dW99BUJvst+eUJspBfKcoj/jXQ
         ozFLRbnba6F255Sca/WFI6+eNtZpO41MOZrStY7c6HMJCoCVWbcf1JTanx7NnpmMgNSc
         IoahsfCSu8PkCkXdG8CgyZNoJlCzk+xA5JBijYBnR8HABVWTQ0CCwROBdhZKPDiL3eVO
         YkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4r0x/+81qzFyHw/4NROJe0ylRPyD3aTo/zn4PoAdZr4=;
        b=HmZiEf7sBoowHB2K7T6lbeXmS8cGPC6ZgG9/ZaBbBFzCiWX2KW4DPY/J7ELg4oRja3
         SoQXSAwsBIUpYvichadXpTdjEpUFnNSo+E1tjKoeWJa1jbQ7Vx6rPE/ZWqTm0qtQyKKH
         cDf4u62wGtRY/F39CHuN/yHg+N4uveMmjziiYkbyb/zaQLrTYuPZUiG8PkLm9w6eOIk/
         BIrL3NncXPZrxKBQDmac2Tv+elXbv8FDOQaVH7VOXJ9MO9xpL+WxGansIfVWoZnmsNS3
         P5JUOZjmv8DwRiwHsUwHUHmD3uWfMeINUD5m5WE4i9eWFFYScSCcWJ4au6PbD7IZ3kAK
         1BjQ==
X-Gm-Message-State: AOAM533x6sphIUQERmoCiXQpzQBbLIz3of2cF2WcRV4u+SvKomesLhz5
	4hSYSF4Sn3C4iFFqgftmSbo=
X-Google-Smtp-Source: ABdhPJwDdbcT8mDHq5ifQZDMvJoYDhx6Dz2ueF+Qem30/WKpk3kkAdPxe5We/g/LudWenmsQZm7abQ==
X-Received: by 2002:a05:6402:424a:: with SMTP id g10mr16950016edb.309.1643552841455;
        Sun, 30 Jan 2022 06:27:21 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id o14sm12274616eju.118.2022.01.30.06.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 06:27:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: samuel@sholland.org,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/3] sunxi: clock: H6/H616: Add resistor calibration
Date: Sun, 30 Jan 2022 15:27:14 +0100
Message-Id: <20220130142715.291427-3-jernej.skrabec@gmail.com>
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

BSP boot0 executes resistor calibration before clocks are initialized.
Let's do that.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/clock_sun50i_h6.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index e5846e6381ff..32119ad16555 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -12,9 +12,14 @@ void clock_init_safe(void)
 	struct sunxi_prcm_reg *const prcm =
 		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
 
-	/* this seems to enable PLLs on H616 */
-	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
+	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616)) {
+		/* this seems to enable PLLs on H616 */
 		setbits_le32(&prcm->sys_pwroff_gating, 0x10);
+		setbits_le32(&prcm->res_cal_ctrl, 2);
+	}
+
+	clrbits_le32(&prcm->res_cal_ctrl, 1);
+	setbits_le32(&prcm->res_cal_ctrl, 1);
 
 	clock_set_pll1(408000000);
 
-- 
2.35.1

