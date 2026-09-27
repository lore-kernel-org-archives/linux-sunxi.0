Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CB5393DDC
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521956; cv=none; b=RwIpesaHKZPA3+9w1R/jD2PnFuu2VW3F6J+zrR+/HXG7IEl2CYJKqPZOtVfApXxDpMKIr/K9Yj324Y2TkoLgJI7NwyTl7e1b4es9BWvifb6gSTLcApShpbD5aDaC7617JmCn/rIVujG5htJ3lsUOideW0+fLHk6pdeyIYxrcBkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521956; c=relaxed/simple;
	bh=dplioYOzQkTgB7OtXIdIJ8d7kiQ1EMlzvR3wJI4xDb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRdXvemRYTXRKIz/llbGM+kpLU7M1RGiVO32b9Fe02bvAUc+J+GUE2w1KBSDSXEOcHoFtP2EMzKE/wZo7rWkyB0aAiUa6CNe8FJhvUG88kdI/vq4MUEazh6Ose6b0TzSom2pcr0xHamRNu25mTYKgQdmSojiRpv12eU6O1+AHbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtyE7oTl; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtyE7oTl"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1274956f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521953; x=1791126753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=mtyE7oTlJ44p4/F0+/NrQoGcJKBrBoFsslhsHsAWKmapP8Mvapb8uo5Vq81QolysWa
         ucH4QPhyl80DK3XLZTo3fq+wz9oDFrN3sr5cQVjx9F4cGVvYvleKR2jxOilydxSqAdOk
         YM+3TsBKre4qqtPxXT6KDzFn98D2KO7hRNG29nr2m+YWzJC62dHUSG6sVmZJj1dBiNXB
         slsTffa3P2KfAXvd9HoAZYqBPEuBSnmPzBHlF8tokAept0YlPK9ClioEIP+sQkO9VAi9
         0o0+JiuRM2WoBmrZfAy005B7aq8gFs6WZlVi+wbuXRDcX7oFCakLlvz+sQDC7uboexOU
         Mtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521953; x=1791126753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVRS8IDqRClJGzLh+AyZKtdvQwPlkBwHKoeRoTOl5Sw=;
        b=rAbkJX2z8rFl59s5HTDf7ACXvowN41b8S3ax6vKNEcHkuOkfdZd2GiPY4iq5+laXQ/
         YkRPlyzBwjHpCnqgEWyO+r5bL3wfSb/RMCjtSp+a4XpIrHu0ffotRtQ3oPAYkCgDfQgg
         Do48CY7ANGCCQH9VD1YkgFoYhDSQbaY1XPBLMX5SmBGfgpETQreM9b1jeLaa9Je7biaP
         JVzvVsrYHr83xJyOhGz9BNlOTSEBbDIpzUDu6KBrTjrE5AN0yQOnN35S3gritSGesYCQ
         32PP0xC3I0B4eR35RIHxsnF0OqUgd4fysApqe3PZBwvixjXinGhIarlNAFbQ9VphWGtE
         2CuA==
X-Forwarded-Encrypted: i=1; AKwUvBxh8mdwoheF2BVYzxw6wR6EBMXxqWJclkpc0iItx9DvxNtumpJtrD4zf/jucll5x602jo7Q1AtYFl2BNw==@lists.linux.dev
X-Gm-Message-State: AFuF++kRxrhuQPRhgJn8i+7d9WiiOd1Z3UuN7GZ2CxH+urYXsggNSOd5
	loD3aYnipaVzerr6XPb9+lWSCyOXORh2nZuDMh/WE1PubbKKulMUC0Zk
X-Gm-Gg: AYBFou2wey5t5A8JRkX4AuklkIIPQpjFkW9BYB+0Wwug36X+aVRrRK4K4BiUxLjxksb
	zMRrZfWzbRmReRjtOQOV2fETeuTrhHfjBcbYoxGiuBsUDYhRpm2ghFHCatolfyjEPb52Om2QOUt
	q7T4LK51pZq7FeIWNXbZkRVqWk+SRtUQKj/r+Dxv+UV3+ZUrZ+7nB1AjiX8WYo0d+MmKZ8YMkeQ
	afLLQWTr3lWUmI9YosRLyNQm4+OE4os2b+AS8L40d48JGtvJ01VfB2+XNbzOb6IhtOviJbe4vYM
	BwNV80a2xmsmtufVZa+E5Mo9h4v1XY+iwxwYc0fL5z1H6RqcINCnbqVbLfPzTRTOcG5IyIAuhyF
	pNfsAWdRohOWSPrJDTBIR5TFzx8ygVDsCbexP0/2mpAvh23Z1sSVfmMrI5hRW8GxLHP0Octpncz
	IpZVABWAbhDs3rZWQ85v37GeKUWOQavF0FLTVYzr4YEyD6fLWvJjMpV6/9A8XBDNwgSGVT6dmuZ
	QDFooG6NzDAjqC5N2Y0g8tnddu9ttGC
X-Received: by 2002:a05:600c:609a:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49ff06b2db4mr139499825e9.2.1790521952673;
        Sun, 27 Sep 2026 08:12:32 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:31 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 08/11] dt-bindings: mmc: sun4i-a10-mmc: add Allwinner B288
Date: Sun, 27 Sep 2026 16:10:13 +0100
Message-ID: <20260927151016.186493-9-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927151016.186493-1-pmazzini@gmail.com>
References: <20260927151016.186493-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the MMC and eMMC compatibles.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9e9610bb1eda..c2ec7151dccf 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -32,10 +32,12 @@ properties:
       - items:
           - enum:
               - allwinner,sun8i-a83t-mmc
+              - allwinner,sun8i-b288-mmc
               - allwinner,suniv-f1c100s-mmc
           - const: allwinner,sun7i-a20-mmc
       - items:
           - enum:
+              - allwinner,sun8i-b288-emmc
               - allwinner,sun8i-r40-emmc
               - allwinner,sun50i-h5-emmc
               - allwinner,sun50i-h6-emmc
-- 
2.53.0

