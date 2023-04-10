Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38DF2580
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 08:21:30 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id sg7so22222852ejc.9
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Apr 2023 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681114889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nC5nlZ+tuUl4iPtNuPZ+SkqHoOQRsx1vyq55dvSeDM=;
        b=kxKHSFYzCRdEwKvLWc2mFuAkv7aWmSrX9G7ddWyXnjfnScgpVJA+XSDqnJDmez+LBz
         89yvkxLyAAyPqCMXwAdmHl+HJReSjKvXUd1bmCHez6IuPl+ceBXH7xZCNOT7Rl/ukuL1
         TwmZRf1R2mohgagQ9P6d9JH1pOARRYI3G4dMKPkVE0tEDWyqMbxf+pKBwTkSumTWpcI2
         +iD7siMQrlBACVim7od4+BczBnwTPbeDZVkZOC5FElfMg/Wh0eZmvqmVoq3nqle0pcNd
         Cbut/OQu/qEkqDWmK9i3YygsEyGcs8mgrJFryGJaQtpW0EYkUNAoTDWRYWddxBQ1WGwe
         SsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681114889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nC5nlZ+tuUl4iPtNuPZ+SkqHoOQRsx1vyq55dvSeDM=;
        b=huJgFxUeFiqM9fy/Vamof4N4sMGDCE8ZlrkK01e00QvGe42pydGjhJNHJDVfv8t9Xm
         DKbb/W4SKDe9jAE3DoInaMIfnsW14C5Z1buhs7ML8frr6yIkJz+k5RdGSP87ds9Sedl7
         cv49ezrMFO+OP7diQg4LdolG7a79XTpEeJ/frmxqBCb82aN7xYJsrh0F+faqsXxcRMcu
         QDrVml1IfgLLGKoAzRE0c+xxOeTeez+J8XD2w1/8OgDVwNOru8len0c8FdMSUqsPjQTl
         XqS2PTV16zvxGVYrgm58qi/UCTSWz6hCFKG1L65VfDQE6yY3wgY2QiueCRllk4lhf936
         iZAQ==
X-Gm-Message-State: AAQBX9dCbvi74R7igHPqIsobiCZ3KEaFFQrJFfgrIyUqi7JJTL29v5NG
	vt6bpa/45w+4Cxeja7JySIE=
X-Google-Smtp-Source: AKy350bowiZ6n9ZGrUn+wmPNPUOUBowL5ORg5pT3b9IY+ppMi/Tc95ZwZk/Wa6SsZV4uKjo2OPrhyg==
X-Received: by 2002:a17:907:e92:b0:8f5:8da0:a482 with SMTP id ho18-20020a1709070e9200b008f58da0a482mr7177464ejc.25.1681114888592;
        Mon, 10 Apr 2023 01:21:28 -0700 (PDT)
Received: from localhost.localdomain (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id o21-20020a1709061b1500b0094a7e4dfed8sm1016686ejg.47.2023.04.10.01.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 01:21:28 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andre.przywara@arm.com
Cc: jagan@amarulasolutions.com,
	u-boot@lists.denx.de,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 06/10] sunxi: Make bit delay function in H616 DRAM code void
Date: Mon, 10 Apr 2023 10:21:15 +0200
Message-Id: <20230410082119.24616-7-jernej.skrabec@gmail.com>
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

Mentioned function result is always true and result isn't checked
anyway. Let's make it void.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/mach-sunxi/dram_sun50i_h616.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-sunxi/dram_sun50i_h616.c b/arch/arm/mach-sunxi/dram_sun50i_h616.c
index 7d2434309b07..3fe45845b78e 100644
--- a/arch/arm/mach-sunxi/dram_sun50i_h616.c
+++ b/arch/arm/mach-sunxi/dram_sun50i_h616.c
@@ -572,7 +572,7 @@ static bool mctl_phy_write_training(struct dram_para *para)
 	return result;
 }
 
-static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
+static void mctl_phy_bit_delay_compensation(struct dram_para *para)
 {
 	u32 *ptr;
 	int i;
@@ -683,8 +683,6 @@ static bool mctl_phy_bit_delay_compensation(struct dram_para *para)
 
 		setbits_le32(SUNXI_DRAM_PHY0_BASE + 0x54, 0x80);
 	}
-
-	return true;
 }
 
 static bool mctl_phy_init(struct dram_para *para)
-- 
2.40.0

