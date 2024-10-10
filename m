Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A53C19D891
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 18:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728583596; cv=none; b=cmYdkzBoC11rDigTxweZfO+Mn2sYwlbx69JKP3Zu/Qp/db9gHMmoxWDLJxnyWbToonnGTYcj18zXQYtI0bcrg1GMoLFOQEuxpHviBouAMOcBK75QUWEc6qLjAEoeuwXUILAheQphuL1nQsxsOP7BBJTehWaNoOaFYykIdoQsUyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728583596; c=relaxed/simple;
	bh=6/5CsTtyk8qtgKNWYxi/reJinJ1vnuHa20F1dTWzvi8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m36B8ETpwjFDH5zHbI3Rxts6wK62BEwxMOHNwa/mwPAoj2DrbvuhuQL57tBie10A2K2eSaxhwLsE75zeh7UkDqS41nV5GnnvjorozigavrASD2p729NyCkr8znNSDf0H+It0HN5YmY0G8FvgS35tgsS6Bzs8P3VlAyCrUCISTMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DKLn3LTf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKLn3LTf"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9950106e3aso13484266b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Oct 2024 11:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728583592; x=1729188392; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dh9jzHed4iHtpNT+mC29RrRHw87Tek3l7JegVCBCiTc=;
        b=DKLn3LTfXr4Jzr7klKhVE0MEPEHF/+s8rnmDhtjGVWOFf0Cyv2Aqfu4ei7LamJdWj9
         Jgs8h3gyBHox3e1YzCDumaLfFZtLu+06ejzu/RVbFMPR8OinVM5yBbeCywJ6urFoANLD
         4FND4gwF/+Qr1sFadWwOgpRIETBO3nMy2Z7kJ41a29MC95abaump2DzQgqIsXTIEjT3l
         R53/fcpWVC2ksvSjtHd+T+qt6FQQe8I+aVO6871e0NBfBXSZMonD662TaQp9EzhTQWRL
         774BHBEtYL1SJgsCU7METzsQOwantre6AIcph9oe2gzUZo7HiNV+wKGFcNWu8c64vlAu
         k7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728583592; x=1729188392;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh9jzHed4iHtpNT+mC29RrRHw87Tek3l7JegVCBCiTc=;
        b=P+crim+e7TR9ZoFoKcPAsfIxknSfeDyo0eEJzh1/bsCRiJ67j0c6191Zuk1zWqsUhl
         eHjeaJiGVU/Ap5cF4Q+mPnekE5sqyeROL9RYrF7XBC9c/mzfpfZgUrnrboDIpkMOxiJg
         SK7y9WYdmY/z1KQ3pAe1b8XPz1graUJhwuG1u4DMUT97gt7HmRpV1cpNTGUey5tuOsgn
         b9K3DLMq5J3yXAvKi5hcWgog33RDl+z9MltNC2W36+tZNfyTZDiCdRxsL95mRKLmCs17
         iLCaL4Zsz+9qSSMjk6lyy7IXJkc+WerPUXLh0S35w8Ad/cOnK3vdYjb/r8QHrG32ATMB
         wKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKGsh8Koym9NGn4fqgH5SPdapSkHcC96/qxomi+pdWcmN3CadQq/LNXK3r0Dl5UZy7HsNWzaqXZqLwww==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGtAbQ4ZGvC7d8xenKenSYtjbInjLO3GmjGkXPJKj2AczZRNb6
	C1sfaNEHX6CtBeVbQj7E75L8IHcSExrFhTVHKYI9OY/maGJ9ae8FlBR9AvvdpCdC+1LEgTUm3/N
	B
X-Google-Smtp-Source: AGHT+IH/q1rHxvsZeQmLwazysGoC8juCGw68dQcOWNtm8WqXVECTje8OvwIdl4Y4sFrXwSXOeWUKVQ==
X-Received: by 2002:a17:907:72c7:b0:a8d:2623:dd17 with SMTP id a640c23a62f3a-a998d330186mr252167366b.12.1728583592409;
        Thu, 10 Oct 2024 11:06:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a80c1b8asm119757966b.116.2024.10.10.11.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:06:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 0/6] thermal: scope/cleanup.h improvements
