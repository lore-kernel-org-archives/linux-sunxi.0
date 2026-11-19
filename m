Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111761;
	b=wm04lyd3PzwDFtvoP4rQmY7+e14+p819tyOR17ZPEiHUB4EDREF2DJ9zxcZmIvOO7Dqh
	 mZJylv5skTjqPGRXRQFGdocgb+SlB0k1NExc1OQgT9/cTNrDETXiMBWM9+0kFjMBaBDA/
	 J2RPcllpczhdsmkEZwLMPPAX4+jlUDrPT8mVot/xlE3ntp8wa2100oKZEz8ouqEb+++c0
	 bTbfRpTwUulKiM/K26sIzQ7bUb3xfv/Z+Tuv5L48GUO6w0INbwv71njYB7T1daBNu/gEt
	 vNU6GQFRTytXi+k8ccAVoJko/fBQdyYM3vZapyh+JwJh8Be14tBocVHP4TXkeAfJfLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
	b=Ri636KkZhJSrpb9v3J5C6PWcDJeChbMuoEukdVD5xvND38S8t9Y7jjSGK46k8FW18Pdf
	 oi+xro72X+7qgLyyIgP3dvrClUGcXgF56+YtZEOwLNXE+Ovcht4d0IkM55cUhFWo16skD
	 pVC1NU71U3Ln0wuo58mZTT1k01WL6uumTNX1o2vI5OTgr7kiZIRzaQJEP9Gd6u3BxS/8/
	 epAPYeLu5ldjfU5+fw5mw5LVOOcxjY8NS0ApPt8Xthr8fSnZo7fT8V2fAxBRHbcLGy7Zh
	 wzbhUI1Z0GLoiuaFPpUR88+nC6WoTGJ6ZCFELXMt2puHFddlSSCOS3fdkFsKuIwzRGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a5RjtdRh;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABAB606A32C
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 18:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ABAB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a5RjtdRh
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-483d290f398so75657fac.2
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 10:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111759; x=1795716559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
        b=a5RjtdRhq7ZT/UtFHXP671HnYOaVQH9QxrKRR7W6yBMpPNTj3Wn3ogYAGy/qAaXQJ6
         bui25KzxrNBy4K9nMGLFrRDAARU/AEyaKGC71f/UOU4+BJWtRdoIoLZEgOBh69t5TxG0
         j+xg2utzl4YDwR4tN/FDY9HrLILAHRpVK00cLaxHV6YhlvAAHznL3dRo6j8KT7bpdFdk
         A6Af8RSv65ZBK5IwzqMUkJolkR4U06GeMNVWvo8iq4xBRhrfvY8t35ufe8HWCHWLj5xy
         bUo6rBNGWhE0XlcVuIvg/v6xp+MZXNZ3Tm0DnMKOaAJDgDEEafyJIASWtmsgouLhlORp
         Ay9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111759; x=1795716559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOVBVa60ho+IN7XJrgnUZTlBuh8nHgelO4SekyzIQAk=;
        b=F3rId6wzNZBrpP1MeCWzjHAroRu2T02CWE0gnc0KYrTGEPXtOOSSSd9T6GLQcslr52
         iwdj5nSAULEBoDSmUgWV6voubUgUil8JH23zubLIfv2FbRURGYDAPTX+Uup3FhFNpefm
         ZUffZO3qQX2Btq9rgv1BJvNCGtGcshqle95+cWadBgMceet3Tap8wMymzgEOol9QviJb
         EXHNhGYJowUJYywNV870Ak1zSC2hitNgdZWY7O0l6bTG/hSF6GQEsBMvRLmyjcUaUf0Q
         0yoXpk4qaRyeU/F6uv45NJXFwXx+/qgV+HDAvDlp2ozZb3vExdUFcGWxv75ELXEU/4j/
         Spyg==
X-Forwarded-Encrypted: i=1; AL+hErEwk0Qo3UAvtS4G68s/iX9hzjYsahIXM8U/mQQ02TioeziZtrXzydKRQRg6gpu5dtIv0HMjNxbN4hn47g==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MFz3rFWG4qin1OdG9tyv7tgJHE5KdnldtshL8/DOIsFc0heC9
	inpnJ5e2Wuz0KnkEJH4ftkRGP//TA5U+8ckbpofCp6eswj3NcY4Ya019
X-Gm-Gg: AYBFou24UpJWHslYgzcNyrb+SrXJGLsBZwH4fCIMdsCC7iy4csCiFjPGeoaBtLc0Ot1
	B2XkSdzoOQwjeMXnZefIs4plA/gxrz/YwHi99jfhFfBKVKXbka7jH2I5RDe3qyTltIW1/yeVBIV
	2Zw53R29N6BII0R5H2cac55xYhndtUUxHIYjQ1ZVsrj4ctXJzIqouMD286ZmGWuclm2T8Fs3ClN
	HZdkIPTnl3XmZBmyVn8EacXNRzd9NXlwjOI33ZOuZx+0mnBG4ajz+Y5V14hbuAZYb1XI4deiuJl
	shctLBf3XcAYOrNDeeWRixVqCUPa3rxxfPQNyOVIhYX+iiuhq8hgnUvumJQ1sN4JeTHGjnowkgf
	/XmXsoh5dtL4CftfuBiafTTkMyqT2WcsKSTTN+GXqlgREpNN52QkC5KeLUFacrcB4Md1CxmzuQq
	YJMoEnP13Gw9cJLv78bC79WJ6yZ6fwEl1hDNqoA8hNBHCTcxuRQkgDM7YRfvJYEVggswWq5Ksqc
	LxblDijISVGHpBcal57t9asB53d3FnZuanF5jXGv3IFGSl7pW2VihWff4UjLt4Xhu95+ArP73Mv
	Z77QjlmtNghjsJD7flbnHIFQdLW7rwiv9RkPRUk4YrjBa6ghtuYkekGtHGmfJmsnqk4r9T5Xkq/
	3
X-Received: by 2002:a05:6808:3193:b0:4dd:18c7:544d with SMTP id 5614622812f47-57a0ae276b6mr796447b6e.31.1795111759288;
        Thu, 19 Nov 2026 10:09:19 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a350548ffsm92701b6e.11.2026.11.19.10.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:18 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Thu, 19 Nov 2026 13:09:17 -0500
Message-ID: <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795034153.git.enzo.adriano.code@gmail.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
for the accompanying initial board device tree, so it can be identified
and validated.

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..d32689b7113d 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
