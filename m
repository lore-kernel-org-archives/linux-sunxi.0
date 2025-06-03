Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A99B231830
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Jun 2025 11:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951857; cv=none; b=BehidOjHH9QQHcIsSgjqWHK6P12mW9/o40dtuUip2E5DcyL3hrr3eztCLaJOSh6N3GWlvVDkhSOhYkA/4E+/dxifAwj4OzhuxM1IRv9eEOf5X4CiNjwH+/J1So8iOQe27uVSs9iftcrit5+eAxUYLw/NidnQRX/hxo9pU73lBQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951857; c=relaxed/simple;
	bh=H+6vQ8kkEeYZu8N/t6R0JhPBnLddxAjO0+PqCquNCao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2lz5/rhKuhTu5t2ohnSofwmjpPwRKmllOJTPwpncDbxfnO/ramYFwDOIpsZUyiUK9UYBvj8oY+cNV/n5fU+gSUB7vhfHr/jNmGP+TllP5cmx0qGFVvEH+Mn7u5V+wyjd3GbqJGHRngqOZtOllj2mGbCIKqrG7tQ+wi7x4JxbmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wGMG+BvV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wGMG+BvV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-44ff4081975so2164405e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Jun 2025 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951853; x=1749556653; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AkhPqPyokGiCNL8dfKTXdO+jBSmWZLLyi7+WMgDPG7A=;
        b=wGMG+BvV4uL44bO9nUzgEL3Aiun0ngNSzKJxfM7xNMIYxXBu8EED8049pAQP63rzWU
         NPuH8Ze7BjhhY4WXRZ5ns2HRdKBdeT0JC90BS5XzdcayxyFnN/AmdLxXI7X3cmzweCt0
         tGX/PkDlOx11hNc/QLjGI22OLrSLug5MIrGCr36FZZM/PsKYFyW4uWepukDy1ei1SuW/
         BeU6zeQqwERCoyqQmB33v3CAOrOEMqMzEBfR47ToNEhgKGoEz2VHbaM1kBE++509e/Wj
         kLGaVgqf8yWCFWyvoX6dNOIxpUZcfzPTvwVRQdA3J5UxR/yiVXtP9pngSBJGW+XlZNEu
         8KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951853; x=1749556653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkhPqPyokGiCNL8dfKTXdO+jBSmWZLLyi7+WMgDPG7A=;
        b=vNFGkP09Oq6+x17k7+OA0UEmVF9O7Uc2HBPap/fiTrqsVMuVL3gaaZfz7eMtpm4XpO
         YuGhCsvG3OScTvWmkUDoIE7tBME40DfTKh8o4mixWqkpJbrDg81yzTenwah5mgljRtCl
         AvV+o15WkMfkzt1Peqfqb86gceUq3gi5Nj3J0og/yPob9sFuKkW7ReTGo1fluxkgr7pu
         qsaAeVGMb/Okoaxfbic8jkuQ1a/ctinsmRfqqD7tq5nAva41RaowFIei/YYxaW/BLFrC
         Pr6M07LvCA127C8SOvl91no2J4MFW8Ei67L6BtoWULmU82H3pNoXt4ADkc35o3ANlTky
         C1ug==
X-Forwarded-Encrypted: i=1; AJvYcCUh4hkehwmNfRh052kxSw+HTdkfXreOYZ2dGOZIyMQRHLJ8GVw9ShIdnJE4ZB0FGAPRLcuyMglykrIIcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEsgSTBJGDgoxaXIX9UPNrGPhn4iKGlM9tN7+RZFXUCRskjKM/
	IsAM7+1neaSd6ME0ijV4O3rt4kyypd1HCTyw3ykVCYonynbrMAuIbyfpG5SiEFjunYU=
