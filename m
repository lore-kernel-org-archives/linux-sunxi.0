Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EB43976A0
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 15:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521960; cv=none; b=j6jt4cUjX7oYmRIXyvxRe6ZjlJf4Gka3gvi69i5kOrj0hr3wkppoNdhGiH9EtrnrvvtAFMjBlkLHJsICftbIah4WA7RfDRnGfZHJdFc2rlmNe/96RMZMHmezkAjTJQcosxl6DV5jE2lvdvXV2hUZkHMD3sR+MLFFNyoLJp+i2X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521960; c=relaxed/simple;
	bh=ctaMtyihF0ajmk4Gl6vHmDSDBA1iaCLst8FkJRBGR68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g8Q0cjJ+NFgx7P6onDC32hztzQwM6na0uvCMQAtjKd3yrZWWIBSjAejnklTz14tdHDHFcPJHcflkew25ZwTu+l8ucMqczrioGaaBsr0HrEMVp6tqzsSO/JVgtKZA3tp3uVkbzF4k+/ya1VEr9e+m/K+Wkgx32p7RDzAkySjApQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TaRjbmrZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TaRjbmrZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so1261108f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 08:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790521956; x=1791126756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=TaRjbmrZDb8zlIXoPZxJJuPCUj4JKwCAHaKrSJkvyf0bBlsgsmQICn+Sxb5WJqycFu
         5ix09L5l/LZNSWjHpUP+X2PrEtG1pXjly3uhQh1+3AjXbJugMRYSt81dwAAAW+mZ7UW6
         vVNiCl2iLfFA/3q/eUOcRK89wFhjtw1sOeHsNuYyEebLPdBDy06HWPGDzkc2agbhGmqF
         Oj1hCn6XQNbBluCwwWv/Febj+ZILD4Vgwn1S3Qjqcv2v7M2Xw3LEI7+nolXyWklKAIDC
         LBlHwjRyNCb/wLbLaE4hDsa5HZ4lSCaWK96w95XFia3iRQ+wqMgnMdiKL4YGHR7+dON5
         9RhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790521956; x=1791126756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=hVSA9uYF7qOEzL6gv/FyljtwNOhsW+rOQ/znmftLdVbSYuHtBNL9E06Sr9W0y9dTX0
         BH0vgaWnJOT0LjqQFjzcXGBOUora04PTd2qX206fsuNTPBGVHP8rbUU7G6LogfgRmiC/
         XX2QPtLaavlBAmls9efsB9eMStsNGboyLm4Se3GY0ngUmJftpiOYT1BYX10d8o8WWw2r
         unTVXugJSqUpJ4SYZGX/3/dQ+PnneMOBAm4U+J+SHnpv7MRhSE3KScMdTPwqv+XbCLJj
         n8hTAsldGUYvScuva8xm9MywYkD2lOMqHVCQ1kQRgXdejHYRCctFAy+aigYV+zxwKyYt
         wV2g==
X-Forwarded-Encrypted: i=1; AKwUvBxruNJQ5ez8SYtb7D+Z026Q5fpWto0C5Y48PYyiGtcrGTF1FjG+nLvJeJw1bvM1vlTU+xs72pwVa+WCjg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJv/ybQ7prCv1Dgu0v/v20N5xWeGbr1Muvf2XW2xSn6SZpPOJ2h
	aWS9NupcNDCRY2dRPbhlZOKp28BmdYiXwWNJCuQAMBGhvbym/geK4L1f
X-Gm-Gg: AYBFou0OFPXkhXacAYVwCWgcZ46N2uUkpH7m6rpvTzaVRYGYnpBqAVk2TuumXyY9xjX
	xAYI5BnpId2kS3YJT0nbO9K38BQAuqDBpBQRtYlwpBp2bIn/s/UHkCHQH57nrs9CTZaxMI6wfQX
	fXFa2qh5dbOYvzO/uOa6+xiqkhwV7K5k94cutrTktvOLziuMj3XhCj512HjuEA8iY5usNp+Ztyr
	tNjeOnypDoSYakJPnwo0tl0lIwKrWLB21QZArp8ij7PnryoIP+6AobLqx2Z6XkVAMFhfSiBaJq8
	cMYfGRGdzQVVkK0oagmmBXEwXGHEQeG9u+ssWOmLlLXnwicN9grHqilybCiMdEe4cJslh9Fp5Fz
	ogdw6qhyy+CFYDPj5AZmIwPbDScYpzlA8WKom2omfRhHQzSZ5LqqMQisBttTQDl7UMcbCsAmxwi
	1D5+mWKK2CxsXY6PxzSvyRS710NNJ3MTKhVZh+K2Z2++fePicQra3Xq+UfNk5bRXq4N1xVETjLH
	zi3GEFgB9eEBKeBxfZyxJwoPAA5734/
X-Received: by 2002:a05:6000:4b09:b0:487:767:b301 with SMTP id ffacd0b85a97d-48879df7009mr13521375f8f.57.1790521956427;
        Sun, 27 Sep 2026 08:12:36 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm19764208f8f.35.2026.09.27.08.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:12:35 -0700 (PDT)
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
Subject: [PATCH v2 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Sun, 27 Sep 2026 16:10:15 +0100
Message-ID: <20260927151016.186493-11-pmazzini@gmail.com>
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

