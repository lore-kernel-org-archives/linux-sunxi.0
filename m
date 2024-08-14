Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78581C231D
	for <linux-sunxi@lists.linux.dev>; Wed, 14 Aug 2024 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666684; cv=none; b=Ps44kiAt2SIzkAqVkZcWquoW2oX6Kcb8MnIHvE2lYDfwVk7VfBihH+EfrKUmMslHftlvSUD75B3uHfHg9IHtKGqnkWDb2XWfQ38LfALo/x56ML+9mzk2IXOX9l1GxqXG9+MtG58UGPA/X9zVCKXSPSYbCEuhZzez2FH/LOhLiuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666684; c=relaxed/simple;
	bh=IDFzF0yce2bZ/E4Xh35DH7oRTWEv0YVs3G0L/MpV6jA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nXjOZ/HyNxm4nLWHAqocW+DzlyeaN6VymYU8/tJFgTRHKvyBtihqg+7xtSe1rquVgP+qyA5ht2yzkgl28qCBso2GB5IR5RMkvXRIWUUPWvdWpsQKdNu4nM0NxROrbQ9i8DPVHu8uXRng+5FtQbWkwNZG0W6cpb/Y9NFb9WxYces=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3Aw011c; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3Aw011c"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f01993090so313659e87.2
        for <linux-sunxi@lists.linux.dev>; Wed, 14 Aug 2024 13:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666681; x=1724271481; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N7Q/2ZdZUcy3TqByrudq/6lAn7wj4MC3IHks2nP1UG0=;
        b=b3Aw011cY95326nopqGGFOkzuWlnZ0g2GY8EKV6ZaDpFYYlUQA5w8v6pjiKPr4I1ow
         wmW0bwFvQ/M6QBn/XW+3Vf4H/fiy3tl43OfbVe4JluPTBotnOnbu4yidvbOvghzSJB0M
         Aw3i4Tfp7v8O8SYDmr/oal5kMcssP8A9/nSRwY4p70Os3GSUcxP6lu+Opfzzi33OwmTY
         rPA+ZWKE5lNiLnFrnKmWkOln4nnK7uX7Otd7vlpnSKIudvSXAunFIvYRx6Iy9Bio83qK
         ckOXJaDafpiPdpB9KkEyzmA/ubz0sgH8sc6tBfPktBHWn5M5XLNLsXVe9qVuU2wDJ/Bm
         r71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666681; x=1724271481;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7Q/2ZdZUcy3TqByrudq/6lAn7wj4MC3IHks2nP1UG0=;
        b=tncSbjSD0Hje2IXjzsYLqKe6SNgurEMe7YO3x/VLecm8UIDNxunFk5xb6pFAK/dg+Y
         CvKV+QwuufnYq5AM6RlDswJ/s121yslCwTLMBGIixiFkBp0svcb4mZ/VkNNIfWDIPbTB
         soa1hdIa0IYiY1UoQJBe5DIXmOU95Bk/PvIVF6o5hbfm39w9Ag4q0uL29rCfupCuwGb/
         sU3PChMWjzvMmwiANt5GXUBDYza0BDYEWFrpvfwAS6EGBhASmjWFSyHLRj+vBZ4PTfAi
         0EvCCpfqSUU3jo/WK7t47e/v8L6bkgwc9k/M0gQxl9TKmcR8RK3VW3Ijc545k3wCkwYY
         7lfg==
X-Forwarded-Encrypted: i=1; AJvYcCWON/byX9tk8yy+J49323bO4VMQvYjqzbxOH022AW0TsqLoxiog7tAdku0D61cjP/tRSP8x5Q80xbJnf3+4jZwc2UmwA8iq2JrhdLA=
X-Gm-Message-State: AOJu0Yx08N5wXRehsMFU/geLXpYJ63V4eYRiKq9Fd2arcaa31u3rNV+M
	2Ct/dUsc63WdDICkREaJDDInIqRWZSKrLtnFiQeTmuYoM/XzDT7J9kF6v+jLyqU=
X-Google-Smtp-Source: AGHT+IE/j/y5f2qUnWfiTn+71OLcR7yWJzkuNM+7IYuIQEjbCYlH8eVu+L8QTLQvX4pvf8+uIELZ8w==
X-Received: by 2002:a05:6512:3b1f:b0:530:da96:a98e with SMTP id 2adb3069b0e04-532eda5e9f6mr2541274e87.2.1723666680405;
        Wed, 14 Aug 2024 13:18:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:17:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] thermal: scope/cleanup.h improvements
Date: Wed, 14 Aug 2024 22:17:46 +0200
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoQvWYC/x3NQQrCMBBG4auUWftDGoZavIq4iOnEDNQkJK0Ip
 Xc3uPw27x3UpKo0ug0HVflo05w6xstAPrr0EujSTdZYNvPIeDL8Ki7tBRE5IOVFUPYNW5T6diu
 snWZm4/0UrtQzpUrQ739xf5znD0V2dWFyAAAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IDFzF0yce2bZ/E4Xh35DH7oRTWEv0YVs3G0L/MpV6jA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDs+0tDl0eWdKGqSlDSeNHKL5J1ioJkNMvdL
 4BE0dkl3ZCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q7AAKCRDBN2bmhouD
 15e0EACOess85sYLZS4oIYYo1UnfzJfsjJkgf0ia3wZ4HcYxp7WHM9tHOOmWrL0O8FuAETuA47B
 74XgLMmQBBvhVjNmGHxvi5DJNfMYtz9eU6/K7F31FqOuL5IAML5nD10kf+O4Dypsjqtu/2qfk0Q
 v6mqBERHK10IVN0exuyqG1EDVwlGyoOB8FOs/EVGGQElkwVdud1CMamRsm2vS28X3zTOojrk5X1
 H06nLFfDGzxI6Tid0DmexP5juFpE4VR88cx7eU5kO8vdFo/E3LTM3GU5boJgfSJ088HBuLzgJRT
 1rQxY9iQwucEiBtj5L1PfhTHtM7s4oKNR+iCRqIjr7xFvGUA9H/jM1KysI33QRJU0OjSbF59fDL
 TG3W0mReod6nHjBl36vWMB/tGlKQtIjsokaNQXAqbsmochlvgsTLZcgTAkFwVK6SVliWjYw/GC3
 XVlcE5W1J8vHR9BARQrRUcvw5HFjaSzwF4NX+6jBBV9ShOsP/q/pZJj/zfEG5NrYvlfg3fY9yuT
 E5kdEvTRgAeKN6kP6xyqGr494cLk+uwWefTWgdWdYhIVxXDFyVTVHewAMvaPy9rvqB4UnaQJ1bK
 fOWPn/A94uP8aKj3lY3yVEE7qVED/5nIElAvG0E0S+5pEA95cZ5snHAUM27aV4/unulUgoLcHWf
 0AcrMoAQp1431Ig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

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
 drivers/thermal/thermal_of.c             | 60 ++++++++++----------------------
 4 files changed, 28 insertions(+), 55 deletions(-)
---
base-commit: aef749dad7ff4c301e91b21fadf30776c1495fa8
change-id: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

