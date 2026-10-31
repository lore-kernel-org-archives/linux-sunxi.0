Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413616;
	b=5Llw6WEsSdxHA8bvTmyHI9/dgPjgLLZKiWP9unpSCzzvu3YQa/Dvdd7nWsFPr1yzJzQL
	 yMaOGoPVrsyDVPpoEnGO00v9FjCLzHUhD4ZiuCHWKJNY8EAZeBGBQLXAT17RNKOiCz9P2
	 2Cm9bPi6aBao/h9E0KF5ORh9bDPDVKXBMORZUQFF/WSLX9GJ4U4TACXi7FIISRZTV3CTb
	 aKIyS3JjfaMgxbxxe/fTjk/peGKQIptqvIjs/vl91h/2/gijmpACFK9bOvJknsSrWat8X
	 3onnM/Ph7rxdEacleUiegifebGUQUV4cte2D6/lws/Zi0dWI8bHVzV8w1NlLIbxodNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=stB9kg0N4iVwbYU1Vpadf+RiN7a5gAm9T0FHY86FB1o=;
	b=tqD8WppnLl3MBl/bZRgAMmS5OqtqVllIO98/5pgoXvInTvI01m+GA4FGghwkmOG17omY
	 eyBoTjdwVf9pDIvbMMgWRTOYqs+PbDTfsIaK2Ve2ioZsqzP8TlEtyfefI9RHvLlRTT/7J
	 HX7fDA8osYF0APzw2GSQ8MRJe7RjQF9onAyfId8uh8CC4Knsa1DhUYMMas+Q5FDA4q4Wb
	 iVxzDbiFkclQ6/vmHR1aXAUK0ERRa8abABasYkw9pqegS0/EpuBA/ZdxaAnovRub6hwTR
	 YfnPVRbeGvnLJ7z2arWCvTM0DHWqLkeDBLROaKBwcFuJKlIPHxIq/6Iala5eh6ApfBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZquZqNB;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21CB606A322
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 02:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E21CB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZquZqNB
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8470d7d430fso547021a34.3
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 19:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413615; x=1794018415; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stB9kg0N4iVwbYU1Vpadf+RiN7a5gAm9T0FHY86FB1o=;
        b=nZquZqNB0hlHDEdoCBfEFhXPrQLNc3+Y6Sl+TvPZJQdJcqHGXq7LlqqMpQdkTpzd/4
         DmtVQaRHVBiGUCjtcskRjV35Al0o2OKd7jC1Z9ONR8SudAxdcE8hIlAvBDkrczd7Izyn
         d7MthyPmywoH9gmfushjGqG20i29bzUhePo6OXEVarMtxBWcaflL1hSVwZHorKsdFulj
         RX4NmQb7nIblhFRym+Y5LbGZmwXyVrqZqUQfNtFfVf10tiUFhY62XOy5pIVVtTOYuyZK
         FrEhirPed1Rv1rxU8b1ji/bZliXWmfcvO3o1MypgcJOmv6c5McXFdN5/Qubu/IMBOrn5
         OVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413615; x=1794018415;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stB9kg0N4iVwbYU1Vpadf+RiN7a5gAm9T0FHY86FB1o=;
        b=hdHTDExlaqmrdmLbuKV5oneEf9+8ORM6xu8fkMJ1CIn0zuOc5pjkRCyW2EWIHFOOze
         Ta4IGUYPFsO2acV2aa71UP9Qbyxz+LZZEm0CPfXfFkpnlC93FddLeiJvcPvT5+fr+tf1
         LYnufUmdnGquTTuY8DJkd9T3tcG37V4eWIShXHLTScJhPDPnZ1Z5qucNcv0VipyF1E98
         fVzYs5bMq3WVg8Ij8qDmf7DoHfHwJTW78VGjUrsfSAYDjSjhCeX2OTX3Lqcrwr9WgekX
         ccRnOpoYLFnp5fx3fa95zmy1+NgJJxuWjQrV9rlkH3Nilpi2XPxXhH68no46KqgFP5+H
         l//Q==
