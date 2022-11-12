Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9DD1C01
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 15:19:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so4898889wmb.0
        for <linux-sunxi@lists.linux.dev>; Sat, 12 Nov 2022 07:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaXPTSTfVAjT3RnVq8UtQeB7ybyxfMU88BI11sZ0ri4=;
        b=NuIqoadpk7a6YuPwcL2jBzcSRnizeRBdvdMOwXhqv0QhYjXNBoZcWgQbSk4hxC25Jr
         VqQM+NpB3lsDhIe3ul6BOKcJE16jotTUbG4v7eHHlZN70s46tDMoI9bXlWW+l0lG4Qcz
         G1mFPUovYKpz8d7efaIHwFJtD7Qp1wDYLobfkDiQzwhuq35ltpXIZfKg7OOqEyGFyh5B
         oYcO1U4KbFR98+DQKRwMRqZAdItqqaYY7M4LkXXL1ZAHuaqPi4MWhTFn+4Ce0a4x9Sek
         HFIozN8h6Ti+uObJ9Ye5aKmHNUiE7oJ4dLgeKmYLrSbJmS1DWRH5jEZFi4XcVvaJI6bs
         T94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaXPTSTfVAjT3RnVq8UtQeB7ybyxfMU88BI11sZ0ri4=;
        b=qenRmX+QW7n6+toPR7XXf5QrL7wxIVyvfEEsCP/iJDqNIvJmPvue/jDreGIAXOi+kZ
         t0FVsY6mN50aiDLmvLVsBY3/7BFf/zo8JwIfBopzfowNj44nBJCzQWoYm8fJfovZtaBy
         aaSNQ85pVGUiRHVDRIdsKR0YfoD/QYLkYc55fxoxwYzuqSj2hXIRD/xPqn3g0ztDLkv7
         m5KSOuEDbzAY62CgHQCUIfWKGrwMWah/PeEYDAk34bqPQmvxROrDXM3UMLWAb0cy859+
         8/oR8STPG0w/2XqoImUEunwuD++hhjY+3yAuoYT1xyt9YYj7t02k+/+WO/FUqkMbhJIg
         6mAg==
X-Gm-Message-State: ANoB5pmvaY8PH7NXN98XkUNmYDO2FcWz6io84a4IBB9cYcHY3JCb8npI
	D8+d1vwGbfhUI4zS9c1Wgnk=
X-Google-Smtp-Source: AA0mqf4aVlgv4NKIQNHEtLgESCS976StOAwTb8iQKtN/zZUevBAxm6R/3osOCE4mMmRvPsjMGogm8w==
X-Received: by 2002:a05:600c:54c3:b0:3cf:70a0:f689 with SMTP id iw3-20020a05600c54c300b003cf70a0f689mr4195425wmb.161.1668266382338;
        Sat, 12 Nov 2022 07:19:42 -0800 (PST)
Received: from localhost (94.197.38.186.threembb.co.uk. [94.197.38.186])
        by smtp.gmail.com with ESMTPSA id bg1-20020a05600c3c8100b003cfaae07f68sm13192790wmb.17.2022.11.12.07.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 07:19:42 -0800 (PST)
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
Subject: [PATCH 06/18] mfd: max77650: Remove useless type_invert flag
Date: Sat, 12 Nov 2022 15:18:23 +0000
Message-Id: <20221112151835.39059-7-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
References: <20221112151835.39059-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The type_invert flag does nothing when type_in_mask is set, and
it's part of deprecated functionality in regmap-irq. Remove it.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/max77650.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/max77650.c b/drivers/mfd/max77650.c
index 777485a33bc0..3c07fcdd9d07 100644
--- a/drivers/mfd/max77650.c
+++ b/drivers/mfd/max77650.c
@@ -138,7 +138,6 @@ static const struct regmap_irq_chip max77650_irq_chip = {
 	.status_base		= MAX77650_REG_INT_GLBL,
 	.mask_base		= MAX77650_REG_INTM_GLBL,
 	.type_in_mask		= true,
-	.type_invert		= true,
 	.init_ack_masked	= true,
 	.clear_on_unmask	= true,
 };
-- 
2.38.1

