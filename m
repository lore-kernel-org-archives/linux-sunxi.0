Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEBB184E
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so6736444wmi.1
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyNGlKcyBDF0YXtdVE2Mo7IFCo+00jQ8YxUzSjoXa50=;
        b=bb8Q/XHUIDCawlWjNkou8fyhAYQXwgoCWxuU2nSEBkYbxc11DdPvSJfIH4H9OT7Yzq
         G7taxhDewqonLeJPieV4nxA/eAMT1VL5uPvNHgnvZoZRnrl07bDXYySWDnx3CJtKtfhc
         c7WRNGwipiESSbwsKdnVpm+WRl7PmXWkjeJ1n/bfIzn1/So0onOpJuis1E4lW8cXf0Wi
         0qEyQOe2qUhhHXi5y54DLwkW3Vwd1nyC491YlpyMxdWjUz9zNhVUjoDDPfXpRl4kpXY7
         bajqLkBRLFMYAy2E9LzJ1AtRNAqvMEeneMKONHu40T1kqvMtUxubUnp9lNBOpZy0QWOU
         rJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyNGlKcyBDF0YXtdVE2Mo7IFCo+00jQ8YxUzSjoXa50=;
        b=ZMRimJZxYZJIprjSfh4U1HUYQtQMQ4o2LXHRiCqG6kJFW+p/8z75+ZiKfGV0tR4Gl5
         p4GsteEzW3KT8cy6z3aN84sBwlSBGXL5/tE9jMfNZ/AUzhnzvyc2FoJmKPzF22411Z7C
         fv3FKvDtcmuApY31uuxIvBGZdDlxLPfdQuHOpFqbBeiviZiLDZh3YvO2O1XpkFWMJxoh
         JX4J62gnsE/4x/hdf1OT8lGIoi4zsnThlWTa3SV6JNLEKm7WHccWCFUz5FYHNDxZ+sbe
         88KPi/Z0C0i2ZY421+2qEKEzoyXI6OyxHOfLRSDCTDeAlvYmr3JisCe63AUlP37emHOA
         Dvmg==
X-Gm-Message-State: ANoB5pkOdi5oQACNrhouZusu/z0QZVtO7jMSrZ3sR/s/SBjBVnfCuqyp
	oa5n65lxGV75u5OIbuUSMFU=
X-Google-Smtp-Source: AA0mqf7cIbCOnxnpggHzR0NyGxhzVeR20CXRn0Ch5nLdVmRZXdJ/+/zFl2wtSttlOKmH0pW7GLYpNA==
X-Received: by 2002:a7b:cd0e:0:b0:3cf:ca45:3b19 with SMTP id f14-20020a7bcd0e000000b003cfca453b19mr3984095wmj.179.1668266380066;
        Sat, 12 Nov 2022 07:19:40 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id f7-20020adfe907000000b0023677081f3asm4543484wrm.42.2022.11.12.07.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:39 -0800 (PST)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: lee@kernel.org
Cc: mani@kernel.org,
	cristian.ciocaltea@gmail.com,
	wens@csie.org,
	tharvey@gateworks.com,
	cw00.choi@samsung.com,
	krzysztof.kozlowski@linaro.org,
	brgl@bgdev.pl,
	mazziesaccount@gmail.com,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-kernel@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 04/18] mfd: gateworks-gsc: Replace irqchip mask_invert with unmask_base
Date: Sat, 12 Nov 2022 15:18:21 +0000
Message-Id: <20221112151835.39059-5-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove use of the deprecated mask_invert flag. Inverted mask
registers (where a '1' bit enables an IRQ) can be described more
directly as an unmask register.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/gateworks-gsc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index 9d7d870c44a8..c954ed265de8 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -189,8 +189,7 @@ static const struct regmap_irq_chip gsc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(gsc_irqs),
 	.num_regs = 1,
 	.status_base = GSC_IRQ_STATUS,
-	.mask_base = GSC_IRQ_ENABLE,
-	.mask_invert = true,
+	.unmask_base = GSC_IRQ_ENABLE,
 	.ack_base = GSC_IRQ_STATUS,
 	.ack_invert = true,
 };
-- 
2.38.1

