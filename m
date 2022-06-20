Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA9A3D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:07:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id k22so9641978wrd.6
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rFP2epvfooKrZpPFT8BKKDNI28ulsq6H0dBYSPgFoyk=;
        b=AjebCnrCn0roYHEXtZUSrMTMzWgreVkEMmGmWHB4aW5MqCKA4G4WAtMmLhSH/wSD9O
         hErB+wW/nmuyZcj6VsVAhDUiCzXy1A0InOSiMOhVg1zOo944NV//bnCbQ2Nfq/Wvm/4X
         gHuja0BV7C29XQ21FTvJ66Q4m2HHGHfjAfbDNfzOus4oL46kEV7W/Ut/DNWQxw6A0wN3
         MaclksZzjz+wgvfYM3RiCRmGkMi+n+Veo8oqESntYKECZMRtvsRVSUdWqg/UzoMptmRp
         DOSCYB+7UcRMW3szUyAX5e47sGuNfYYpbyhUPLebUPzr6yz1Frjd0ZNrD8flYUO0+4T7
         n+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFP2epvfooKrZpPFT8BKKDNI28ulsq6H0dBYSPgFoyk=;
        b=htX+1mYEKru/cS224ywQfYF+lF3DVUSnYOuImaYPgXAYeIuvZnAtSxWleeke+myOqL
         6BSH6xd8jTHM1+r8pn8ErVGtLli4cxqzv7TDOJZwowbJRP7mUKAuGSwfIIrwCmzsJJT9
         dkV8wrx+NljaoYHwMULcDvFJkvXx0VyOyrY4e1n9r385O1BBHPtxdklh19woh6vZlbEn
         kKxkYPgZvyrqgm4W3MRE5eXQIa6rssQ1KCxM/wUjByMJvTnK/zrbW+yYCIi25WqtQSfK
         +IDkpnG1g2iXDUHm1KBQ+8wKcrgY2fxEwvzEkig0XWzFuEPvKHJPasnqdPvQJElpg3A8
         +ovw==
X-Gm-Message-State: AJIora9ZsJ1LogLknsmXVKZPxK87jOmKwBSukAnaPZ8TBc/+s9+UpKC/
	OK/RyjR7TYcibk4x8VmKhT4=
X-Google-Smtp-Source: AGRyM1tPhWdLWdfyykUlpNJ3PSEDMPtwatE94NYU/Ih24mSrC9Dy3BbzCPtCbJhpEUzIutMTZqJdog==
X-Received: by 2002:a05:6000:10d0:b0:21b:8ffb:80ad with SMTP id b16-20020a05600010d000b0021b8ffb80admr6433209wrx.444.1655755644354;
        Mon, 20 Jun 2022 13:07:24 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id o20-20020a1c7514000000b0039c4ec6fdacsm15898561wmc.40.2022.06.20.13.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:07:23 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Cc: agross@kernel.org,
	bjorn.andersson@linaro.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@codeaurora.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	b.zolnierkie@samsung.com,
	myungjoo.ham@samsung.com,
	michael@walle.cc,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	tglx@linutronix.de,
	maz@kernel.org,
	lee.jones@linaro.org,
	mani@kernel.org,
	cristian.ciocaltea@gmail.com,
	wens@csie.org,
	tharvey@gateworks.com,
	rjones@gateworks.com,
	mazziesaccount@gmail.com,
	orsonzhai@gmail.com,
	baolin.wang7@gmail.com,
	zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [PATCH 43/49] mfd: qcom-pm8008: Enable mask_writeonly flag for irq chip
Date: Mon, 20 Jun 2022 21:06:38 +0100
Message-Id: <20220620200644.1961936-44-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM8008 has separate set and clear registers for controlling
its interrupt masks. These are likely volatile registers which
read as 0, and writing a '1' bit sets or clears the corresponding
bit in the mask register.

The PM8008's regmap config doesn't enable a cache, so all register
access is already volatile. Adding the mask_writeonly flag should
reduce bus traffic by avoiding a read-modify-write on the mask
set/clear registers.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 7bc6becfe7f4..c778f2f87a17 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -141,6 +141,7 @@ static struct regmap_irq_chip pm8008_irq_chip = {
 	.status_base		= PM8008_STATUS_BASE,
 	.mask_base		= PM8008_MASK_BASE,
 	.unmask_base		= PM8008_UNMASK_BASE,
+	.mask_writeonly		= true,
 	.ack_base		= PM8008_ACK_BASE,
 	.config_base		= pm8008_config_regs,
 	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
-- 
2.35.1