X-Gm-Gg: ASbGnctOAkJFbCBTh0ydNy41qtAbj5+tmLb8k9dFbVIo5FNHeFnSDR/BQh1axHNZw/9
	yYcdMtwT15C3NjWDChLRB74HcbgCUx8qmvdRc/ALCOVUDbYMjYCUqlL6Wwegc3AaUILUtUkU673
	RI/3NzJcU6LROrkwcSrB+8mKFGQlWz9a82Eeuy+Vtf+dMdO3laFzdLOcwojIrfGTa4EY3qZGKtu
	EVfYeFA/S2tfDKP0c8jUMKd596SzQZ4VHjesbHRPRSoV8UZdHgQ5wfjud4OG8/7pqrSm8JMcD/2
	KFStVt1mxBpoa9eBUz1KodNSJtY4Z5vP7Vq6oNi+9u0koOK+mW+VlTd1yQwnXdGRkuQivebvr+h
	zwzwJ41ZMu8jHAD/Zz17R5w==
X-Google-Smtp-Source: AGHT+IEIdRGgKrmg9eIPwusMN4coMc3y/Fl5QTtPAy4hr0BEuWlRYIqpATHkHHaKQ/oVeyqsm4Wl5g==
X-Received: by 2002:a5d:5f52:0:b0:3a4:dcfb:6f98 with SMTP id ffacd0b85a97d-3a4f8984976mr4415811f8f.14.1748951852870;
        Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:11 +0200
Subject: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use generic
 node name
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1323;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=H+6vQ8kkEeYZu8N/t6R0JhPBnLddxAjO0+PqCquNCao=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMeEkx3emRaicraRsdlG7Qk+79kckwyGvqvt
 XqsNEE9H/CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHgAKCRDBN2bmhouD
 18v0D/9K1Jmn28bJcnZym4p7/2l524kGy0WHkj1kJ7p663rVCLXVsBqAtmClz1Ha+PdTJMfdeEd
 MfIY8cyQL0enStoD7Qwhc0OKP+kdk2x81uco+5g8XkwZw00MqrEV6xeQ/a+584D4uM9Y4mUuzpY
 xb0R6Rzh06VO7eZWvGttFDTtgMPQEezaSJ0rXDyUbkjQLVY2BZ3oi73oZ0KuqA76/boFe5Iu68G
 HpxQAeT1mUZWCaf5+8v9+H3A1ad4qKHAQXylPTO29W0kWmEIGfWKmMnhZ97iks1gzkZVeaEz9sK
 Kicl/QruPMpE1oCHrMwmoQXNl4Wrx1YJmyxGKFhg97uOzpZTnEP2P54wvwE2FD2Tpt2T4dpItgS
 La4JmIJO1MTb2CWQBy42+ymq/Rus7qrUH8VsbNUZIhYtz5z8snJFzzzfD9LQFhcs31ufhfATuPB
 aakw+bOPf9khBRBGBkqPpfKoHTg/T+5wJPmNdT3BSHz+3o+Zx7x0PPO5fCa/G62Cvf2rQKGipUq
 Ow7hIntbw4FA8pe79J8wK3mK0JY0aCydyWV76u9g7W4CbBKeiq5l1gOJDPqncQ8Hv/HLQrAt0ny
 L+cdfkucZCFNmHgazW46Bdxf4u6CuN8JHeIIXwPBYPqmm7clEHdJ2OsrfYhvp2P3Xt+bBdTJLjo
 6Cv9kBlwsqkJehQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

According to Devicetree specifications, device node names should be
generic, thus Mailbox provider should be called "mailbox", not "hsp".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index 2d14fc9489998a8dbe5356e2422748a228693d7a..e1a44e4ae6f91eaa1cd81b357e9e5caeaaf0f5bb 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -59,9 +59,6 @@ description: |
         <dt-bindings/mailbox/tegra186-hsp.h>
 
 properties:
-  $nodename:
-    pattern: "^hsp@[0-9a-f]+$"
-
   compatible:
     oneOf:
       - const: nvidia,tegra186-hsp
@@ -111,7 +108,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mailbox/tegra186-hsp.h>
 
-    hsp_top0: hsp@3c00000 {
+    hsp_top0: mailbox@3c00000 {
         compatible = "nvidia,tegra186-hsp";
         reg = <0x03c00000 0xa0000>;
         interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.45.2

