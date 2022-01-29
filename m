Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22E32CA7
	for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 15:58:51 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id u24so16664815eds.11
        for <linux-sunxi@lists.linux.dev>; Sat, 29 Jan 2022 07:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P0eNryV2FKWC3Jwe07nRfkwg/dzjAikOP2plVrdqweI=;
        b=BXmTDXnN++Y4H0HbWl+iKrnXvOLO7zLNEdxI25ZL5zdwHieC53MdGptBByAfPJbS2J
         RjOp9nLBB0E1TO/40EWjpXU5nZw8XgPq4vTXMgZZv5F1w5tik/uWwTdPd6PV5/boqZZl
         1hpkOQXKZkOfnIQcZa9MhpLh1x62mCoGPT0V6adDu7/CuoJ3UlEThKGsHP6X4swxegua
         JEDayoiEckUg2lNBLPT4EV5MkBU+W2EK3ZdxdB5oPUB5GetSuR2LNZvMF7XWJ4H4JByo
         OsMsh+dNWcNUFgLvFzezRWqMdK7IhGtqFc1TiFcr1BUkaHTUCrheSo69yUGck1e1CQ0R
         0UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P0eNryV2FKWC3Jwe07nRfkwg/dzjAikOP2plVrdqweI=;
        b=egqP7q3h8G8qCCl4b9ndL5TgPPWk/90SmemQer9ysLYAz8ufsT1F5x8rrwnqMQgQdN
         CryKExIfZPfh2fEINTV3Ehl35chXY7dWx9vcr/NOw4D9O0KnYe1t2VTztBeXxSJm/rZT
         MgTWMc72RzEYQz46GACBMQ/cy04zvQVkexPQi9H+TPq+Fm4lknnsv8ofxHSukQ6XtuM4
         ZJleeZ9IKzNTnBGWg7lPAwbgoN/mp5TaKL02AynhcuPDZf9lbIryic38RYSWFGMyMz9o
         cGiOFAg6opqRdu33AsPUj3KK0Ytme2LBUAjy4IwqTEGeyZcQCQUt8WC0/WFQ2P7kqgT3
         gjLQ==
X-Gm-Message-State: AOAM531yvxyEbW2CjcNckPfnPjdJL+ZcV8PqCrKfkhkpKDkZJmZ/nQMP
	RxcSXj1Je6awLlcQidX8Zmw=
X-Google-Smtp-Source: ABdhPJyD89uh3VE1VilYOFdbCSIsdAOB32CFPlZXl3QSY0F5R2OHc45haw7HDK1+dNDuLdLemLkieg==
X-Received: by 2002:aa7:df14:: with SMTP id c20mr12958012edy.199.1643471930226;
        Sat, 29 Jan 2022 07:58:50 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id u17sm11164935ejb.31.2022.01.29.07.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 07:58:49 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: jagan@amarulasolutions.com,
	andre.przywara@arm.com
Cc: u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] sunxi: fix H616 DRAM ODT support
Date: Sat, 29 Jan 2022 16:58:42 +0100
Message-Id: <20220129155843.111741-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220129155843.111741-1-jernej.skrabec@gmail.com>
References: <20220129155843.111741-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kconfig symbol is missing CONFIG_ prefix, so compiler will always
skip ODT configuration.

Fix symbol name.

Fixes: f4317dbd06b6 ("sunxi: Add H616 DRAM support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index acdfb3ceef8c..76f520f4e780 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -720,7 +720,7 @@ static bool mctl_phy_init(struct dram_para *para)
 	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x3dc);
 	writel(0x80, SUNXI_DRAM_PHY0_BASE + 0x45c);
 
-	if (IS_ENABLED(DRAM_ODT_EN))
+	if (IS_ENABLED(CONFIG_DRAM_ODT_EN))
 		mctl_phy_configure_odt();
 
 	clrsetbits_le32(SUNXI_DRAM_PHY0_BASE + 4, 7, 0xa);
-- 
2.35.0

