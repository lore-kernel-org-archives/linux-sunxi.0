Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818468;
	b=CTZs2sLWFZydb86GFDC9bbSBKUs2WH1QrT+On9t3oJC+3FXwxYTLnIbhGxSLIU/YbfDy
	 KtAO9muDDulgH/0M3pWx5PqVbtc05+0z1ooPRBo+gMYIHLcGedZaxeQvZhMZCz3TlfFYY
	 g93Q+McCoVF8l7P02cglyr/nHGMfuVy0dzeU9AIydVo0vXcWjMMvyV00HnovcEsiBcIyp
	 ANay1HY40G2O0bEUsDooeYuONlZTv1NMiUFXBlh/5bQXVKIrsY26cljmY6JWThgqCrCrk
	 M/rOf2GOboxCS6Efa83sw7X8L8+2adcquJl+g7SgPiXctTyFNULPnLzFUyFfQ17oZVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
	b=gvrvZXOma/Bfd65IMiHpLpX9c0uNb0j7GF6y/U+IaUrLy/tL+X1HDwo0QNnN8VLKpluj
	 6e/Iu+FtWNCsY6xsMLAGpiuUERqKmynfEvxH74rUWAz6n9NZcAsA0EeVtCUPcGF6YgE58
	 2waAs14Fb+VmEMFY3tW6fiUL82vEIGxJKUUHCsggaziLWHtNkfdx2orbhuRJ8RGMFSCrq
	 fEdqhVGYjXEzhG/GF5t6pR7/MIPscd/6hnvKPGhc0JYi6pi09TuC73+w33WjR8c/htI6T
	 kWhiECfEdOBBSfHBExZmTR5jlmfbWYZIfPN9jT6aZDNC19cbEGpHCMF57jR3SdNGdkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLuO4kYp;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4980C606D828
	for <linux-sunxi@lists.linux.dev>; Wed,  4 Nov 2026 18:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4980C606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DLuO4kYp
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so8838345e9.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Nov 2026 10:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818467; x=1794423267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
        b=DLuO4kYpWbc1WIr/QDd9w3QhGIvra45h3LuY4huXpZq281rbWHaLkoICyF8lO/ElZP
         jhJDtrMpewT7jyQNwTeo1zJSLXF6ZNtikXyNg4MVBISrE9t+z15AYbL02e66zxVOl28x
         mugCQ/NNSepVO64w8A9CIiCIOpWlUv6BR9wTZC/GVlvGEGWxT8s0rE/Ai4ay3mz/gDTZ
         z5fMn33JmVaYY/T1OkQ1r/3GPHkG/5k16ES4QLcr+FOU+Tvrv1mUYY46uAyn55BEGhq9
         B/cOSp6EgQ+yimhO+J3+Gpfj1CD03FLWCKVOFXjUgEy+738OzFjHPIIdBM5xKsxHyUdr
         BBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818467; x=1794423267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
        b=vP2skYylFIBTlwZ/CE/oT4vpNP3hzaHyJ3Z1qQBJm7cyb1gKnVsEM2qKCuGtrVWCNX
         3vAm3pgmOe2XLlN325gfkyFkcaGw3iVppeK/DF+nhvczgfCHL/J+lm0tXKxu2xrkR084
         q8k4nzAtLXTEToc2mv/kud8Ou+WmiZ2QsL7KE4aaMPbHWCC/GawTEYoHwztXJKD/dRM3
         cx48myOqF6xdvWQsJT7i3R/dHFXas0An+yCCk+9jqKDhPPGGw7KY8hsLKHo1ejT8jtc2
         D5dtd//VYF2+dfwbnVyOyCoaehUqiJTErAruc/IMCAooiYlb22ta2PDtLm1uv2YI8Nqc
         ugMw==
X-Forwarded-Encrypted: i=1; AKwUvBxjeVLN0qAi4E/QmYzs8vjcKHF65Z0uELFQS+X+J4fL+weJ+toMMxyImrY/L3ZTfdL81M+IxVpHhqUwlA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/t3Y8Nkepk0hScYl9tDWlLfvAXHwo3EBOYztftgO/X4F5Y6vBT
	iUwSbPnuv6XsrFBi6rtaghwOZWEbrP84bd42fWFedluqFFd8zbYcwO69WTyQaA==
X-Gm-Gg: AYBFou1dUUlVIMKbuwO6kGBaRjxLBDwW8KUtxnNVedGXb63NEOQGN2GSBYsS7tDjFlM
	uflGh5C4qOWD2o1Ee2JOhbnx5Z7aVyzjVJk5LIVojV4HF7tA1se53nIJpHgGI9AYXUxR8Ti5Quh
	UhDFTEmN7NUbu6sGrI8FfCjQ/UhjQvP/xi/GoEJVZmbKGaCCJdQ3QMRSSIXtr+1x3AqiPDUN3Bx
	0Q9q9AwGmxLWfnkpLz/xPSwidXqNPU+nNF2g68PesULFtlGgh4eQUDb0kK5rQDD9wcYHkiVcD6U
	ezRb77dXAGW7Sh7uPf5KPZOfjSIxljPBwhYNlyLK+HIsqk3hVHrJyxLOoqyYss5cCHysttqJA5h
	K5EoJggodsGLO3PBqWSjSYmGCvzm8eOgD2vCZyMJ47ZrIdboxufDAn3hTWhhiwYm4qpEo9+KZxF
	NK7O7yhNY/ydcWR4GB4SKMjeZrrvdbt/jy8oceR4bTPQMc9as0QyeF8qO2ECEU3YygM/PgpipKn
	KsQsYCcWXiP+My2xImUvL419FBB6sKhpNZwmzBr6qVzSRNdit0Rxdt5xrbDjfOq3MoeD2hNuYuB
	SrBIdO8SZ0dZt0qIoI1t//yHYaQRKnz76RZU+etqE2PGmhCrm6sFnAfg4I+j0UOdjb5X+KebSiY
	7s2VGQE4F2Ul1r/BTw1IH3M780dDQcDv3XOBDRMFcd/uJLM513mssSaVKr1LW8Uv+6aBZD51ol3
	mrdcCthyMdOUmSswclP49pOyroNCcCLdC4Uj8JDTfGUg7Ei2IJVO1sLRTf3YoHFmujaSs5qVEk7
	hR7uKIRV3nC/+6E1msNgAR7wwxWCw5JWaTBxFGVTw4jpZO2HQyqRFQhsSigAWXHKQ==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr378666935e9.18.1793818466426;
        Wed, 04 Nov 2026 10:54:26 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm4687805e9.11.2026.11.04.10.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:54:25 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] arm64: dts: allwinner: h616: Add CPU cooling map
Date: Wed,  4 Nov 2026 19:54:21 +0100
Message-ID: <20261104185421.883883-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The CPU thermal zone has passive trip points, but no cooling map, so
nothing throttles the CPUs and only the critical trip point ever acts,
by shutting the system down. Throttle the CPUs above the 70 C trip
point.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..e4e0b999473e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -1105,6 +1105,16 @@ cpu_critical: cpu-trip-2 {
 					hysteresis = <0>;
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_target>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-thermal {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

