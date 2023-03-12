Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F271FC8
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 13:15:22 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id r15so11325006edq.11
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Mar 2023 06:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcxV1wX7rb47JP+vxHLlW7kUDa4wWKVgvS6sgALwgGw=;
        b=ODbPQ7N7rdF7EFlId0JmuPvIklOktriiSsEKOHlymmDjBH/58fkmj87U42BbMmmhzq
         cRpzesIUgktIYROMCwsOISO2LdxA0d+eejbFUIReTiGoA3PfZXdgEwewY/1mxTkhh29t
         I0E7ytga8wv2xo8zowTdmndz9vIpuU4i7T326W2NvJjYWe3k0uY0GG8Dqvgs578pLz/a
         8l2WVOrhD/lFxI/iFdw90crbyThWlvt5SBWG54av//X6VxirivqwVkpUKYEIR1+PP2v0
         VETS+1yD5t+Wf4SlOfCYs2YH1y/KYNnyU8FVUAH+HVhZkSCu+Hh9zN68Q0/91/nUZ1b2
         82GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcxV1wX7rb47JP+vxHLlW7kUDa4wWKVgvS6sgALwgGw=;
        b=ZkwxZr+32mGxivGaHSKmcvhpZy1gIUz3QvGXjolr4smc6wvikGuK7iNiX6GgdcczbN
         lxao+N/8l20zXf+fk+HaiZo9ELnL5bSpvuJsX2N47QJ2lD+2y015nIia3L7j+Z+uv9tB
         ox4t2vZIKwye4hF1w/MJ5UT3zTGl2XZYKYYLGf/CAdXNPS84CK6nHKggZEAnNUAtbZCE
         svtMRxNiEtkUsW6XpbcWS54KnRjuvFG5K6gX59bGj8lpffcHqwvX8WvUNKKmFq6AU7tP
         ZhJ7LMHIe/df28Tn6omgHKtaTFGFe/s5HGYplhkmMftr9uiMgDeBVBruNpaunN5pWD3f
         YzBQ==
X-Gm-Message-State: AO0yUKWN2UGWBQEFnr6ANg2/kKsYlIZoSZvo2ksHAp3fH+BCxv87Eptw
	fTnctkxUDAJURNlvto+5xhsKgA==
X-Google-Smtp-Source: AK7set/8w9H2snVcfgYgwSmNkJivUplw0WFZlSku0efRNPRGVxUfGIQBHRgRKDu2+ZZjdY1voLlADA==
X-Received: by 2002:a17:906:58c3:b0:878:625c:c8ff with SMTP id e3-20020a17090658c300b00878625cc8ffmr40766458ejs.54.1678626920485;
        Sun, 12 Mar 2023 06:15:20 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906399a00b00915d58e56f0sm2223493eje.77.2023.03.12.06.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:15:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] Input: bcm_iproc_tsc: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:15:14 +0100
Message-Id: <20230312131514.351603-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
References: <20230312131514.351603-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/input/touchscreen/bcm_iproc_tsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/bcm_iproc_tsc.c b/drivers/input/touchscreen/bcm_iproc_tsc.c
index 35e2fe9911a4..9c84235327bf 100644
--- a/drivers/input/touchscreen/bcm_iproc_tsc.c
+++ b/drivers/input/touchscreen/bcm_iproc_tsc.c
@@ -511,7 +511,7 @@ static struct platform_driver iproc_ts_driver = {
 	.probe = iproc_ts_probe,
 	.driver = {
 		.name	= IPROC_TS_NAME,
-		.of_match_table = of_match_ptr(iproc_ts_of_match),
+		.of_match_table = iproc_ts_of_match,
 	},
 };
 
-- 
2.34.1