Date: Thu, 10 Oct 2024 20:06:16 +0200
Message-Id: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgXCGcC/5XNy27CMBCF4VdBXneQZ2JihxXvgbpwnTGxlNqRc
 1ErlHevyaICsYHlfxbfuYqRc+BRHHdXkXkJY0ixhPrYCdfZeGEIbWlBkpQ0qOBLgevZxnmADpK
 HmFqGYZ5g6jh/2x6IaqOUdK72WhRmyOzDz3Zx/izdhXFK+Xd7XPC2voEvCBK0xcogY02aT32IN
 qd9yhdx0xe6F+sXRCqiY268U41U2jyJ1b+IUpoXxKqIhg5IVDXGa3wQ13X9AzMRbRR1AQAA
X-Change-ID: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7
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
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1960;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6/5CsTtyk8qtgKNWYxi/reJinJ1vnuHa20F1dTWzvi8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCBecegjeWQzb4Wc3laTEoQi3P+jonW7yoXgKr
 +TB1cu12a+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwgXnAAKCRDBN2bmhouD
 1zYXD/9d658iajlkuA112erKf0/OWS5ZPlV8YRK8ApQxwvDX8eNX7zrw523JpvHOZ2DE18Bg/au
 KoLleXvg3uZEdBmoCtnq0dC1YFqb9rwpuV+vmfZIJcRz7c1X814BDf8+c0vgoxtyhljZSeU+iIH
 POWEvuw67FX4F9mzGCHo+3C25jPDuu19AFRn00BW6UXTr7++go/YVgdQ+zQoNyKWV5aOJAlgx02
 HfmWsKK9CaW4biER+OqXEeIqLfIbTGoyC1ZJMsyjvifWNOEMedG4RIaqAxj45wyVxg0Dz4SIyMY
 ZRPUy2BjO/wthtglxFmiGsT4jaYqhcVHE+JvdzK9ZVAoQxvPZYJp8vGF08CwpNhwm07uxZDvCkg
 OnrlO3qm4MUJE3/dzbOQi0AVjlhBH3ngx2cXYr0/fvRhz0DHzd8bG4oCEbsOePN0/3QA+u3T8mi
 gfwUB1cF/tSrx9/DXwI2Dj72tPGwDPr7Eaf/6pu3SkK9ROCGkSTZwndQfEDySVemhuVD5LXKSd6
 AaRdwhMi8pkZiqMqOc+UdWAP16mlGiVLZTOxwZQFKoGMl1cSM/+atj9Aoebvv4CUb8uR3hxvy2D
 YdeD9KSNebbSbSd+P0ba3BvsP74nPgZAze4TQIagMq3dCkWb4hYAqlhajfSXgVYK8/pdiEnE0CO
 9Cg4BN6G1tcTEhg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Changes in v4:
- Patch 2: rewrite, significant change: kzalloc() also with
  scoped-handling so the entire error handling could be removed.
  Due to above, drop review-tags (Chen-Yu, Jonathan).
- Add Rb tags for other patches.
- Link to v3: https://lore.kernel.org/r/20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org

Changes in v3:
- Rebase, because there was bigger rework in thermal code.
  This made two patches obsolete, but brought new one:
  1/6: thermal: of: Simplify thermal_of_should_bind with scoped for each OF child
- Link to v2: https://lore.kernel.org/r/20240816-b4-cleanup-h-of-node-put-thermal-v2-0-cee9fc490478@linaro.org

Changes in v2:
- Drop left-over of_node_put in regular exit path (Chen-Yu)
- Link to v1: https://lore.kernel.org/r/20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org

Few code simplifications with scope/cleanup.h.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      thermal: of: Simplify thermal_of_should_bind with scoped for each OF child
      thermal: of: Use scoped memory and OF handling to simplify thermal_of_trips_init()
      thermal: of: Use scoped device node handling to simplify of_thermal_zone_find()
      thermal: qcom-spmi-adc-tm5: Simplify with scoped for each OF child loop
      thermal: tegra: Simplify with scoped for each OF child loop
      thermal: sun8i: Use scoped device node handling to simplify error paths

 drivers/thermal/qcom/qcom-spmi-adc-tm5.c |  7 ++---
 drivers/thermal/sun8i_thermal.c          | 11 +++----
 drivers/thermal/tegra/soctherm.c         |  5 ++-
 drivers/thermal/thermal_of.c             | 54 ++++++++++----------------------
 4 files changed, 25 insertions(+), 52 deletions(-)
---
base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
change-id: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

