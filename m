Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D622C2580
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:32 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id j17so1155272ejs.5
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hU+qXrwaAPMTbWqGlOJi976THVgTFXt+TgGipOqXPLM=;
        b=CKLvf8tGlzvQ77ikz0XK1og0DfIdmQ1BOxxPGK+IGOtLRYg+4rCfKYLXXAyNLCwQ73
         9EFNyCcKudoBgu+uZDO7Gny/XE10ugWYSUHr/nvvIZ+tDzspDJV1xULaFtorrY4Y7luX
         M2CnzwwdIkvkW2ZtPPtznGZKTDXXgrXuF8XFriwP53pNH8l3nOBX83C3mVt4xywBH0K+
         u2IVk8j1ELqgjLYIO8rkJrKHS7PgeNcP9W9uhx+9n7n+TbedRdGmJSAEDWPZB816Bat+
         92RWQVQZ0JIfcK0jWVe5JLrG2ahFc6rrIV7rAf5gskfzJICkuZKgJBEquyvgNeV+PAXM
         Z7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU+qXrwaAPMTbWqGlOJi976THVgTFXt+TgGipOqXPLM=;
        b=05SYyuY7WlgYcDHFFgUyBHIfZPx0cK2EAPFJGRDR0L9qxeAiYJdqFSiYFql0n5iKVs
         sPcDfCYGYPRXK2lNAGM39jXVyB5mBSCZEhnEgr/VcFq2eY2/zoyKgFA3sag4SZWNWu5R
         BFBUt2Qrh0YXxy997+hJkXr4SPf0XIQjLNEl5dKjOVV9HDS76/ylKxiRxsytWeoAQ68j
         a92Kymao8E75syrj4SKwac+/zEgS86900HkNVu0Zos7g777nNGhv06FYDU0g2z+nQdyY
         ZBfP3ciXdS67tnwdkpI9c63Q2ftvgV4f42nXY4vr1YvyCea3kLdtl5i4D2X+5xF9wDQ/
         wq/A==
X-Gm-Message-State: AAQBX9fazDmYiy3mmTye2uhqUaadYzEiOfBFQpL3AAeSpT9mFGMJYE21
	S4zQAru45rLEr9/1wlPZs20SS4Bu+n7Gqg==
X-Google-Smtp-Source: AKy350ahXlfjl/GkHFYB7lKrtDbOLqym8B47Au9RMy12JJlLpfu10/ZpPmiay5Obnf37+Ue7sVBKlQ==
X-Received: by 2002:a17:906:eea:b0:92b:34cf:16a with SMTP id x10-20020a1709060eea00b0092b34cf016amr7357099eji.52.1681114891069;
        Mon, 10 Apr 2023 01:21:31 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:30 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 09/10] sunxi: Parameterize some of H616 DDR3 timings
Date: Mon, 10 Apr 2023 10:21:18 +0200
Message-Id: <20230410082119.24616-10-jernej.skrabec@gmail.com>
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

Currently twr2rd, trd2wr and twtp are constants, but according to
vendor driver they are calculated from other values. Do that here too,
in preparation for later introduction of new parameter.

While at it, introduce constant for t_wr_lat, which was incorrectly
calculated from tcl before.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c b/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c
index 8f508344bc17..f109e920820b 100644
--- a/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c
+++ b/arch/arm/mach-sunxi/dram_timings/h616_ddr3_1333.c
@@ -48,10 +48,11 @@ void mctl_set_timing_params(struct dram_para *para)
 	u8 tcl		= 7;			/* JEDEC: CL / 2 => 6 */
 	u8 tcwl		= 5;			/* JEDEC: 8 */
 	u8 t_rdata_en	= 9;			/* ? */
+	u8 t_wr_lat	= 5;			/* ? */
 
-	u8 twtp		= 14;			/* (WL + BL / 2 + tWR) / 2 */
-	u8 twr2rd	= trtp + 7;		/* (WL + BL / 2 + tWTR) / 2 */
-	u8 trd2wr	= 5;			/* (RL + BL / 2 + 2 - WL) / 2 */
+	u8 twtp		= tcl + 2 + tcwl;	/* (WL + BL / 2 + tWR) / 2 */
+	u8 twr2rd	= trtp + 2 + tcwl;	/* (WL + BL / 2 + tWTR) / 2 */
+	u8 trd2wr	= tcl + 3 - tcwl;	/* (RL + BL / 2 + 2 - WL) / 2 */
 
 	/* set DRAM timing */
 	writel((twtp << 24) | (tfaw << 16) | (trasmax << 8) | tras,
@@ -85,7 +86,7 @@ void mctl_set_timing_params(struct dram_para *para)
 	clrsetbits_le32(&mctl_ctl->rankctl, 0xff0, 0x660);
 
 	/* Configure DFI timing */
-	writel((tcl - 2) | 0x2000000 | (t_rdata_en << 16) | 0x808000,
+	writel(t_wr_lat | 0x2000000 | (t_rdata_en << 16) | 0x808000,
 	       &mctl_ctl->dfitmg0);
 	writel(0x100202, &mctl_ctl->dfitmg1);
 
-- 
2.40.0

