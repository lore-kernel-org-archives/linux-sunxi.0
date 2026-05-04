Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61193D524D
	for <linux-sunxi@lists.linux.dev>; Mon,  4 May 2026 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906414; cv=none; b=As6Qgji5MA6b9vZ2t7D3eq1gI2uDJ/F5gWc3PD9rOcQO0bbEM/jLnMQYYjWaSThbCNkW0W5TF01M429gRZ8FIHKwp1mClqihuLbKxRAKkpV+/EC0zeHR0Q1sQYkH4dKj6CSPm090L80MyvYTCCfRArpOytTWt1cFUVhsZJwBsBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906414; c=relaxed/simple;
	bh=KsGehUIs9yjLgFhJm+ALM6CihYTUD9IxFPyF+rbn54Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V0IxY7KuykE7tIqSmGVq5U2Rd8/YPcE6m0Lk91L3kjftk8+rbqAWB0gwjzecVv/HJqqTfj9hjl7urELS57YBZN0paqPxKJvlsakLZ40qOYoz/fRfkT5UgQ+Uc7KXiCIuEgOY6Ve7KYS8o+lnQmPUX9kup7D+ygWLJN0DoisKgwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9idnJF0; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9idnJF0"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36528851d7dso703909a91.1
        for <linux-sunxi@lists.linux.dev>; Mon, 04 May 2026 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777906413; x=1778511213; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L68A0nliiu2Q3xuxzZG34RHvsW2Cqh1HButFAloiLuY=;
        b=B9idnJF0swevqx8S+Gpv+7YvZ2pJfSBs/cTfMU0tRnkhKHnjQJfarGMMVghHiZl8P8
         sOOSFFUJB3pCt95f6yHdBvfChAiftGqaDjHXkBe55WJ6YQuTo5O72dgamW7FNEU1XLa4
         WaHAJyr0ig/BC8NjLqp/zrW0Y3d3wYXNI+9chHbsifyXLj/5BdgF61+y9m4ONMTJ0HuA
         2A+fpk4jaullgWXLRN/ZVuTT6kPKJGG2mGIwjgcCxYwkpzzG8k10gUul2uFrDEUrYwso
         szg/plBJh8YYN1puOXW81JGABcD3fcFirwY2MpojAaVZItf3cqdNaabKt2B2+qION5me
         wR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906413; x=1778511213;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L68A0nliiu2Q3xuxzZG34RHvsW2Cqh1HButFAloiLuY=;
        b=XJa51vqUfe0M0IHOilH6tbd3T91kmmDy7jKOCpsk6TnXFIm3I5YK4hMtznTen58kJZ
         qZpEYT/SQ76nkGHvgEV+NzvioSBVEPBbvnMHvHS9IUECr/7d4fNl7EQmwIFGl4NO3Tu0
         RPG+WaCRpMSSlmR5RayJve0nBtD5GEod1EqhsT5LJIT4ORhDzXMvPBayz9sJkHXD/wwx
         WKlE1I87st6vLE6hYhyWXijSEJ/x4xUx/tpP3AnFc56oNwDairwFEp4t1I+69IJCDuct
         qp7G7q152j1EcFjE3JDp75z4Ttpqi3NaKQxQ7ehj8vKEQiTnjwawNi1gXSW4yVvjLINP
         avQw==
X-Forwarded-Encrypted: i=1; AFNElJ/KmpKHSIdFN/PhpzM7AZdR34u3P9q/fcloi7L5+fj+ByV5XNSxX2KU6Do9BIol3EEYtjctmv6/fcrbIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8LZjkDc6qT2biaavB2YQFgUS7cv16Y7CcP6Ondjf4mP815C2O
	A8U82g3k6LgO8RlcMX+m+hbmnJPnbrTipUaxWAZ0djTfE+D+Kv0bxncX
X-Gm-Gg: AeBDietrZylaN/AFC2JZCSyaZbqpKr3v5B727pVcB3M9Zbnkk3s00zrFRmz0U/atc9O
	BhUPWy6RM956+RU6rGl93TbEt0gvzugGhEri/u4OvuKuIk3IDcvf5C+pc8xuHDLa4kcf9OO4Yol
	MQsrdecNVGn6PR4QD0wBBxg9rHVYKr0xmweXYX8e4uBVG6TtUjq0j1E5TYKiu5bUMayMXTF8z+1
	g2dwKatZM2M4mwoAuL2ZNj7lPblK5PoZGjhovBT8OotXVgijRx/qiFc4iEhBOrdk4apBIEDja56
	RP77K1Euzg3iVLlGc634yi6fcyVxoVFwS+mQfAHIup8Fb2DK7ydXFA2nLiYJ08Nc2RjveTkH8hL
	p+ONhWgc5J2B2Dvcy/FvqPilBppiyhBotMTrhQVnew4NGYjv2GxOp/6IbSnnvxjbD9KQL2y7aqW
	2M10HfuW2IJZuy/A3TDqAZHB+y0semtFWPsII2xNAQY5tUTZuBI2g7tTCzEABG4tjlYUnNxroiQ
	M1BiBkBFCxUlExbgavne0EoNuAb3w==
X-Received: by 2002:a17:90a:d444:b0:364:6558:99be with SMTP id 98e67ed59e1d1-3650ceaab7fmr9463975a91.22.1777906412786;
        Mon, 04 May 2026 07:53:32 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbb05798sm9926085a12.0.2026.05.04.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:53:32 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 04 May 2026 22:53:26 +0800
Subject: [PATCH] pinctrl: sunxi: fix regulator leak in sunxi_pmx_request()
 error path
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-sunxi-v1-1-c0fd0df52776@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOWy+GkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMT3eLSvIpM3eSUREtDMzPDZEMLQyWg2oKi1LTMCrA50bG1tQCZt7F
 DVwAAAA==
X-Change-ID: 20260504-sunxi-cda91661c181
To: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777906408; l=1142;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=KsGehUIs9yjLgFhJm+ALM6CihYTUD9IxFPyF+rbn54Y=;
 b=HeZnzJUAEwh2zXD8lRSUzBtxzjVKqCO0BBfYZRyGOZBJ5CwDrdBrjEiQHQdwkS1QwwsLUSbpO
 6SW0IlZZ5BXCjzD1FqEQUkVaPWVJsfKl5GiXk3mGGLFIUcMtZBXaX+U
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

In the error path of sunxi_pmx_request(), the code calls
regulator_put(s_reg->regulator) to release the regulator. However,
s_reg->regulator is only assigned after a successful regulator_enable().
This causes a memory leak: the regulator obtained via regulator_get()
is never properly released when regulator_enable() fails.

Fixes: dc1445584177 ("pinctrl: sunxi: Fix and simplify pin bank regulator handling")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d3042e0c9712..25489beeb312 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -925,7 +925,7 @@ static int sunxi_pmx_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return 0;
 
 out:
-	regulator_put(s_reg->regulator);
+	regulator_put(reg);
 
 	return ret;
 }

---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260504-sunxi-cda91661c181

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

