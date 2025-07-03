Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8941A2EF66C
	for <linux-sunxi@lists.linux.dev>; Thu,  3 Jul 2025 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555548; cv=none; b=XxRub73gvCQDnbwoBoGjwb2eBq4ZUbQmP7bVCj9QKp+SxNR3dksDtpqv/XlYGhMdLq0vQ7ztfiwGPLBemIzMSt5GIUXOaETZWD5yT98tvG5FYWNNEMytU4LJhepuVEJwqAQGzEHNdJxvppJCVLMRpIDKBvQoPQ7YRlwx25C0bgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555548; c=relaxed/simple;
	bh=2VtHhvZZXe9k5UmGankZAg4IjeCT2vcwRjcFNQsN6hQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvhlXJ5rJgljVvBY0bvOMnBtq5EBdbMaBrbQmea2VZzdrlF4WjRBGF9/Nkiusc4+JgxULQYL1oE1a9bReTX0RpeF67Xme0WrEJFK2QxubjbRn0s6y6+8qG0MPgb9XMWh8GRFgu1367PBsYORTVZ9hwKf2F2nBjwAxhzXY6FcraM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsBwwRgK; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsBwwRgK"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32cd0dfbd66so76491fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 03 Jul 2025 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555545; x=1752160345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUCZaITB+JbIKX4CqImv9IU6yGF5XIw9/F8cQCdwhok=;
        b=RsBwwRgKEpZmfSOn0XjvPOFOyjSjSrKnUPg9PuHWaS1SK8iOb58RV4pzZHDfQa6/Rl
         RzeVwmZq8CEiI+D8JPiT8muxSuIFC2Kt/m+JWD/u4DPxU+QQRKhpME06E0eboOSYCbEc
         XS5og7NP5EJpyZ6uZQ3DOfiiiwDMGn0BsPkYr2Y5GtGtF2/KOdMybAqnt3b/dQqDuC7L
         4RbPfEW1gNokcKhyKIncMNSmx9Q9QSXMJp7+MFgWAx0cimcRfmdHt2UpaaR94lZXElGp
         EnWtrYZfx2knTGQJtPkOhMpvqCHRVz/nQ78dxQngi9bqkXzll0Rqs+lnMtZF/MSwXpmV
         +N8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555545; x=1752160345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUCZaITB+JbIKX4CqImv9IU6yGF5XIw9/F8cQCdwhok=;
        b=towl8ZxkRuNSqIBMZhc+4S7uoq+jQcoPWSLZmh6AYeen+lnoMgN2SM5JYsfstRX3vB
         XrRRQHZRag3pxh6hvfsy0guwxCx9dRcxhhIVi3CO408P0SC/Yx1MPBUatq9PFQxAapeo
         qlCWb7z2mNx3vfhjjaA9fYOiFss3it/lT/b+ldklV1YMwQLKR91D8SKFAI3qph+aR1zx
         AhOTCXM1/OwLW36ax6rhn8n/1ZDu3aGIyumMXJx7lHGjbteyxNy8d8d0WKHkTYUC6CM3
         TOMTY9N2twz2GO68yUXWTwNi3HO2SCM5x7XlWuBtOXRL2U/lHG1Z2HoECPdtC/SAqA85
         3Z9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3PKvDSeBgwMwlXsGI8loQGQ2G1QXzkXBMkJcdHRQ9iolxXxaFd0JIrPQFkXjRQnbbcoYeXC5EcJpFiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDgiNvNd7uunpwlFzEuBB6bDwpR1PZskuF+na1h0r/wlyx94gu
	dHfhh1ZTnTxDRMggmicNng34vjy+H2GeqA2AsPO0xieDBKIXDbgth5FN
X-Gm-Gg: ASbGncu+2taTCFVWhhPIjIqhSXYcZvm9NiPVyQPh7mXaXt8RJKXYLwftOwj63DlmbIl
	Hefxtb1f37txYq5iolkRJK/bDBoXJ9/cwTSNiAtY35M7R7kzWXxx9GCot5JMMw1n/PId7pR/hFP
	QBuuaRQqnLSsHWlIptv6+HW/iwceHd0BvlqtTRQc41fvMjULC0mGLDnxJW9eWjqK27nO9HCK4WV
	2QacXVRFlpuk4P5g+aE3yZ6dJztCEfbX2bzdN0qndfSuhFgw/4Kooy7ee8cwRaRHfZAYS+IdydB
	bHGX5otscieeZsbJaGWGIaTk0pl/o1V2r5HlIuBmlAPxuuq9SyQ/IT76mmYSLUrbn+l2U5Ah4wy
	49RyiWQ==
X-Google-Smtp-Source: AGHT+IHZy8BDgg1jwQmCpKDukxqhrE2LVb6Ay/AY5cKY8tq1yT7pP0bu22FEBsebRudNWJpZ7jrRNA==
X-Received: by 2002:a05:6512:3e22:b0:554:f76a:baba with SMTP id 2adb3069b0e04-556282e0d4amr3008654e87.3.1751555544426;
        Thu, 03 Jul 2025 08:12:24 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:12:24 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: nvmem: SID: Add binding for A523 SID controller
Date: Thu,  3 Jul 2025 23:11:25 +0800
Message-ID: <20250703151132.2642378-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The SID controller should be compatible with A64 and others SoC with 0x200
offset.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index 4424c3c5e..f67470b8a 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-sid
               - allwinner,sun50i-h616-sid
+              - allwinner,sun55i-a523-sid
           - const: allwinner,sun50i-a64-sid
       - const: allwinner,sun50i-h5-sid
       - const: allwinner,sun50i-h6-sid
-- 
2.49.0

