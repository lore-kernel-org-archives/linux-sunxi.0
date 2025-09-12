Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4981B27BF84
	for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 09:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669046; cv=none; b=BCdW8LsVtLw84IjyzUiyVHrbO9A8JlqxGv/ph2t5lRBNn/F1cUNkn+S1K95vcvQnuTFWdEOnRB1AiA5Z8HSiwuItxPV28Sz6wg08dzYYX6YSEAwDxmKfU+hjNfNVQwjox8xNIMpzBwkbTv3KkUi/rFCmJYOQBsCQ/6ddgnIqedA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669046; c=relaxed/simple;
	bh=+bVJ+4hy5vMtuVwCqUQtQcNPKerS7zzgW7OjoDwLJD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JKSFuMfDiG2qftXfk2yTMafw0lYEt/eYzB1hdKJDtH59GzfpN3qKKCPBAYtYShs85/wJPq760iWmcMnwK1MLT/5T/DldO2dMzV9w0SqYNcYWzs1BbnnFqyfkA8bLJ8e871hAtIe0c05VYluqRx5jzaoq0mHzTgwdWkJ4Tzai4zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tl3MQCZ3; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tl3MQCZ3"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dec4289f0so811345e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 12 Sep 2025 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669042; x=1758273842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BOMYwUSj3ToMRrs1GbfaZczlic4yEzoQ0wQhZEu+bgo=;
        b=Tl3MQCZ3sr/cxBzvURR7MT3HtOAgXUeSbBfCm6UA2ZXCbmG2MqQwpEcNV2dlLlURgW
         G40J72cqIKDPM+zMepXjYwxOXyhJObhe91ZmQ7bW5iyuoSs5ZNBNW/koAzWlj3NV1fwD
         hq45Qg2PuYdh37EDxBwKxWcCtDpXBrHIVqPtEznVYq19CFhNJJGMuJhaWB0o8MkQUIqU
         RBUD+99dfooOwHwvrqx/Qr84CpozjwOJ4/xV8CmBolu5QEYdik9dcEAST0GPblXXKMRh
         TFc0N3gaYFqIcDIUF68E13sywOYy0ff+5T+qh5f/DoolzvC24ZxzSqesIkGBygkEjIxV
         vwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669042; x=1758273842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOMYwUSj3ToMRrs1GbfaZczlic4yEzoQ0wQhZEu+bgo=;
        b=Uqx7rublCnGp0gM/JX5LXcaIVfT5foqx/Lp72fU0hw6XiLS9+CgOFml99QYyJVZKke
         8x+ufSwgNCrTFZjCIIHQXnAq9zocgcnacre9EH1Zdc3Q9w/z+ZRx836FVYEYrzHWl3bx
         CtxJjy7u7vgc6Tmu2u2fKMx3CZf/vNHnzKzTnunQQPKhfGwwMSdD6XIJZY//dAcRGuTu
         skPJahZ+Lov3S2F4BwLxIpJxuaTyw29bXxBjv6IkLPeEloxUjVlJENsuXoYS7Vc2BBxX
         FGrKhviBbYS9pksO7SnbHOMB7ht8m4cnA6exJRxoQCJ2Gb6LEOAoOhZT5MihS34dIN1S
         YS0w==
X-Forwarded-Encrypted: i=1; AJvYcCVVWPNmYCw94JLo/cCCoorjz3miiH+a2L84VLWoI+x+M6PvsxvtPzH22VDtxDv8Pzk3ceb9xGfOCRQzTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHmg8seDxQlT5IL1TRJVdyLmBNy8uVmn6qUgLJLPKXF99PUSo3
	WGoS+kxp7nDcEQRkwmVbq/tGN2ww7j5V/WIJIifz9vQrdc4wfb8MAa37hJpOSxGzyVg=
X-Gm-Gg: ASbGncsZlGN+ocw5KTvjfgldYUYK2GXRFqRobnWDIJT+VZao+BjljEu5knO6yWZW8Xo
	8Y4tQK2E/BoWgKnYdamdDUNzE+PaeRoDAgqmxq12bx4QSh7MPHGoJXoG8uz+WqugsuNqZ/SJ+Fp
	PuYyRrp2Hilc1aISdshr1c/nbC2/hvB2/Y+CKFhAb9seh1GBiDW1JUS8g13FCkCcIOQNgych/Hj
	/IvBBRg44nHn4d6J8y5MXGtsyZEpkbben882O2sF+WfNH9tl3rRsXZzluQ3ggqfObhDYqPhnvTh
	U6bHkfuF8B0ZkR/g+XXtb5h32qWwZZWLMVRSs8M99dVEThzj7B9js85bbVw4EfUAwC6LWP0TU87
	z/eb8iJ6BDpOLASGYNHf7R+b/Q5lrqm3Hww==
