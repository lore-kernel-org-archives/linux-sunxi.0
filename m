Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B72568554
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 20:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195003; cv=none; b=QSnOOefUeKCOc1LhYjTlYOa+fy8NooaL6HDTKG9KWBAJkLR45kcAbf9TJ1VkT2TK0wYdIhpnHllhnenHOY5bwj39qF+lu1GCKJKQbO4TTX09YFijohj7BvfjY3uD6So+R4PtRcTvVdj/w6TlHHAkO/WB4rH1Wi82NEJ1QrQ1nz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195003; c=relaxed/simple;
	bh=ctaMtyihF0ajmk4Gl6vHmDSDBA1iaCLst8FkJRBGR68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMhvu2cymh+1qCqN7ZwYUp9sy9obxW9ILpjUAMsUtzVlRAPbZPeyR6rw7Ej+YWmjNoE7dpuN03rr8YOtlpqfcNr8rD9FM3Wk7Yz4hK7WKw4+CeRLkU6hNx9IidGNdD5AtzuXQMzbVQT5ujyxt0MnXMlvAffUDeffCNZ0GKNIlc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwe2hdmW; arc=none smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwe2hdmW"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so2151297a12.2
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 13:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194993; x=1790799793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=fwe2hdmWbuoA0hr/oNhYJ5daqDVGL+F+XrcQhviDA7nVbfm6kbb6kPgZoTH2dEAYd7
         eJsXe8Pa00eZcWry3hUUBUb9aYCQB0sFjkCqYtXgHT4/3RlLlxcdmY/CmjB0k9y6DkHK
         /WUuMcgsjHRQLGgUAc3Be+L8sxwaMcKSkXPrRxvUbXwgkkZb17TvCRKTWIhA8l1UEGjN
         ugaaSGZDXzYz7cMfxGl9P9r5blOrtMGW/g010i2UPVe6SE+DIkMHzZW8Md4akD7XgLPP
         PlU9ZWxpygshQI0E1qTqDwQbpouDle/Hz3rk0MOFAnZH+XInDLwg/CWKQ/q/WeZQ/sld
         P+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194993; x=1790799793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=lvGt4u4yG5cb58LFPX2p1e675bJ/bHq0HKd/in8zlYpA8kwJLn6A1TS3J+YAcpoHU2
         +c84s14pOumZsPrfQIiozsHKUPXDbCMGOmmh5ZWtCcl6Dejd1YEGiwej79YS56ARlVND
         xwMWNDH2MCuF+liIBbeEhKgBDscTpkz79UAmFCJ30ji06PQ14PqD/9QiJVnt1HdDw3gr
         wq1zh7xM2yf28n2aBXSb61pXsaUJv/nb0J/+BqK+P5pVU1bWgvN8NqDTzIvL8Qy9G/ub
         Stie5H1xvPO8B3wUguhOkDFQvQQdOelid6mGycD4KUs42WNs907BRWfkiqGa6iLcf11D
         7UEg==
X-Forwarded-Encrypted: i=1; AKwUvBxjEIHE1o6/MJeB4xYYRAS4eSzb8/783lg9AvoqVC+BqCxcFNTTrUGgolQ2VAvpPeFOitgC9CqZ7qeYyg==@lists.linux.dev
X-Gm-Message-State: AFuF++mHKdHrrrcj+F6T07Iz/6OP3aj5VtQe1p5itck1TCCZs7RXH2Qz
	MfOUaOOC3dYA9VFqOAHv23eJ8SH5gPyhYEZIrCJUab+EUx6EvpHoOaYx
X-Gm-Gg: AYBFou1L/cjpN88+l1WDsC8E/j7A/u2UKpno2tnI//cSIhGvYWfPumLvGAZvLpNpaZs
	aGpNMuNZFCEZNSC8uBOdHUoHUV9jOf+AfcVIYV3vE2pNmfaSbkNefIpBwNa/bWJax/wLRLkaEcC
	3bpS4XDGLBIlk/WtCWkYjPWou5GiQp68VLMrEsT/eEKEdiEfc2psiaTaYAHK1XtYIJbn1BkJRl5
	+wvxwRVO3LrZ9N79d2BU1siheAEt5s3dT5W4PbRyPvm+0JxvucQdN6xH4stjsDN5aGpLBoJY8ET
	hLc05ZchZu5fnbLKbicGnOkQmTrLNRoh5EvNJVak4vLcLkrjh/vlB4No7Nel+C8tFgyBaBOTLaG
	SgYZ3m/VAzaBS2h9SmCUeOMk8CxkrTT05n6wLULmwiQHhCImKol+TRgPhRkVL/4EmOd3dJr6CHe
	PfxC7AZiZEUjEPTD2QL22hUV3DYjZTFuJuEbI8ifeck6p7ddj8+bhpymr0PCYhKb/sPQlS6d4HL
	JTZy67gWlaU5dL+Ezr00wOuo+Hmm6jUFD9bfErgEO4=
X-Received: by 2002:a17:907:7b89:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c2ac1f0c09cmr29718266b.0.1790194993528;
        Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Wed, 23 Sep 2026 21:17:00 +0100
Message-ID: <20260923201701.43391-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c630a..f66c681d3788 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.53.0

