Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8608605AD
	for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950581; cv=none; b=nN5y7hqjew0pedj3hBZFTRDZVkL6K3hIdi33iIIetWsPoTlK/uNj1vfNAtbeH6uVZspZmSefw/aVtaJUpj2pR2YKAOP0Cd3Rf35CW1xcrG6Ns7vGnQCKmdKTkaX1jdPNR+S/iPlFkBiYMCeZnq5Qc/gnIy+XQQBJG5WATakFr6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950581; c=relaxed/simple;
	bh=/yIz5oyLBfSA++ON1dY6EPVob2yea5MQlWsNhAmfIVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YEUVwHUzKqfYKN/JXd3RGgZlegsez+MYsB3g262FhR3dAEvuj3Or78CehhPhoyFKsYbmFSzOvJI0sbMXfUFxVhMWCKtveB0lDLwSixX2+yvmzRXwtDfGKa60w+WnL9jJpPqp79WyRCSpg+at6L7PDf8+59H1CmX28bI2VKuSJhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=szijEMd2; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="szijEMd2"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563d32ee33aso3949877a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 26 Feb 2024 04:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708950578; x=1709555378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUO6wmBtkv4ffo/uxOeQsK49ucl/5uSltaqOCTDJPag=;
        b=szijEMd2dccdudk4qnzRCRcvzd9WimVgR9CY3e/psan1QQtr9QGN9BREylbjMz1FvM
         Y8QwgkOR/DemDeLRnttdIGNobm7ircKuNe9JvZScl32n/QLD5zZXB9wBattbysBMszTX
         cLR7JHBVl0S8+AfMXfKGH7mULXcu3iuWnRzzvxA5VSQ1C3hsII7RzNf3PItOZrSrD0KS
         h5e33ao/MbDmjxyswnyP8fca022KG76iv2iBeaTCfLcIfE//Dg1Sxx7yAau1hyanEjxR
         g2I/pO1DFaEiUkSKFC7/3DE2g+BwKJGfcicDgCKticWTUa2JVos6QNLCyhlwf6duqOdE
         Lv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950578; x=1709555378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUO6wmBtkv4ffo/uxOeQsK49ucl/5uSltaqOCTDJPag=;
        b=dHK1bIzcZR78cW85w1D7Ay5LViGcGD3PYs7M5J4+GuG/GZEoJrawPFbIcROXSF2N4V
         hrRm3xa9v0JXvpte1NJFd5PFSyrru/KlTLcr0eY2lwAvXwT81xvINi2QMwSE8xGHPrcS
         rQduEU3IUspBgnqOsbam5nLxrfujNNio+rcha9B1Zoxv3t+ML4oe5eAoBn/6D1pyEWyM
         IqT4qVzpx1EL/GzjvGVDzTOQjWEMwH8ObLNG8hhwObqlRkmhCyIEhmsStljHWrIFv96B
         1zCEJ/quuloPNxVQyhMYNyDo5twmA5BI8gcQ7kFPGDoBFlJr9AmCohWXJ48VL9dqSL7w
         3/Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVk6XOFn7n1ygtLK1985nnWMzoFcw9F4aKkMe1P+atUMSWhf1kFewNMAyP7rH1s94OKLTDvgo6EawaAtCxEGpQlxtbXLUn9nkGtmQw=
X-Gm-Message-State: AOJu0Ywbov3Dpid1MJR9rZF82c2kXA6vAU2Rryc/Bb7XFKI1xk3qCxYo
	cGVDCVQQaUVlqmUKjzg9nGnrf+q6IUaFEPS8ZqTQVnbReNhpG6D9p1FzX1gp8U4=
X-Google-Smtp-Source: AGHT+IEG45l2x++PIZXi1hnUpUUkA/1s8de6YMCGRZc2XdUxmEusGFOlqs4MacdMEgFnjeNKBj1UZQ==
X-Received: by 2002:a50:ef08:0:b0:566:ee8:8b1d with SMTP id m8-20020a50ef08000000b005660ee88b1dmr869351eds.24.1708950577837;
        Mon, 26 Feb 2024 04:29:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s17-20020a50ab11000000b0055f0b3ec5d8sm2422683edc.36.2024.02.26.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:29:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: input: allwinner,sun4i-a10-lrad: drop redundant type from label
Date: Mon, 26 Feb 2024 13:29:34 +0100
Message-Id: <20240226122934.89257-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema defines label as string, so $ref in other bindings is
redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml           | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index 5efceb313879..c384bf0bb25d 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -49,7 +49,6 @@ patternProperties:
     $ref: input.yaml#
     properties:
       label:
-        $ref: /schemas/types.yaml#/definitions/string
         description: Descriptive name of the key
 
       linux,code: true
-- 
2.34.1

