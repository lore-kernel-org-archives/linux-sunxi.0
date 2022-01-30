Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB82CA7
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 14:27:22 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id j2so34432169ejk.6
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 06:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y69xkdHYbKKEcSX+ohcsTP3L61Fzz8fr4ydW+IkebY8=;
        b=UgM77dxoKg34PdHXIWSoVY9PkhcKTQwVdyRVdOX0QFZvBvIDGO3kya59OsZH0etmGs
         /uvlXVVfmkEM2JrwgeUuLDT64kOhA+nvf3iSAnYzq8BZoR8Cdx9g2FiKOMpuFzTVpGtx
         9dWidu4WmeOcMHyHh7TyoJEjuTUWlCCFj91PwZyCHuBorYGZ8faY6LNo2n8hLRLzSAnd
         dwNtbRwzJyNld3IjZI6sc9JR/Nq7g9ZKuejP35F8PSzoW3PssRg86JhdDnhm1nZgOWVq
         6ia4D0Fvls9XaCzqpVUoP3Pqh1QXu9THy+ZCGUKUAQLq0+SGhzL96dLK1Qsb1jnYMB9T
         wnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y69xkdHYbKKEcSX+ohcsTP3L61Fzz8fr4ydW+IkebY8=;
        b=78jcemw9t5gFrUWUX3lbAJgH3TpZAESoQcxPVjf/XYBiAg0S0+E37gB9JYCiZr4Un4
         aMDUfKylxSQJFaACq5guqDFy2VRjHBan87fxXqicEFOt6e/qI8aYfg+Ljlox6NyR3DbY
         wK1ZxS3VB9NQjQLQZJqMPaspLpXk87WLAGutAL1YaHvbNvVwu9HFJHe22xagAt5t1J6i
         J6J8sQnYwdAweBsesb0VXQS2/daY0WGVC8/YRppbbSvFJFVH8LogeVXaaMcMJwjc6Twt
         VfdzpNUzNpGihM2vDBlP+4x1RuyK3PIYPJTmbOL28PAtbLM4qEFBRmA8Q8Wid4Vp7M4s
         1JYg==
X-Gm-Message-State: AOAM531ov7po/Z4rAqNxLhJu/ft47KNIlvQwh+Xw3lLVxkdMnkeMyz0U
	JHtjlhSawdaGZD+zpLqQhJE=
X-Google-Smtp-Source: ABdhPJw68Hv3cjhk8EFTQLvtKRqZReITEADpipapqTV0bm3As9q7OUS2q8nc+Yp6y4HPhvrPRRWeIw==
X-Received: by 2002:a17:906:c105:: with SMTP id do5mr13885249ejc.165.1643552840601;
        Sun, 30 Jan 2022 06:27:20 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id o14sm12274616eju.118.2022.01.30.06.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 06:27:20 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: samuel@sholland.org,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/3] sunxi: prcm: Add a few registers
Date: Sun, 30 Jan 2022 15:27:13 +0100
Message-Id: <20220130142715.291427-2-jernej.skrabec@gmail.com>
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

H6 and H616 SPL code has a few writes to unknown PRCM registers. Now
that we know what they are, let's replace magic offsets with proper
register names.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/include/asm/arch-sunxi/prcm_sun50i.h | 10 ++++++++++
 arch/arm/mach-sunxi/clock_sun50i_h6.c         |  4 +++-
 arch/arm/mach-sunxi/dram_sun50i_h6.c          |  8 +++++---
 arch/arm/mach-sunxi/dram_sun50i_h616.c        |  7 +++++--
 4 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h b/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
index 5f636e83845a..fd63d3aad839 100644
--- a/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
+++ b/arch/arm/include/asm/arch-sunxi/prcm_sun50i.h
@@ -37,8 +37,18 @@ struct sunxi_prcm_reg {
 	u32 w1_gate_reset;	/* 0x1ec */
 	u8 res10[0x1c];		/* 0x1f0 */
 	u32 rtc_gate_reset;	/* 0x20c */
+	u8 res11[0x34];		/* 0x210 */
+	u32 pll_ldo_cfg;	/* 0x244 */
+	u8 res12[0x8];		/* 0x248 */
+	u32 sys_pwroff_gating;	/* 0x250 */
+	u8 res13[0xbc];		/* 0x254 */
+	u32 res_cal_ctrl;	/* 0x310 */
+	u32 ohms200;		/* 0x314 */
+	u32 ohms240;		/* 0x318 */
+	u32 res_cal_status;	/* 0x31c */
 };
 check_member(sunxi_prcm_reg, rtc_gate_reset, 0x20c);
