Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FFA3D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:57 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id o8so16101330wro.3
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dZq4DXS5hfuZufkfinYetDi/sPSwHy1FNwiaqhpssa4=;
        b=bpjyLwVivcFSW5QVbgosK/o2QuZHms1vCc6tC1sGza+OT1YZWe465cW4jNRW7fx4ks
         msy9Ia4HJKGcKj1u1StthDIoGNe0jPNNRCwfixCCbhsIu8kl5EdbhBkaAOJGTjzxLAZf
         Bv9bbx8NKTphmbx8bemLzrtymECuH5WWFEStWDPJlp6dqluOf0EOgjov5G1nTwcbn/99
         6V1IcwQ/cUBFnAQ+UHfvGn1YssCCtL98+3EotWIqSk0wFS+MMtuhmD5WuWOcv9MXK3SK
         oL+O91AqJHe+kT2bNOas/VelkJQaxBD6di93/z4nY9iPMcMc3LCgHQ1sLEmd+cWZ+9Od
         WH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dZq4DXS5hfuZufkfinYetDi/sPSwHy1FNwiaqhpssa4=;
        b=YaiQzpc+UmnleMJVBUVFRnS2jw8QIvUetG/ZVjAjAC6JOpuK/WYBkVpWi20nF/5j+h
         1A9cm6uJdlTk4YOULyvXO4XpNXeP/j8j4SnKpbUeMRnS+/9TzIvGp1KthLbO+S5jHbIr
         44F5ggBBVgPEgCTzfZq/MYvaL0KKXW70gI7SoYOchmL8zloW8gyjHAQ1JVFP972/lb+W
         6jOoF+MQ8Sow5lH7YeSpF1+v3S4MLvevXnUMN/S/hDhvbwityEgjjU0CJjhXDz3NF8Wy
         eXj4JAtElh0dOfw4oJ5TxXS8+Qmfzfw5HOv7yMc5cMVPL4hjrhP0+OIcQEBtca05q8o/
         mAdg==
X-Gm-Message-State: AJIora+kB1ikNIV6sZPdY8St+RNzHUA2Nk5d1gAEIMHqrPzO3NepyqFv
	HIcrgwdGLrNTfLXYDtY5lx8=
X-Google-Smtp-Source: AGRyM1uUe+TJYcYrAuoAsTQoql0GG3zgxE4cm70M4L11J/HjtjuiCzoxQPxyTkB4HBjRJYR8SssVEQ==
X-Received: by 2002:adf:fb06:0:b0:21a:3dc9:f12d with SMTP id c6-20020adffb06000000b0021a3dc9f12dmr19252192wrr.204.1655755617100;
        Mon, 20 Jun 2022 13:06:57 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
        by smtp.gmail.com with ESMTPSA id x1-20020adff0c1000000b002103cfd2fbasm14315943wro.65.2022.06.20.13.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:56 -0700 (PDT)
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
Subject: [PATCH 27/49] mfd: gateworks-gsc: replace irqchip mask_invert with unmask_base
Date: Mon, 20 Jun 2022 21:06:22 +0100
Message-Id: <20220620200644.1961936-28-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An inverted mask register can be described more directly
as an unmask register.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/gateworks-gsc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index d87876747b91..28ec167a9861 100644
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
2.35.1