X-Forwarded-Encrypted: i=1; AKwUvByJCz2ZYHKLkSvWlSlOOg9yooR8oOJnCml2sT6ePy36jot7EYGIEiLOMs+t43t6TJFDoodsYtQ/Knv1rg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKtCfh6a71Ihs4CvsNVFrAjX8NcPldlhfo1pd1zu8DkAvvH3prj
	G29sVaqhmigIzXp8hzZ/37Pl4yjEsfcE9AFoeAkA43OIJxpLpWK07tlD
X-Gm-Gg: AYBFou0tvG28f/SgwPleVd0bvCecJVlgT4aKwWNWg1GbAAJgqWKrUMvWvE2LBxAzvWc
	Hz2M68SN1ZlW3C83JM4tSDpxvpgS+Y57wkzyXXj1GZcZJdO/GFws5Md0XSBsUCPoZ0xEglqK0RY
	7solOI8n2cvq2BoY+krnqqPUY/AQ69eTf7HYW5w39mT78nMBW/3q1ajWLM7uen2s/eJmSJUY2AH
	Ph6cPyr4/U1b1qpQNhkq6VfnGv/mrTz2HTtI4o+PCj1ojPwI3w8XqcqfEjlmF48IqF/HaTO3KcP
	ouCd86T1SsR9Gtsi/y5pY90d3Y1yWoTNUj6yyF2yCIV0gduFIiGhqPLeqaWLvA5QK5WRKMhGpZK
	w1qAtuQUM4t6PmxENMT61oMr9PtebAYbSYXRizTOnNY7ZFo69GA6wVH0pNZfxRHXdYpw6vjPlPY
	N1/GaflgbA/2IZ4tpT3XwesW6pgPs7r1jthk+5alkEJK7HUI8IuDe9Q/OaXODWWXK1+mFHWUY4E
	Kl0dbDlcfPzMEPM+kcLW5l/2JsFsEbHGDM1ZNyoqQ4EC/gVYiQ6jSp55Sqbxx2axwDbzrKn8Qjy
	2Cto21Dlvj+6LffS7aamLUmF1EClVAXZS3kj5rquqwzOnjs8NUzlUX3O2OQHBBMfRrakM3UOD4m
	RnGg5cQ==
X-Received: by 2002:a05:6870:8101:b0:491:88f1:f3aa with SMTP id 586e51a60fabf-4a9076a4e0dmr2895056fac.26.1793413614745;
        Fri, 30 Oct 2026 19:26:54 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92196a7b7sm1528358fac.8.2026.10.30.19.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:54 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Fri, 30 Oct 2026 22:26:52 -0400
Message-ID: <20261031020640-263f7b05-a7s-dt-v2-1@gmail.com>
In-Reply-To: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
References: <20261031020640-263f7b05-a7s-dt-v2-0@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Document the Radxa Cubie A7S board compatible together with the
Allwinner A733 SoC compatible.

The binding hunk is unchanged since v1; only its base offset moved.

AI assistance: Codex:gpt-6-astra.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01bf26063777c97b14dd27851dff02..37a7d713ac71691e33453159592be31194b974af 100644
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

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
prerequisite-patch-id: e27ef0b1e3a7fc0a659a1a82c1a7184665451265
prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
prerequisite-patch-id: a733e6bbf6de77dd9f260e65912894fd4d97aa78
prerequisite-patch-id: 2bc04cc14b2b271fb6aa55f78351e523cd81d1e1
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
prerequisite-patch-id: 9abb4ef3faa58b35d636626e69b4b66ed4b04cbf
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
prerequisite-patch-id: cf6d9a8d3f2089f59a8a5afb4cc9375d7a6dc482
prerequisite-patch-id: a42183a0bb2ac1f94f7e040c125ca270cf77c44f
prerequisite-patch-id: 2f5645c9f307df3edfcc73dafc4dffc78c607df2
-- 
2.53.0

