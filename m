Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC53D75
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 20:06:19 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id k22so9642047wrd.6
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Jun 2022 13:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UMBZF982Sgxs/kqKw98NXLNKJY18JDApVwptU4z2w/4=;
        b=G6wwdsUb0o0KkrQXWK3doZef7L8BgtwmGkyRy70p/dnnUdSeIm80U4/sQB+DU/UyBu
         lq+G3r2iFyKxiw8S2yrwvMIXSzdaqaSlzGS4cckrZH7OKT1FjnzDeBIuWam1Ix15Gcur
         CfuLb/IeNTNq7XCpjpezZA1RortUasUbT6SbqO7vsRpKBd8y8QVrNVDKk8S2BlgA83Qo
         sumJyldJr7QMcNLyzlmXUF+xt5g+wsclm5yeaMm9sxF+W/l0sViSgbIphnns4qWzmkfQ
         TOnbQAZGAYQPI0jnJ4I4pX8zAZqQjOgq7SNmFg/7Q/XM7k1OPTgUVNx0dMxnLUJdn+hU
         Ziwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UMBZF982Sgxs/kqKw98NXLNKJY18JDApVwptU4z2w/4=;
        b=nE56giW1cJsdmtwE8KxgeBckZ5tpdiWr6ZE27zttnQcxzy0M5KH60klarOgwb5AjsK
         QWvOOw1IpWjrt58HGHUUR78CNDPIF3JUE67s0a1CXExloE+OBols1ECuSdVMEWjTV3v8
         7bBwIh2yf2KyagJLPpijyTe8pswk9HN3mNYT1htmvXCPUft1z29eyj4n8twPn+GjDlEF
         JSjs18j+S38fFZyF6G0UscES6dqrwkwc/uT9AiGmSu4Nl5Mfb35OTqDypB3yb4ySp2WF
         /PG3FILv9aXY9+KqIJrMCungwkV64/teqcz26JaBHGaS6ohnVsxaXI96dQifo++K4OGz
         9MXg==
X-Gm-Message-State: AJIora+PVVafor2JGbZwU1QUAjpTorJJcoffc8IdOT2Ewjrquqb28H4A
	cZkfXyRd+UeonMt4pP1zaA8=
X-Google-Smtp-Source: AGRyM1t4d4cjIVC7sSPWoVSQarvyp90HMRRx6FeW4tX3bvpi8rs+MlYEB74yzJdHRG+/yBrQgYJfeg==
X-Received: by 2002:a05:6000:1e1c:b0:21b:8a12:acba with SMTP id bj28-20020a0560001e1c00b0021b8a12acbamr10398783wrb.710.1655755578056;
        Mon, 20 Jun 2022 13:06:18 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c4f8400b003971fc23185sm20679416wmq.20.2022.06.20.13.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 13:06:17 -0700 (PDT)
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
Subject: [PATCH 02/49] regmap-irq: Fix offset/index mismatch in read_sub_irq_data()
Date: Mon, 20 Jun 2022 21:05:57 +0100
Message-Id: <20220620200644.1961936-3-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to divide the sub-irq status register offset by register
stride to get an index for the status buffer to avoid an out of
bounds write when the register stride is greater than 1.

Fixes: a2d21848d921 ("regmap: regmap-irq: Add main status register support")
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 4f785bc7981c..a6db605707b0 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -387,6 +387,7 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
 		subreg = &chip->sub_reg_offsets[b];
 		for (i = 0; i < subreg->num_regs; i++) {
 			unsigned int offset = subreg->offset[i];
+			unsigned int index = offset / map->reg_stride;
 
 			if (chip->not_fixed_stride)
 				ret = regmap_read(map,
@@ -395,7 +396,7 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
 			else
 				ret = regmap_read(map,
 						chip->status_base + offset,
-						&data->status_buf[offset]);
+						&data->status_buf[index]);
 
 			if (ret)
 				break;
-- 
2.35.1

