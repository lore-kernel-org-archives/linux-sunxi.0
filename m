Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323361547ED
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Aug 2024 19:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626580; cv=none; b=O84iDWyKYScBuaEnnIE9ZSsphlnDidzBiuCkvPQxKu2f+9DS4yQPxMr/LcNIt8TnchVm2pFdczy9NLvA/tJ7viUlkzSe8SYqBOD91YSmDSN8jNyQ2Xw89Z2l4ggDv0omyRWjY7pVHtMWfDDi1Exrgjc5e5Gw3qIgSEtuC3IQ3HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626580; c=relaxed/simple;
	bh=PT/vxQ1i1ejBxEgqMlyynIZyktqms6YX4zyHBodMnNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uKtEkxyJC+2v6N3HrScm70djVP6OdHx+i2fVyVnTjGsbFDmaVRtX95tnR22pRMDWIMBEDIT/+/4d7qrtRiVkXryUXf65SxmygFf4v/qczzH0oVu9aQ/6c2tnU6O5ctTWb8MBJq7LTJJz6ykbY3ABh+ZzxIGZYt6C2sx0e9GSU/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxtH6K8v; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxtH6K8v"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db1e21b0e4so5605066b6e.2
        for <linux-sunxi@lists.linux.dev>; Fri, 02 Aug 2024 12:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722626578; x=1723231378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPAj4Da4Sc7bnXXwUyVabTlnCi/GTfWEK2sStHPGzeE=;
        b=TxtH6K8vh1Hce7tvH5XaDrkyl8W0sAwMmgp9/dJ10j2eIJRfw2pxI/EVJZuWKKYZPP
         NF8ubfinBXf+KlNDJ7g7FwIqTE3tbltEY5ByaZy/ZlZ4hHaScIz0uvMBCnZvtlimLXRx
         gOJZisJ+A0U5QWgs9YQUiOZ33Z83lJNS0SGir14QH3nu18yB/E0e1cPR1NKzGbEFyIsu
         p0+nr+wYYPWht5BpF7XCrgHOOljzFDxRxkHkCpW/+VNcIHwV6ZNvwh//npE11xCrS5P2
         RYHVUJHkNSPW+88aqAeM2ZHx6B8dFLS8nvC1+XR9mplaS/dTOIAztp5s9F5gly7H3xae
         mwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626578; x=1723231378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPAj4Da4Sc7bnXXwUyVabTlnCi/GTfWEK2sStHPGzeE=;
        b=RTYQBICIh6il8vg6iStGO0CSlHdHSu1tkZVlozHiteOOezdwKZ7izMJM3GsNl363uV
         ERNNqZ3kBEuNXxsXgw5fxP9W8LFOHwZlF5K3HYbeLSd/W0VYn2tof59o3quTbYuPanAF
         ciUBxbu8xur518pp5txuhthFPnFLmEGQdsGg3tpgqaPXupL+ZU/e5sZMnZID4ijHKGA1
         zswwsDhUrWRnmvRQT9lUPYGDjAOhd+tuVFM+5OC+CWdrPdNfmpDHfeea/cBcs71Vq0pv
         Qv5Sa9cO4T0K8UaFwyQM9rnCyqXOMRFRSiu2Oot5xk8GL5Y46yl6UgjkCnM2pC/8dUUQ
         nDMg==
X-Gm-Message-State: AOJu0Yxq1Q3w98bzoKtyLc3Rclz/DvVghQh6c6DE1ewXfebZ1fuZBk5D
	gDbaF7TXb3isZt3f+6CqLYNcmK4ysKukzd2OghK3irXynuH0j6xA//SJPQ==
X-Google-Smtp-Source: AGHT+IH5FX5N0fvUR4u9IMiWOV2xMdXKwvmYk5UzTJWm8zGmj2cVf45I4G7jUboGD0xL+cSlMeMroQ==
X-Received: by 2002:a05:6808:30a6:b0:3da:b335:538e with SMTP id 5614622812f47-3db557f8800mr5227348b6e.8.1722626578200;
        Fri, 02 Aug 2024 12:22:58 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3db563b7065sm584592b6e.46.2024.08.02.12.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 12:22:57 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	quentin.schulz@free-electrons.com,
	mripard@kernel.org,
	tgamblin@baylibre.com,
	aidanmacdonald.0x0@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	sre@kernel.org,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lars@metafoo.de,
	jic23@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 10/15] dt-bindings: power: supply: axp20x: Add AXP717 compatible
Date: Fri,  2 Aug 2024 14:20:21 -0500
Message-Id: <20240802192026.446344-11-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802192026.446344-1-macroalpha82@gmail.com>
References: <20240802192026.446344-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add binding information for AXP717.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../power/supply/x-powers,axp20x-battery-power-supply.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
index f196bf70b248..5ccd375eb294 100644
--- a/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
+++ b/Documentation/devicetree/bindings/power/supply/x-powers,axp20x-battery-power-supply.yaml
@@ -23,6 +23,7 @@ properties:
       - const: x-powers,axp202-battery-power-supply
       - const: x-powers,axp209-battery-power-supply
       - const: x-powers,axp221-battery-power-supply
+      - const: x-powers,axp717-battery-power-supply
       - items:
           - const: x-powers,axp803-battery-power-supply
           - const: x-powers,axp813-battery-power-supply
-- 
2.34.1

