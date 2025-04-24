Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96392229B01
	for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484466; cv=none; b=LdM/2TGx1SJ3xXe55Tmeqmx7PsaPFb4PH40DfxNwde3nX1CnUZ5oQeiPnlQsIaEhJ76ZUIk9hec4xjkU8mUOIHLYjf80KvbrNuqzWE10BEdUqti1u7sxGblbv9CJ/KsORHMBxhmnjN6gA+DmkekIHxjstc/1sCpYup+z1Js0Gv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484466; c=relaxed/simple;
	bh=oXXVI9MA8NZQJV8UjDqTDMo6XIrdRN+oY4RhgRwelM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lymjA0vGJg1gPpsYBVsAJgvhU39+8MfKT2IKMfVFHfNYmqaPmqgNjxEbQr8b7Ouz1WrOaDmVY3VHqRpMsXvxYhR2HU9VDCuJx2WajX68yjD8HSOM+DhlNPo9Is70zCoJfM4IdYDpfFOPlS076IF5Lt03qTQxBdvNFkUQTBdkLrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=deHlN6Rn; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="deHlN6Rn"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso123533a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 24 Apr 2025 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484463; x=1746089263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Rb8W9J7Qw3lwXkyUyMZqbY7uDV4UBFzYR28V4ttS0w=;
        b=deHlN6RnSXDaFkd+lLPdSLHmP2lN/7gYyeTMTRaxmR9E5zpHIA3X1vArgpwP+6+Lu2
         TlwTEyEud4f+vMbf+AW7ApOgQA1hrG2o5q4I4gfnQyhopC586f0QklT+DBSDFTjfKL/c
         5iuwclYMDqIDWEDcjSodrmE2A1ffkL2LuFACocw8gplr/E3aLtQM8eiePazOaz2btNkz
         DVGnt7gw0WQtjFM0eH1XZr3TtG05owm2jADAVWYTbtwYi5/GR9ueudrw+2Bo9/4uvA3N
         /XGHTsl571VslfNtmlkJMHkK0PSMEdSeZcdxMj+2y1HKKOlHlRKwaFottf0LIG6UfFg/
         lEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484463; x=1746089263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Rb8W9J7Qw3lwXkyUyMZqbY7uDV4UBFzYR28V4ttS0w=;
        b=VOvwt1f8mi3bR4FEjaZNCvJpTQMSojwjvMCOh6q4XiVA4tvoeD0AE0pMwlUxOYqyrK
         7wNM2/mT8mHjR2Fmm+cwEBJA/guJlh9FaL2SToiIFJw9xRg+2VupewPkNHIgeDC8CBnD
         EHnwfBcMxYe0eI1FrUvrxXb8bkmwxMkzxIVEe2hWpbpm5jbF91AHXXx1T+rthr2U+4BV
         Mzh0AK/C8JqiIj1AQdgWZHe5ld1pvk1/cIrIzKZV7rOPAPHJS/sX5vrVOW04SxPwHusa
         aq76pWmvD8cY4UtyRb0kVdEiJdsycPgNofMd2OaSPwY/OB4vbwDUEncmE844+Z8OTuha
         iWhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3gZJR3l7wDu82IgkDBq2gD0HM/Lvw036DwYhdAOeUF7649SPLiqVGvbgXawOeddpZiGV21iMkdHWjyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHinUqcRG2Ff8uez7B2x4rFASf+bnnAr0jQf7RH0lrzlNZR4ly
	Z0UGrGy+GSHOsLUkfVBMAxp58Eyv10NhKrIT5gOYmc7ZCu3UdpCYIFVR/v1dvHU=
X-Gm-Gg: ASbGncvLAvOxbuwXE61wupS/W82VfENGS88ojVOUmg2dTXqniCrh36nBOi9sPKa//Cn
	b5YdvTcATjFUNjRkYH9ST9HbHO6emk7Uzf49tKy9gc4ZwW3OPROY5jRQ1ElK8lUD+grnd1ol9LO
	dvCRtbCgKVDbXiptVchRLN0neleXxfnSWk9pfUKDSfCPxyXExqyd2fWpUqIh+MJvkMxRtBI6frG
	bnafkGoPvNlwaCqtECZRmqpTZ/7RcPopEiqd7gt0HJ61KMYCWAE0ekmIUVXWbyYm3hVDcK6Hpme
	9yGcYbeGS32hUfvi1jBaSYG7+2RUxz2LlEcRd1rVEpLpTPezwA==
X-Google-Smtp-Source: AGHT+IFODpwZkT/2DLzoJH0TEk8ECY5Db5Vvv11H7L13gvYc5UBCSm7T9un64cPNNQgwKu2fF3+X9w==
X-Received: by 2002:a17:906:7316:b0:ac0:b71e:44e1 with SMTP id a640c23a62f3a-ace57279966mr58846666b.6.1745484462947;
        Thu, 24 Apr 2025 01:47:42 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830ff3sm71378866b.7.2025.04.24.01.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: allwinner: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:36 +0200
Message-ID: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  sun50i-h6-orangepi-3.dtb: sdio-wifi@1: $nodename:0: 'sdio-wifi@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts     | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index ab87c3447cd7..7b2de2ac8b2d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -144,7 +144,7 @@ &mmc1 {
 	non-removable;
 	status = "okay";
 
-	brcm: sdio-wifi@1 {
+	brcm: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&r_pio>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
index a3f65a45bd26..0911c537cc6b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
@@ -28,7 +28,7 @@ &mmc1 {
 	non-removable;
 	status = "okay";
 
-	brcm: sdio-wifi@1 {
+	brcm: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&r_pio>;
-- 
2.45.2

