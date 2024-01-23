Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CB257321
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705998902; cv=none; b=JQ//k2dAJOjNtsJpBmata6coKwYgbpATbgtr+vBvMLurOn3VZIXQ5ytIfOVP9v2oAwveTrdbD2vKKDtbZC9nTEu0BmcXLG04okQiUQQRKIundTq/aPWloE4qjtapxlxxEgF/dIDjpAebyRzvUDwnq7CvAF2rTCSwiplU83iYPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705998902; c=relaxed/simple;
	bh=FHXdH8mw1h3Z49oeSgMQC9W3uag6VoccVDYYrZS4VX8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rz7Lye2YoogHGGjLWheihOuSHnO7AU1RMU4SS4A2EfYskvFaXzfoAcjzKslaG1e4qzFCd8+AfNzgGxqYjAfS2ba8Mrq/5b+g9sGy8d/EyfFlKGdsKiVrCI0OaNFconp/yV9YnTdM7zVWdxJdhmKCaRnaBm2AMqNfJiFvfjRolPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wMEDqsYH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wMEDqsYH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40eb2f3935eso7921365e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 00:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705998898; x=1706603698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YbtYsrAEnDnBNGvU/KXT8oQTPUspz/hEFAbpuyKJTvE=;
        b=wMEDqsYHZ7GicC8UNngcFlKEjzqgbq+adeQYCs2tMeyn+8ao3AlTY70OOam1pF4a6t
         C3sj9ktpuyKlEzQVL2BbJ5gDbbZFknk+NuKTFTfyR5ZfePypU5mVPWO/hcdUUL8xj+Cf
         eVd7KyP7I9I1Hi44Reaw9JH1kaBp8fG5GaQAudRDheAHRXQOiiZtSUehLasa5GiE0CwZ
         Rhza2GDCTw7dTezdfcnkFywOtTX1NAMy+iM4hk7InmNrMvSHNQ5qgJG+bipHtaFY50M7
         b5aSpzhMqi6JSIMa1/kVg6VmcObG24a+ah0spJM/2UXnIVZyEJXlhgmTL7G7h3HVVI/m
         fPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705998898; x=1706603698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbtYsrAEnDnBNGvU/KXT8oQTPUspz/hEFAbpuyKJTvE=;
        b=ClZdcVQDaaOp4Nkv2EbcQwVrU8fDQFWJCrIyRPQwEogAUfwgllsToYiuulKQRxRizL
         YqbJxBihU2Hsh6ZWRqTnfL/2aRoFEYoo7KKRMgKNKn6GYYjOkhWvvpJ2SwFq7YCjbg1w
         8ptFbSuVgN3Fe2p5UnAOwIVPJUDb+yCQmnAkVYs/W0c5bDelnDjjmhtby7HRreo+yg3I
         xxQwpUuQ1iOZAoFQr39GQ3OuBuCQxZW6Sk7orLTUvcaPkhWG2Ko71We+s++HvH853JbC
         /gh1/KK5REtirLHCdwor+JMrk+tgh5i3F0x7luNp1U53pyKNIzLFYPVUeHqra/iH1i4Y
         3n6w==
X-Gm-Message-State: AOJu0YwhkNaphljzl+GRgcyYaJxXBvYcjAOcu2vVFtFgEFys3rtXzviZ
	NywaFpvnzUQaNj8lgCpD6GCkbjUxQ1Eca1z7yS2FuMqSymf0QbX2h8AQG4hvViQ=
X-Google-Smtp-Source: AGHT+IGpSfiqLObRXf2pI7cfDcFLxyLN4hxeQLwRatDoxpu6xOq/MqtFPVGkf8qYd6ARxAUb+aUvdA==
X-Received: by 2002:a05:600c:a06:b0:40e:7af8:d49f with SMTP id z6-20020a05600c0a0600b0040e7af8d49fmr274423wmp.121.1705998898262;
        Tue, 23 Jan 2024 00:34:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00339307d9d31sm5840017wru.112.2024.01.23.00.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:34:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: sram: narrow regex for unit address to hex numbers
Date: Tue, 23 Jan 2024 09:34:50 +0100
Message-Id: <20240123083450.20996-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regular expression used to match the unit address part should not allow
non-hex numbers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sram/allwinner,sun4i-a10-system-control.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index a1c96985951f..cf07b8f787a6 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -56,7 +56,7 @@ properties:
   ranges: true
 
 patternProperties:
-  "^sram@[a-z0-9]+":
+  "^sram@[a-f0-9]+":
     $ref: /schemas/sram/sram.yaml#
     unevaluatedProperties: false
 
-- 
2.34.1