X-Google-Smtp-Source: AGHT+IFZ4LkljsZAZV2KGxX2vnp7A1Ij/erNB1dV87KomdD4NYdDAGsePpI/vQBLekU2xgSQDZkE4w==
X-Received: by 2002:a05:6000:2503:b0:3d4:c46b:e57e with SMTP id ffacd0b85a97d-3e765536c58mr1041490f8f.0.1757669042563;
        Fri, 12 Sep 2025 02:24:02 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d7b3esm5727337f8f.46.2025.09.12.02.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:24:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pinctrl: Simplify printks with pOF format
Date: Fri, 12 Sep 2025 11:23:52 +0200
Message-ID: <20250912092351.162307-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2536; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+bVJ+4hy5vMtuVwCqUQtQcNPKerS7zzgW7OjoDwLJD0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBow+anDJAMN9wRUbRQ5JlQl3eiWjS4RDs50mngh
 v0da2zDAfqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMPmpwAKCRDBN2bmhouD
 18n5D/4hSZl8udzkB2YzvH4Z9aKuFcLBa9CFrbK1nRLSDu5FSjWXEXWKEbFj1MHjLOqSErjfA6f
 fc2Ubu88L88RmHPoMzOYbLoElN/YbJz/dIcfvMLod8fnzL+nyanIDfXmVZtUmmDYQSgiudqq55N
 OgcP1rd3Njv+m6SEpSi9mucEgKnmUW/IXbyBYlD+Kf9WQMw6AGL4ICHWW/kdhFOk5ZcOjb1HnW4
 OAHTA2vvtVF74+R8APPWN46YH+EFMlIbmGxIAT4HXnpqw9hdoUbIXp5OqY+f027EOcWS+tUlw/L
 U+PodlsU4UHYaoRtvkk8VhihoB1YgDyYkotQtLGqHYP970ckzBwoScgk7ZWMrRY67jWusybohk/
 s0Sp6GbG2Iio6vqkiMMxTYn9Yvj1+Gifxh39F+gN7GBgU9oAjMTiPuB3aEF7oV1Pm9sO+X13wCk
 JZrp9Lr7mtvLvnSqC8NcPGe6K4RBMSK16uLP8KVuigMVo22/6w4qqL3uOChq/sXCS5+s5ImXBOQ
 XMGDwuPVLAxgzYT7HmVuCKaR23ULDBoq29eCZLj3YUNm5MuzgKkthjnb9mQWiHhNWP25F0eJDuD
 ujygi2OswjTMsQQ+Ad8fb301JcyprI6J6eqSPB4ZFgCmc1C+y4Btbks/pdsehgKkZWjRTK3XoZC PTV13F72brgao+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Print full device node name with %pOF format, so the code will be a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c      | 9 +++------
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 7 +++----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index c4a1d99dfed0..16cf9d15f247 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -258,8 +258,7 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	grp = sprd_pinctrl_find_group_by_name(pctl, np->name);
 	if (!grp) {
-		dev_err(pctl->dev, "unable to find group for node %s\n",
-			of_node_full_name(np));
+		dev_err(pctl->dev, "unable to find group for node %pOF\n", np);
 		return -EINVAL;
 	}
 
@@ -276,16 +275,14 @@ static int sprd_dt_node_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0) {
 		if (ret != -EINVAL)
 			dev_err(pctl->dev,
-				"%s: could not parse property function\n",
-				of_node_full_name(np));
+				"%pOF: could not parse property function\n", np);
 		function = NULL;
 	}
 
 	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
 					      &num_configs);
 	if (ret < 0) {
-		dev_err(pctl->dev, "%s: could not parse node property\n",
-			of_node_full_name(np));
+		dev_err(pctl->dev, "%pOF: could not parse node property\n", np);
 		return ret;
 	}
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 5f13315ebff3..50a16f3bd131 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -274,8 +274,7 @@ static void fill_pin_function(struct device *dev, struct device_node *node,
 			if (!strcmp(pins[pin].pin.name, name))
 				break;
 		if (pin == npins) {
-			dev_warn(dev, "%s: cannot find pin %s\n",
-				 of_node_full_name(node), name);
+			dev_warn(dev, "%pOF: cannot find pin %s\n", node, name);
 			index++;
 			continue;
 		}
@@ -283,8 +282,8 @@ static void fill_pin_function(struct device *dev, struct device_node *node,
 		/* Read the associated mux value. */
 		muxval = sunxi_pinctrl_dt_read_pinmux(node, index);
 		if (muxval == INVALID_MUX) {
-			dev_warn(dev, "%s: invalid mux value for pin %s\n",
-				 of_node_full_name(node), name);
+			dev_warn(dev, "%pOF: invalid mux value for pin %s\n",
+				 node, name);
 			index++;
 			continue;
 		}
-- 
2.48.1