+check_member(sunxi_prcm_reg, res_cal_status, 0x31c);
 
 #define PRCM_TWI_GATE		(1 << 0)
 #define PRCM_TWI_RESET		(1 << 16)
diff --git a/arch/arm/mach-sunxi/clock_sun50i_h6.c b/arch/arm/mach-sunxi/clock_sun50i_h6.c
index a947463e0a53..e5846e6381ff 100644
--- a/arch/arm/mach-sunxi/clock_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/clock_sun50i_h6.c
@@ -9,10 +9,12 @@ void clock_init_safe(void)
 {
 	struct sunxi_ccm_reg *const ccm =
 		(struct sunxi_ccm_reg *)SUNXI_CCM_BASE;
+	struct sunxi_prcm_reg *const prcm =
+		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
 
 	/* this seems to enable PLLs on H616 */
 	if (IS_ENABLED(CONFIG_MACH_SUN50I_H616))
-		setbits_le32(SUNXI_PRCM_BASE + 0x250, 0x10);
+		setbits_le32(&prcm->sys_pwroff_gating, 0x10);
 
 	clock_set_pll1(408000000);
 
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h6.c b/arch/arm/mach-sunxi/dram_sun50i_h6.c
index d05375c90277..b332f3a3e4aa 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h6.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h6.c
@@ -12,6 +12,7 @@
 #include <asm/arch/clock.h>
 #include <asm/arch/dram.h>
 #include <asm/arch/cpu.h>
+#include <asm/arch/prcm.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/kconfig.h>
@@ -665,6 +666,8 @@ unsigned long sunxi_dram_init(void)
 {
 	struct sunxi_mctl_com_reg * const mctl_com =
 			(struct sunxi_mctl_com_reg *)SUNXI_DRAM_COM_BASE;
+	struct sunxi_prcm_reg *const prcm =
+		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
 	struct dram_para para = {
 		.clk = CONFIG_DRAM_CLK,
 #ifdef CONFIG_SUNXI_DRAM_H6_LPDDR3
@@ -680,9 +683,8 @@ unsigned long sunxi_dram_init(void)
 
 	unsigned long size;
 
-	/* RES_CAL_CTRL_REG in BSP U-boot*/
-	setbits_le32(0x7010310, BIT(8));
-	clrbits_le32(0x7010318, 0x3f);
+	setbits_le32(&prcm->res_cal_ctrl, BIT(8));
+	clrbits_le32(&prcm->ohms240, 0x3f);
 
 	mctl_auto_detect_rank_width(&para);
 	mctl_auto_detect_dram_size(&para);
diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 83e8abc2f8d8..454c845a0010 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -19,6 +19,7 @@
 #include <asm/arch/clock.h>
 #include <asm/arch/dram.h>
 #include <asm/arch/cpu.h>
+#include <asm/arch/prcm.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/kconfig.h>
@@ -1001,14 +1002,16 @@ static unsigned long mctl_calc_size(struct dram_para *para)
 
 unsigned long sunxi_dram_init(void)
 {
+	struct sunxi_prcm_reg *const prcm =
+		(struct sunxi_prcm_reg *)SUNXI_PRCM_BASE;
 	struct dram_para para = {
 		.clk = CONFIG_DRAM_CLK,
 		.type = SUNXI_DRAM_TYPE_DDR3,
 	};
 	unsigned long size;
 
-	setbits_le32(0x7010310, BIT(8));
-	clrbits_le32(0x7010318, 0x3f);
+	setbits_le32(&prcm->res_cal_ctrl, BIT(8));
+	clrbits_le32(&prcm->ohms240, 0x3f);
 
 	mctl_auto_detect_rank_width(&para);
 	mctl_auto_detect_dram_size(&para);
-- 
2.35.1

