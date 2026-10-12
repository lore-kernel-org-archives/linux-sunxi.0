Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C444459AFF
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799799; cv=none; b=rIvCStEBTtz7kxm4gImmwhWPA2NCTov2ITyykfjEqoubZdOAS+0s5ApxDfhIbYZhDYt327X2Yu+axDe9NglON3CC7jCiV56EYuReDd/lATmrSqFGpxy4rtUI7epEf1pDrJiigXrmUZmGzCjScP7OKVbdc10H5GnhISXH0xPGaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799799; c=relaxed/simple;
	bh=GdBr63/reP3Wl9EB+qPXsBbASaozd7eVeU8Brd8bmQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kepd3zs+AaUJHmt0AVeGdogh8i6S3QiqNclCH2Ru4gkhAITKL4CVC6bkaoB8kKMcj9OFsIELz3pJgq4lQYdDqs4lbeq2mSkBk+JcAlrWofWrsE4cumeGL56SM1k44oBBqul+DPHOnOkGEujVRzubCvKMZ1pEG1QwQwi3ldOlK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZYFs2pZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZYFs2pZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a166199820so10458375e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Oct 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799784; x=1792404584; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W68ZhWpdb/C/lOojsWavHUEouXSEUpAyq/d2Jk7bb08=;
        b=bZYFs2pZvXMBA+CQf5NP6f8pPz4Jd+F0CTfOz1QIXUfH09Rrmi/cZedcgQnOt1NX+3
         9UiHJwEWAZBt+1wbZTKM3MNMJGY1p4CZ57Dp8aZUOLUexno5dmVNm6fYmfJNv5miRdG1
         ZM1YCbbVFy0FJ6fbItoETxEbLV9UV21DbiHz8XhQ+iVJQ1SJxeSVP14iIQ8gIkGtOEWB
         qaUjsJRpsnoiNqNRw8vqDStd1ByIPkGr7SYtzKn0koecgiOZUtPnAgnfbI+tUUIKk8iM
         rh5auO/zVB69VEofpX4Ii20G5uA/z2SL3pxnFIOq23Xoc/hwCteph3xCiP0sVxpemuvp
         SMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799784; x=1792404584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W68ZhWpdb/C/lOojsWavHUEouXSEUpAyq/d2Jk7bb08=;
        b=s65P39cokPDrdnIZx/kBu2Qe3gNM8bjKgugB4TUYdKtbkfT1posvk6aOw2mp60ELG1
         d0N8oIbC900jrSLLKE4781iiPgzKiy3S1JN3JRrwMHC4RGjGbLlcO4b5G9YogeRAgCKI
         0w2dtWTl3VPVNLCu1J6kpG7AiFHhzX0AdZJxbk+USxaL502IOh2VLFUbrw+RC6msQiq0
         RGqma+ln751IIr5hmQFBhoenU9ayj1FoJ7EWu+JOuhehrEZV6UdZBflAOFkxLvUUaWDQ
         lLHe5SHbKeIXFhklCnaxt+v59bzdYA8VMZbXHrnPMKJ0vAoa1pD1FzSTWFyUB73rGgxZ
         2iDA==
X-Forwarded-Encrypted: i=1; AKwUvBxTvCNfDxLbuPnC026QLT/9qUEzjt4i76hHeHGA10gAxIFL5IFcgMTSWyEKC/xRfJ4g478svXgPJczpdw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIlgoWPgeBukbfPyvW5uCFV/0NhN6ocR792apCs7xMtTFB22vXT
	lDWn5Te7oEFJcMaXVTQ6GJqwtAFxxcXZMueEskMnO7FQbt95h4lFZvOM
X-Gm-Gg: AYBFou1CnOm+yhzOBGqaDPYWXVxM/qVPjIK1sXQKOcjAgJ1CCr6pAc3631KYHB7d5TS
	IhUxZDqrvjX5FgCgNEXSDUSF++BzIAIb/f2e4+kWaYMHj2PRqdON3oSzouPI+jUXuGl4XrtyRT8
	iXho2Kn2zyXPVvR53bFfgVOMryiUXa1wEqFSjaimZNZ6r4iym4/fKNcomuIwsmHp7VPPNIYNbnF
	HwEF0lDTc6hoB5Ino7rX2RRmIfv9LWdKJt8uvEvP2l5grlBoyzEXn1ARDZyUDk0HKXWoDOENLUR
	bXqNXjeiz6QtkWg0UhsLyxE3plKxIxB6YE9ytsDI9E+QyiqIPDJJ4i3U6EWpKqeFa504QCRFCV1
	GCdXB+1Kxb1BwbHcz4WEpjJ1PGMTFRzCwnWp20nx2DbEbkOcRNljetUoI4r9uvI2+Uj93aR9qfy
	taT2iaRljPjwuEFKdrO2wsKIrXInUnPtq7KeEeyzyoN8R28D7yM8L96h6LBLwNKROKCBRmWpaKv
	RMdf5Beph6nm9xx1UxvW03MZty9R/5L
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a18e4b1311mr160592305e9.17.1791799783597;
        Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:43 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 09/11] dt-bindings: watchdog: sun4i-a10-wdt: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:14 +0100
Message-ID: <20261012100816.331033-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Same watchdog as the A31, which it falls back to.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

