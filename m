Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E704E433F
	for <linux-sunxi@lists.linux.dev>; Mon,  5 Oct 2026 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232119; cv=none; b=banimL+EwaPRHdokbLa+nY5izeLHPlvV04IO3yrmAT+21tYxaRD36SCPxsntneLxMRqVwnvOD/Wy88XWA7PZzfPMVviutKn9mUwWN/lPCjXxd4FN+qbx6/lji5MvNAnyU+CbAY/XAmg6p0PStcZNI1g7tatMNXXoY25xygiVAZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232119; c=relaxed/simple;
	bh=WNhAk71Qu8BZ3KT8auXzJe4ZdBz0usxwjjmPf0EUGmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYR+MgrxOopUKz1XBqBpZSEeTjanZK/cZ7L+JPfCct9xNQzUiNH7gUzsUuWTcDsjiM6ZvbEozx4B1KUbgr+PBcpjN4yrSHf5R0aEMq6VwKd86eucK6G71UyP/GYZTBCm905WAgEG75jlpKl5Ki0Rmw/XbydximPH/ACz8QgL+lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VB1AhVia; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VB1AhVia"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6af7d408b51so1622018a12.1
        for <linux-sunxi@lists.linux.dev>; Mon, 05 Oct 2026 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232110; x=1791836910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugyUVM7WGa/7b/4xphp+avO+tRJrF2CcrsYcs5/Na1U=;
        b=VB1AhViavNavRZ8qeLdfjF3CGPk9ei9dqBr/6EgSBAnLnpt4NuIJEOgD5/X7mSp27v
         sFJvX8zX7E58Jp7rNn+ETA+K1vNuzbH5srwzWs7J7CGwkqZBVHEo6NxI1zNcRGkIcRMe
         HVFtg3e9FvXbT7gZX+p0CeX/O5tzJ5nxfV8yUB+mlmPXRabw0icN/+qZ9lCOfEXlFi2I
         M6OmWID5e+9uNp7o8wtU3tjK7H7LYhYDNm/v6yZRhozbBJYSaTDnefLpPa/5t+jFqyic
         zCySOGlRkqutp+3z26DoPIgewAwi19zKLGcFiHyVqaKGq8a6MBjUg8YQezLBIC2/Lw7/
         V3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232110; x=1791836910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugyUVM7WGa/7b/4xphp+avO+tRJrF2CcrsYcs5/Na1U=;
        b=1BvoQEk6F3AtrGYM6+fgMMX+7XnCiQmhGqIDTmT+ybemnEjow2ILz0t3EW9K5jFkPT
         2csk7hLL71GXUDKduVMfZwmYiand+J0d03AtFIxpTLGCM7EJ/Z5ep15Pzexe5EJC5ibD
         WKD3wpuaKN56fduUYObylJyXoKr8rlc0H8SN1x81LQ4DCoWhVMAWUSP/cOimHB2CzIfL
         Yqx8NPsZWTQp0xJZY5WNSMrsSOH5f2XsP+6gj5xrPSgeSR42Gxat1zOm4dunBm2/HnU5
         iu8LaTE9ZgsJI3EIDM8iCNY1EJN+JM217NuL+yV0CbRb5zixhSac1UeksWGwtxytDywz
         XWlQ==
X-Forwarded-Encrypted: i=1; AKwUvBylOeu/zU07tY8rAWcORqscIKy0Iu3NaahTnX/7uNDVyDDCmvbfTyuZdtT0gPGEZCsFolV/OXmDsy2mLg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLCHwo7hJHyvc1ilvMezBGtiBG5fV+vu20ml861Acnuxt7ekCdX
	hPXXS73YhMrVXoP/b7hnsk+zKCyQola/72G4a4heg1bnVngaW/Ir7mT+
X-Gm-Gg: AYBFou38UJeIZ5ZGODhBKIsVkMFQN30zxUnc8jUz4wlOQEe1vI5MdKp+poEsTOA5V3+
	43rxKru80JboGQqkhwxKAQK37OEpWIBtqv2n+aXsw82d58p0r1BRsXc/4z6LqDARrBjYO0vrXBY
	6ca6hcdgs9wFABBMHWmPKFE6hwyd7Gk5eG+Q/DOIYuWzqPrJ+KtpHNid07H2Ps+P3QtCIArnfx+
	3FB6qazCd9R+aoIM4AkO1srpbYMuompXZtftnQMPKiBfDnkIY3dMXnqsXSU5x9I7AQnDiNudRxD
	SnwQLlmdAQV7sU+5uj0iuBRNO6POJdD5qgO4aTwGGRnCOycftEZgH5s3fPrr1Emw69EcZgPTMF8
	Dau3X573ZRVrJviCBTCP9sT81kcMzdzmmJTdJ1o5ZZAoCMigsGtAJkYO4etrAXgRN5MIcIaTlwR
	5R27uy+jLJfJBIZw5h6wriTgnNAQFXLHCrXJWC8lyjDqdqm9BLPTLofUmQyCArXIfo+BXNQLsD5
	ciaDSNtVmB0NJ5rz9xJUn6Umc4GKHeJ
X-Received: by 2002:a05:6402:21c4:b0:6ac:7d58:dbed with SMTP id 4fb4d7f45d1cf-6afd834a917mr673140a12.3.1791232110172;
        Mon, 05 Oct 2026 13:28:30 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:28:27 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v3 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:29 +0100
Message-ID: <20261005202731.153971-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same watchdog as the A31, which it falls back to.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index b35ac03d5172..b70a6b45a33d 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -20,6 +20,7 @@ properties:
       - const: allwinner,sun6i-a31-wdt
       - items:
           - enum:
+              - allwinner,sun8i-b288-wdt
               - allwinner,sun50i-a64-wdt
               - allwinner,sun50i-a100-wdt
               - allwinner,sun50i-h6-wdt
-- 
2.52.0

