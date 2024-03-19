Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1346A2943C
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Mar 2024 17:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710870630; cv=none; b=RKBucZGaCpZF8OgMv7sacDjT+t0S3eAzD+ER4kPfAOnNQxu073Je0zG3UirQ0aOqczS3qCvECFKP/KfY2GH1w0Dr4fdxCSOJM8vAAIBpmvLBvW0X/VZmXeNoXfbUZlNSRrBht53AwnRgKXewEhG0s5EHLcQg9/7FCiXOInsx/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710870630; c=relaxed/simple;
	bh=tAVWYYe9dpkSRvGr9SnXb4EgP8xnjDbkrGFp/vqltQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIwIbcbofpCTsLoZFSFNvtzBl9GzfmyGJV9ImbhIfHuvkzYYWFmwwiwkRyAlWQkOzcZlHZnEnGKVxjvkLUtkC248XB+5Y82R+sgpbchGBV/l7bfJBZE/l9udwaeFrSJWCJVCrFVzBVjMk0XHxYWjojR4pzZK7kTmP3iE/XBY8j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpPU5i1K; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpPU5i1K"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56899d9bf52so7580462a12.2
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Mar 2024 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710870627; x=1711475427; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2WVTygkXOkhQKlJ16ez8Cadly8Dz43/RCcghJb/HIc=;
        b=kpPU5i1KeVcC0C35vMkj+nvw28BCBBoxx4TWbzsO2ccSPKwg27l/aUwlLa6Krz71G5
         tF2GL9Lqg2MShv9taeetvyPt1VlgCU91YHgUT5pyuIubbPBd50/4s6ElbIyFYxcoRpBX
         KWyTRLE+vvPM8WuJBADCO6D1s/kRzm5g47aZETRRsorZftveD7AXAJmv5vuV6XLOoGXl
         Lgog2wPaCA7eAlXlRqb6WJC2W4uo3jK9/GL2Q1iC1vqKAK/wviFfxjbcVNO4LOV+0Bsm
         s3jpCAqB4/GNKngbhlL6jiAJaxgzro8d62PI6PbAuUUcHhRKVHt4JeZ/1s4xNyzqQQzJ
         np6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710870627; x=1711475427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2WVTygkXOkhQKlJ16ez8Cadly8Dz43/RCcghJb/HIc=;
        b=MiQQuqUhI4GN7d1o46W00el3+OejJD+48Us6ohytU1ncbRjeXXoqLE9K/U5eQCE4bj
         pYIOp4dV6tc233ps/t6l/11CG+3F8cgjsONGmh1R76Xe6vFfaeBknzYYD0Xkx1MTNqHj
         pK2AO05unPol1blkhrzsuRrDigj0i9e6oVIg5A+0quZ8b4lKY5ECppeJ79+j7StDJCFt
         rqA1N+RsjAAMXJ16MaDtpMi6wpZYb6CZRcClxmFICW4/wYTvSmtVYbYaSAfBbe43qqny
         w3OJda6adRbllXStlZ8g7y0F24q1eHvrVWAyENjKXfKx5J3OAREOMK3nYKAyYiKVS7OM
         f3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVSodkPR6QcY/NCb8DAXd/4QRh3q5/d6IVqIckVXUOblex4HkdgS/HzjgDxaK+IT51QTVeP1uV044sGAjqTzhhrhLNtsztCTAXpQKc=
X-Gm-Message-State: AOJu0YzSGELcY6DCH8zE7p14XpTn0sfFbtnSRVQDgKLSwTpVSce1zwvt
	88j3J4NZzIpaY5wCAMu0/Ax171L0aevlhClkNyqH8uXmRddQ4510pl3k3pfZyQC0zQ==
X-Google-Smtp-Source: AGHT+IFgw2MAXl1ekkmpg2UUcVT/D9qKd0PbxO1Yhkri6A3LPIGpySGb5iyoIzjfFbfGhaIkm4zKfg==
X-Received: by 2002:a05:6402:3983:b0:568:25f2:ed88 with SMTP id fk3-20020a056402398300b0056825f2ed88mr3078980edb.24.1710870627412;
        Tue, 19 Mar 2024 10:50:27 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id et5-20020a056402378500b0056ba8b68505sm84329edb.92.2024.03.19.10.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 10:50:27 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Date: Tue, 19 Mar 2024 18:50:23 +0100
Subject: [PATCH v4 2/3] dt-bindings: arm: sunxi: add T95 AXP313
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-add-t95-axp313-support-v4-2-6204b6d23229@gmail.com>
References: <20240319-add-t95-axp313-support-v4-0-6204b6d23229@gmail.com>
In-Reply-To: <20240319-add-t95-axp313-support-v4-0-6204b6d23229@gmail.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Kamil Kasperski <ressetkk@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

Add T95 AXP313 TV Box variant to dt-bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 09d835db6db5..6fe137605ba5 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -860,6 +860,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: T95 5G (AXP313) TV Box
+        items:
+          - const: t95,t95max-axp313
+          - const: allwinner,sun50i-h616
+
       - description: Tanix TX6
         items:
           - const: oranth,tanix-tx6

-- 
2.34.1

