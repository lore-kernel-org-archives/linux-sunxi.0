Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D182580
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:26 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id qa44so10507512ejc.4
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/cGjouI014FMon125WsXODXksS9Tj0VsdQVA3bmMGk=;
        b=m15MV7bqyymzjLpm3EDK3oV3mJH2CDrAAt+uOmcGWLW/xBjYqZEh2rIy5RmVk1e0EW
         LsVsQxhjahujujB0yZY26ZM7HI1Zlp+wCNKComgfASHwTMEiABoCr8kJbs5UYxWIR3eH
         PVlzIZLb1Tti/VV+WDY2N3Bkg83PcQLk7f1f5AWWjDQXWLaQ8ityXyA3NJQUxt7o46hn
         u9XURPxGDQU2o4GZa35uIB7nn+BH+3c9VzqHEVDK6UskR9SokGfopmBp50BMgDYLgpyl
         2t/M1P+uAUqafIk/giEqI8iFH5AIkrD+kCoBKuXs5N6l2Iglw8tdxONP1dRkhfBnaP2Q
         s7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/cGjouI014FMon125WsXODXksS9Tj0VsdQVA3bmMGk=;
        b=f6v+98QKJ+f9gTNbF7O/ahNHIUG+cxzZ8e7nHu7aKhrYcNocoligaz+Zg4rpaA+Mgz
         QzpvkDFQLgNulptdaDZl0WGd8Ey3mAt7dmuf3FXR9DHcQfo2m+VR8U8q8SOQLmaY9qKN
         MEiyhOrHCzch96hQV+ZkDXB6K8uQ0+379omerXvPfL+VPUjc0ZPMQLENH9eCOf20oAD4
         1VHqFnQRrGCPmZItRE+ynq8Rotl/1dKPeC+doDqEUtrUHuivjo4pOaiwuNLKNEb214h2
         YeHeU73yI9TAFO0jRBSS9SnvoPrFiKLVa7l7ePsFtVOHOEeMuRbLradD2tkeN2qiKIhY
         tuDg==
X-Gm-Message-State: AAQBX9eL9qNNlWI+yueTZ9iqgM3HUyBlV1GRhewOhCEeFDycxa1BQePQ
	coo8rFnVj2tTaV6E+LvqP4g=
X-Google-Smtp-Source: AKy350Zjy2utumZHBCMbE+xyMVh7m9uj07c60sfC12tosxx7QweJkQPBQo/+BlJ1oWWE7RCvavuJvQ==
X-Received: by 2002:a17:906:b1d7:b0:885:fee4:69ee with SMTP id bv23-20020a170906b1d700b00885fee469eemr6738516ejb.59.1681114884613;
        Mon, 10 Apr 2023 01:21:24 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:24 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 01/10] sunxi: Fix write to H616 DRAM CR register
Date: Mon, 10 Apr 2023 10:21:10 +0200
Message-Id: <20230410082119.24616-2-jernej.skrabec@gmail.com>
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

Vendor DRAM code actually writes to whole CR register and not just sets
bit 31 in mctl_ctrl_init().

Just to be safe, do that here too.

Acked-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 454c845a0010..039e76224367 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -873,7 +873,7 @@ static bool mctl_ctrl_init(struct dram_para *para)
 	writel(0x06000400, &mctl_ctl->unk_0x3240);
 	writel(0x06000400, &mctl_ctl->unk_0x4240);
 
-	setbits_le32(&mctl_com->cr, BIT(31));
+	writel(BIT(31), &mctl_com->cr);
 
 	mctl_set_addrmap(para);
 
-- 
2.40.0

