Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5513D61A
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 07:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723794048; cv=none; b=T6EbIZR91EFzn7t5Rjckq747MB87vxCWnt1jEaqC6ksOAIJR4YYMpLnQ6s0+N7xKRS4Nm4KvVxa4QIfLY30N/aAvtnff2EIJnQa5jV0ceKT9/u4y1HzPseuDxBDlADRnStSqzpsdD97KCB0IY3Orjt50eQNf14xR+oMAwulfUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723794048; c=relaxed/simple;
	bh=wuCXCMKv9neHue5RT03UZNAev0xxb0NHHLIG6HZkums=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mBs80Q8hbqrW13AciUHLKrkS49WROn+qiA09cs5PD7EzM0q0jcTug3c9f2suAOw843e8XMvkyKHzoQAvmXyb1m8zUik6CtQo9MVT4eOuBvvprJmx0bQvLoqEkFECnGH6iugK0iilxlsfhYZanTmNWUT0oLrZbgrHs8CBlFkswQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tzia8j/c; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tzia8j/c"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso2145749e87.2
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 00:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723794045; x=1724398845; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oLYARa5Ui+tGIF4Drvfs6StvA2ztWhGcrNefYFJRi04=;
        b=Tzia8j/cjZIRS5vjQzrB9vlePZReXsw4x7Eol0X6cE6EeBbLx2C7B3vgZJiELt5NPf
         CLc9szNu57oTjzmi0gSmdxdHuu/ntfhoF0l3XiVZVXP+2borxSK/iGup1ufI/eXYXVj2
         Cy7FF8fW3x6cto8rgQEIixvfYfj5Usu2dL+KEY9Z72j8dXg8+H+0cY2wcR+aON8ZAqEZ
         RYGCMsHOwKhUHpU14DG7U2ZaIOqx25ShfNGPyCAvzmdyxNySabta8XqAMhu3bamSW0Q9
         83WvWUqbRHozZLoO9xYjuGXJKkZ+76IhlLMFSlRFgKKZQohk/Sh+NqdFM+gOUD8m0Fjc
         7G/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723794045; x=1724398845;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLYARa5Ui+tGIF4Drvfs6StvA2ztWhGcrNefYFJRi04=;
        b=dicAAFz9IaA1WiHHn8fIExAdtNnwG54lsq0APZ7wirtINlr8RxR4lfKDfkQwT6ZqOw
         KYJcRugzVYTNKwZnRxMEb/66vvC5d7y7n/S9oD3PPrKwmCijG+aQEvmdFrvyFHDhTyEM
         DHNJ7D/MMq9bPROb8oV1sb2e2fCERIaoDyHTyRe2HE4dgxtMitssNAMtMLV8FvAAeI7e
         xXBtfiOzc3Ex/3tyHcQcLNahkC9AcJvaLrF7D8GWNN/djSF+SbjfcjqSAXf3TDGLot/9
         tuEcxRKfIzLV5OjB7jdMaj1ZLNJPnJxXRSdCGVtLdUFmUJtzwEwW2c6DSDEZ8i7vpALt
         g3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWah2w2lIDcA4ltoPr1zG/XTRHXWtCWD5dhXPBi78ngJVPxqacUYITq6EsOF+rkYlI4LIEdGpqcx1PmGjW727n0pTLA6uR2XxqmB+M=
X-Gm-Message-State: AOJu0YzI2HySmT6qBG/H1cwwbrhI8YpwLuUVq86pY1JCmq8FHk65t1Z1
	GuFG+oayQMH2ShQu1iQMu57sXVOnW2T0IAns1jmusUVsZ5umgQvMcW5YlqqbhBE=
X-Google-Smtp-Source: AGHT+IECMU95MInedHm3gbs2CHg4muyRBBX1uWExaMf/N75tHvOw4wx/iPeO0uthtOMnMi5peo1F6A==
X-Received: by 2002:a05:6512:2243:b0:52e:7542:f471 with SMTP id 2adb3069b0e04-5331c6ae178mr1434653e87.29.1723794044597;
        Fri, 16 Aug 2024 00:40:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3596esm68549625e9.22.2024.08.16.00.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 00:40:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/7] thermal: scope/cleanup.h improvements
