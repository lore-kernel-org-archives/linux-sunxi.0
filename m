Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315C418787A
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 16:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086133; cv=none; b=kMd7RvtJjSTAnnjrCEJVEVgKuEbNgCLNqbekShSTNEIFdxsybKTyskBlLVJ8kBKjiyq69r4JSKxvfu/btW9NC7RdjL4PKM9LVziRxGKVvmd2PQP0sIHgSR9ZTIbBaE/hidExhl95Mkz4kiisluxFS4d/YVpL1vZ/cjv4qgA2yJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086133; c=relaxed/simple;
	bh=2N5vSF/orr/5lpFq7UMO/MLBrEUsCTaeamXg7ihD/v8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DbJr3OSv07SjMAFaobElU83Hxp/3CCNnDpGfiW0rIPUkUgfTLh1qtlyAo7LjZldBYnEXmAjLUXh6RONgI2pyeUtGWQK9XtebIGZqJye11oGmAkBowRSJXPmNmMnFNwjkmQlHk2hdBxutJGi6gd/94212Iv+2Jn2nBx4Ii5Yo+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdR31ELK; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdR31ELK"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-70968db52d0so4826903a34.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Aug 2024 09:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724086131; x=1724690931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBLcUKDVkwPFiYRJqjb28cNXraCEW6YLxwgaARvC0lA=;
        b=ZdR31ELKQgbTOKprA8hF0+/SzfOPtIjbMEkrGZBzMhkyy7srzbmPZnqwrRTCahPE5x
         TI27kfp69IucT0ZCHOtqD+UQAr6hSTqrMQuZooIUm026OjTZvOqgX3RV7tfXjXseMWZz
         7IoWEx2DUqXr1KpEb1mH0is8fefjCLG5aQ80Wk+YkiTcBPTeUxTAUctMsyKZi32VUz8t
         uJ2hD1qjPSXzkHrOYl0Z0epzHsGmgeNh/aFdp3FIqAmibRUjqaM7sAQhzu70UEYldliI
         DzBSZzr9WEVP2QQAY3IcmwnwviEr8o6tGJmgmFDZXQTqVYfmFgaoHzjDrb0jqoN5zCir
         XwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724086131; x=1724690931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBLcUKDVkwPFiYRJqjb28cNXraCEW6YLxwgaARvC0lA=;
        b=rQ8jF2sL80HBfjXrVpDlgSNqAZ59hgqwjQCa+NVCwqyK73+Aov53LqekYfE3xaIZsq
         GrOtiDxwZfxhV7Bh4BZw8wynpw9xUOBUMkxDAiL08CnMkAbNF5ndFCNrvLG2fCUBEWMZ
         YTXWb93Yyu5pU4U785tWyOel2a3Qk0vzQvO+VulrFYb7UP7FGvdMqzsR29W93+KDfyAV
         dqv8zIW9GdHTy61LV6f4WdVrpxkCgAImwin8eRzfnSpGE1yl7veWosnso1OQ9QdeHESN
         PdynEKEFkcahUgwE8dXc6NGx3O+BtF34S5VP3NgP1FyeKeJBBnqm2FXkDae6qum78jN2
         vYIw==
X-Gm-Message-State: AOJu0Yw5Fy9qDGvclbe7r7HcuJMKKo6SNA/ja5Mf7pRYNvMP/WCwiP1g
	RshIY6DpyEfqKdaEU83aX1EmK3D9sZ5h030QAzVQDUzFihQogeHlVs9Rlg==
X-Google-Smtp-Source: AGHT+IHClbSOtCizxu1DG+0TB0TXivck4+Ecm64YXTso2ATTPsQvJwx6/bvdNWCmxd6MYlrtFa74pQ==
X-Received: by 2002:a05:6830:6787:b0:709:35ae:e793 with SMTP id 46e09a7af769-70cac8c1e30mr13425508a34.33.1724086131001;
        Mon, 19 Aug 2024 09:48:51 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70ca649c61csm2332428a34.26.2024.08.19.09.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 09:48:50 -0700 (PDT)
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
	jonathan.cameron@huawei.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 10/15] dt-bindings: power: supply: axp20x: Add AXP717 compatible
Date: Mon, 19 Aug 2024 11:46:14 -0500
Message-Id: <20240819164619.556309-11-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819164619.556309-1-macroalpha82@gmail.com>
References: <20240819164619.556309-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add binding information for AXP717.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

