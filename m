Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1626C5187E6
	for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750482; cv=none; b=QBMCevXVZZG7bziNv5exgtCImdpTRbIIQu2gGFmxWSQ4/FFfyG58cRSSGwg4LqSy3QJyXDS6XEKqr/0rhHtEC81NYbh2Uis4AhTSQbbVXkzc0DxqCqORbVXu0rwQqlgAv5nL+cvmW8BRG40e3a5yS8KFKFoLfW3NsIMPqYFou/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750482; c=relaxed/simple;
	bh=ZXJS5JzKrOR11yrKsPhvFOiNFDXrOJb0Qlf/cDD/4pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlPNOFDmslRpowq/uQx50xYT1XN8FAF8WTZU5y6GeLYkOlnFqs8o/Jf1fnT0Oz9cn21Bb198q/PGI3RN7pVpWYuW8x4SpjB25VfzXEVN5XUCUfv5Ifuy8HmA/l/dlFqp5EmjiBrl5A42k75aLEKkAlGu6qY+sY1MiSNgOqNS5Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TV3OanSE; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TV3OanSE"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so915608a91.2
        for <linux-sunxi@lists.linux.dev>; Fri, 18 Sep 2026 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750478; x=1790355278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=TV3OanSER+2VNAScksoU+fY9bgGPYOytxcqdnQztKYYpJGreIgg9nvJOMgo6sHIYu7
         QT5Yu/qgQyDVMWG4FRduhUMYJ38szEmq73YqOiMAeIWBliBJ6FJxWpzOikVWHN1nqJB0
         JYqSST058bhq+ArDxWooPp2Lf/bEnlJc1+pFznr+5+HpaDG9aMYSppFItoNQ3JfgKU91
         vOG4tzosn8ZhQi8hlsrh2dEc9UQej4op3dVEXoUNGYrEQ/77JTypHo5a48/aEyVTTw7W
         NBd9dME837u8eJIhx4QpcNM6c3/R0m+NPEXYGca6KlZCYMguOl7aydlaQM7H61yLpt49
         xjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750478; x=1790355278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHCBqkhS98MALcv63esiOVUC2HsGBxNJ963CzvWZoPw=;
        b=Bryz7QdJdXN6cg/ylJUnasQZdJa0PJJ0JzPxJYSSN68bPFQjcgTfh5R6K+82fWTHd+
         MR27VyFlKx242AUJVcSFh/M/W+hN7LkJbPok/AYiCecQ/UmbKx+PzVBzDxVTf9upQej6
         ZEDPEQG5KivIXc4K5/Zwl3PiQLYA1F/MDlG20fxzUhC4Si25l9q/6fH5fNAS8uCH59pK
         LtKkUqtCTIIDVeasSXN9fW88xyqZAvLEUyk28BkKyru3Gap181YPJ5my6SbkdW2YWOIv
         ov5KTs6nXZYuqbL/C/hTf7VdFjOeVlc+TNE4IZebPIryk41p4MX6q81xRSLZ7Yx/mqPz
         JfBw==
X-Forwarded-Encrypted: i=1; AKwUvBzSkn0Y6eu9sVV9Xlg5/8iDVh3bs3ENpp1rgTTzA7X+j0v5aJKCdruQURNmGPBMNi4zGb8duNAPDMtXew==@lists.linux.dev
X-Gm-Message-State: AFuF++laDsWrzKxnuepWEHAVdMYm3iwTFqAVSDC4Q0zjjC3eoT1vkTnw
	DonobnzI5RazdrXHGPZZFaBjs1r2Pzo9biSMbbiyGZQHMgFHDd0dmclr
X-Gm-Gg: AYBFou1lV1/28/60TDJwmkRRXZAlpI+2V5j/coh8IbB/7FMRqWvoeshRrZCU51G0wky
	6UhtBvk+U3eCCIlB/7r7vHKmimzXAIy8nAti68RF9+LAyn84NybLkyRfHEzLWn+4YlZNkmV8iXm
	OsP2yae+NK2KCZFyn3dZGraAxhnK5M8BzjCfbU156wYKmaKs5qsG4h/gfHvCuPRsiirRd2dmHl9
	4c/zANh5EbCRUUaYfWYXvkXdNWQiinyEUYGmSJol25TthyljhL+kFXTdfwwZuG8sDkxkeXsTTY7
	VVa2iukYqpTTsCNzqzY8yL0luJRAO0ovOcv6YXWupXou5JGPVEc2hRZDcbQzsg2HBKGgwPMwRm1
	MbMuplmZshEKj//wm5VetSan40teQFuP+PqaCfP1qhsPSSzV1Efs3jqBUC6FjbQMhCqc0jicAc2
	R9ZCeXXvLCJXucJz8161Ds0JDjL+ZtrQIzZUofK5wIp1Lppd5XicNfcuHK7ApUBlo4SBEwWLRVD
	rM=
X-Received: by 2002:a17:90b:1dce:b0:39d:f064:3a68 with SMTP id 98e67ed59e1d1-39e54d36e3emr7094039a91.21.1789750478423;
        Fri, 18 Sep 2026 09:54:38 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:38 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Sat, 19 Sep 2026 00:54:11 +0800
Message-ID: <20260918165414.1129076-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Teclast is a Chinese consumer-electronics brand. Add its vendor prefix
so that board compatible strings can use it.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..c7c2fcd37 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1694,6 +1694,8 @@ patternProperties:
     description: Techvision Intelligent Technology Co., Ltd
   "^techwell,.*":
     description: Techwell, Inc.
+  "^teclast,.*":
+    description: Guangzhou Shangke Information Technology Co., Ltd.
   "^teejet,.*":
     description: TeeJet
   "^teltonika,.*":
-- 
2.55.0