Date: Fri, 16 Aug 2024 09:40:30 +0200
Message-Id: <20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4Cv2YC/5WNQQ6CMBAAv2L27Jq2NkA8+Q/DoZaFboIt2QLRE
 P5u5QceZw4zG2QSpgy30wZCK2dOsYA5n8AHFwdC7gqDUcaqRlt8WvQjubhMGDD1GFNHOC0zzoH
 k5UY0pmqsVd5XfQ0lMwn1/D4Wj7Zw4Dwn+RzHVf/sH/FVo8La6WujSVempvvI0Um6JBmg3ff9C
 8Khm5nRAAAA
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wuCXCMKv9neHue5RT03UZNAev0xxb0NHHLIG6HZkums=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvwJxjlTKJcUNuxE8Zfq158zszP22govEMhUHg
 fY+uH8/VraJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr8CcQAKCRDBN2bmhouD
 1wF+D/9hn91FpwFdRVcHZWu6wnT364nzLzQQH5lm7ypWYurQPKsmy5wCaMYqmuXWG/kIIrbpmTR
 JUZGGUmY8GwfsZr2cH5hEy4MmHdoq3SjkotIkGanVjqy9xIYWQVbA+M5OqK2ccUBXMDJfXDO4zI
 1t9QO2GslHt4f3RA+omwit8PVKGGsh6ggn3PfWPmpajExMzJK8S3uIKxVcao9x4orr4HJ9MpZ7z
 yjd9XPJScq54oB8w7EfDTwxQCNI5G/oFWYsuigh8e+3jFh9OuWwmkio2Qo6mlm+J54PcbmrtFnc
 qfhZRdQKqlBoSfaAKZsX6aooFB/uyLCxyek0SJBo3BPOkAnWrXsibpkuLzBsJn6iGb4bENdzkcv
 bE38ZWujL1WltBof3/+lFW2Izcq2PkSNgoHR/WRmDV6TD0LShM03DqBx/DG0CrkcqypS0bObiGQ
 BhHtuP2hOXLwV9u+S0/5xkin0svFYO4NZiwlLenQYPdq1W0U9birYpQ/S5IhvbsjjZF+dRmaSsg
 v64snsoeFskgdv/BtgULWh2ja5pGB5MZJ+cutoTqzmdBWoWrEmCpZfdXOmFIp9iVS7ExGULbhNS
 kdLR94qkdKYE99rYyVne6Smn/Wc1h/g/bJ+qbGmBFpYGwQ2B4eRTHdy45v0r0PGT6wYtLfIvKFu
 76SkMH3Jr+b3r7g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v2:
- Drop left-over of_node_put in regular exit path (Chen-Yu)
- Link to v1: https://lore.kernel.org/r/20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org

Few code simplifications with scope/cleanup.h.

One of thermal_of.c patches depends on my earlier fixes:
https://lore.kernel.org/all/20240814195823.437597-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      thermal: of: Use scoped device node handling to simplify of_find_trip_id()
      thermal: of: Use scoped device node handling to simplify thermal_of_trips_init()
      thermal: of: Use scoped device node handling to simplify of_thermal_zone_find()
      thermal: of: Simplify thermal_of_for_each_cooling_maps() with scoped for each OF child loop
      thermal: qcom-spmi-adc-tm5: Simplify with scoped for each OF child loop
      thermal: tegra: Simplify with scoped for each OF child loop
      thermal: sun8i: Use scoped device node handling to simplify error paths

 drivers/thermal/qcom/qcom-spmi-adc-tm5.c |  7 ++--
 drivers/thermal/sun8i_thermal.c          | 11 +++---
 drivers/thermal/tegra/soctherm.c         |  5 ++-
 drivers/thermal/thermal_of.c             | 62 ++++++++++----------------------
 4 files changed, 28 insertions(+), 57 deletions(-)
---
base-commit: aef749dad7ff4c301e91b21fadf30776c1495fa8
change-id: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

