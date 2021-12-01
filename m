Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D092C9D
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Dec 2021 18:21:41 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so428193wmj.5
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Dec 2021 10:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qzpn3X7YSU7kqDgBL/msm7A2QFpd96QjV7OFVFdJdDc=;
        b=gQF2MAgPbjKUTnky23wGo+zGaO/BXsioNUUzVpDBk4nR+Fik/WELZ++ACqG4qGRGvb
         l0Uu105LT6VV2szmjliSZKZ0uKfq1y8YHzh0nhbBDh03qNx7HbCSedXBL3l0PKRp4fPm
         eNQqyOYi4yhH/hPmRO0DMVwuWILaR67I2+BGe1MZgs22osJ/6pdP6MM2l411+80PHJD9
         lWaZYCeJM5mTqBr9JEWH4FqcGd35lFm8lMfq5EGJ+KqMR285DLtH/rdlFvonMOGep+FB
         Eutvq4rcKtqSXNTC8aigKLgF9M4afYQ3Fgav6JRWvSpjUhimL4s+4X0eMMG3HYsZbVO3
         q5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qzpn3X7YSU7kqDgBL/msm7A2QFpd96QjV7OFVFdJdDc=;
        b=5NrjcI+nbNSjnFT57/bSxeFa5CAC9uKlrsU7VTWZ4O4Yr/aLcCT+AFpbCL4WEGgKAq
         eKiI0uRwwXRoj0yhq4drxN1C4F/Su0c+gjpKmlVTS9qFm3vIgQYFGvpG0L8LPKb34kq3
         A2G+fFHOBClbwhSJLfG+rcR9uDMm3hrF/+YpZxQqkoJHnNooIXMSRyaahULQ67wokpF8
         u6l431+/vE8OV8eQLf3w/16b508zYRXafqRzi9AfcDD0aBnv6/cjO0KWaiftJrNimZqb
         BVOJCKh3VycZt11Ykgq7BR1uruD08QiH8N6GBtEqPh9Brd7bWbI3xfTEUvg8daCeBIvv
         2fDw==
X-Gm-Message-State: AOAM530RaETGfzDKsj7skw0+XWHQU63E9aZPKy4dSpOa/YvwUjRqsrB3
	EIB0s4ZMmdPi/CkG7SAAyuSQVDJZECw=
X-Google-Smtp-Source: ABdhPJzUoNgZFCQUF0K5G5fiyEY5lvNE4xEEfZC79YJ2ioGRMHVcVJlggzrA/3UacmYTFkoQAAzbtQ==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr8795672wmh.193.1638382899462;
        Wed, 01 Dec 2021 10:21:39 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id f7sm604705wri.74.2021.12.01.10.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 10:21:39 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/5] dt-bindings: arm: sunxi: Add Tanix TX6 mini
Date: Wed,  1 Dec 2021 19:21:15 +0100
Message-Id: <20211201182118.1213806-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211201182118.1213806-1-jernej.skrabec@gmail.com>
References: <20211201182118.1213806-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tanix TX6 mini is, as its name suggest, very similar to Tanix TX6, but
with less features. It misses bluetooth support, it has less RAM, wifi
supports only 2.4G, it comes with different IR remote, etc.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 889128acf49a..c8a3102c0fde 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -808,6 +808,11 @@ properties:
           - const: oranth,tanix-tx6
           - const: allwinner,sun50i-h6
 
+      - description: Tanix TX6 mini
+        items:
+          - const: oranth,tanix-tx6-mini
+          - const: allwinner,sun50i-h6
+
       - description: TBS A711 Tablet
         items:
           - const: tbs-biometrics,a711
-- 
2.34.1

