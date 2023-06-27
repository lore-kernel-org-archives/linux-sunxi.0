Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E179F2
	for <linux-sunxi@lists.linux.dev>; Tue, 27 Jun 2023 07:12:45 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fba66f3b14so2258535e9.3
        for <linux-sunxi@lists.linux.dev>; Tue, 27 Jun 2023 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687849964; x=1690441964;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ggLDGiLASKXjzv41vxcGuD0v2D3Md+XuVsA8ytWFhq0=;
        b=dD4ZR8xlf80OKvytf3PyeqgCLIP4CC6nIl+F8NYd6+cYEP0lEu/52Z6/BbBpzFzQ7m
         kY79A8AAUUBHKPrTwJEhmZudI6xu/p9bD3xdm+15HsaR2cTMJb5r/F2pHv/dTx7kzlR4
         zMHTz/bOflFXKVJm8OFQyuNY/5c50dM4wZhj7FG2mLHEno+033CgjqA8hTiNHnN1DO64
         zfri5fOXOpUFe8O0cBSU8yU1iG32UVPh5HkZc4vB0w7kWUAwwQ+gNKWvIZm0Vz0DuMId
         sWLg5fvMxzRUrvq8jS+dHVivz/ZpZTgBKNrNtkVtTxzM3abYlLkHziG4433gMo9x9q1w
         dGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687849964; x=1690441964;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ggLDGiLASKXjzv41vxcGuD0v2D3Md+XuVsA8ytWFhq0=;
        b=YJU7XsltX2JMidT/RsmGIYmzD9ExeltNkHCXgt+gpkDiErNwXo5JMgBC+3fmVKsdXM
         87Isz3/ySrLU5KOmxS0DXkzQ1X4DbO3VtzjbbTuy1WiqZr9JJjIrCYttbTeTx5opeBMg
         7SNTxuSjGBupWFhFA2trLpQCykDFaELEe3JhrJ5w9W9ELjjbdcxaAgW1m/CFRs3Z0jWq
         klzSR5yTAOqT0aXYfWzq/wE2cIgJw6fcLe3FfdamnHB13W9A6kCbyCiZH0nOcSOgXmQS
         EzAsCJZz5HSzJgVmuupXVv+ajYzXlLfqGIM/ZT4BFDhbB8JJZdH4n2rIz6o0fC1I5QqN
         6q/w==
X-Gm-Message-State: AC+VfDwMnS+VG14MIS0U2Z02hy0xmQOue3kwstqik6/fz5M6FuuGvLA7
	+aIeT1xzIBoCgHwxq8ncqW8I0w==
X-Google-Smtp-Source: ACHHUZ4xx+0rg/Ks+yJHZbTzNzYTWyjpHzcQcOs1x9M64X7tq8jGOULoEd3lGMvz94HJaCLUkFZMUA==
X-Received: by 2002:a05:600c:2247:b0:3fb:a266:3a34 with SMTP id a7-20020a05600c224700b003fba2663a34mr897038wmm.12.1687849963890;
        Tue, 27 Jun 2023 00:12:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm9464956wrz.47.2023.06.27.00.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:12:42 -0700 (PDT)
Date: Tue, 27 Jun 2023 10:12:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] i2c: sun6i-p2wi: Fix an error message in probe()
Message-ID: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ret" variable is uninitialized.  It was the "p2wi->rstc" variable
that was intended.  We can also use the %pe string format to print the
error code name instead of just the number.

Fixes: 75ff8a340a81 ("i2c: sun6i-p2wi: Use devm_clk_get_enabled()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index ad8270cdbd3e..fa6020dced59 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -250,7 +250,8 @@ static int p2wi_probe(struct platform_device *pdev)
 
 	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(p2wi->rstc)) {
-		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
+		dev_err(dev, "failed to retrieve reset controller: %pe\n",
+			p2wi->rstc);
 		return PTR_ERR(p2wi->rstc);
 	}
 
-- 
2.39.2

