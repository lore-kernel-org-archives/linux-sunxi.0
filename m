Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B1D28ECC6
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649363; cv=none; b=K7xCWMhTU9UZQQmnkOzYfUrsnYCb0FJo3Y5D7WY64GermpUbgHKhuz7sn2ct9ufH0cOW9Fv2iIGbgc2hIlZ8Lp8sm6p4+kLZMZRpIJEROarwp+Rf4bSjSP0vPNcIFpeAj6uGKlTp6LmZXmgmE2IB/FoWkqGfmbJIbJeniJNFYy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649363; c=relaxed/simple;
	bh=CZWjxue5DhLhHRyqfTbQekPw1Iq5iA8TiEXNw3OsltA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkjxCgvMJowYGJPEZthIl3t28Vh7mBZyy0CiPGRaJPWnPCP+YuOSisJe8Hf9tebjesZj2ettAvni0c2myDwhcfWiJumeSAME2ZzEgy8cc8mFkCGd++5EfWL5sm3uZiDBG1BnGK9kwNL+1bhWCRLpa6LiLERCd73fVHC0vNffR9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhVpuGir; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhVpuGir"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72ecc0eeb8bso101417a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649360; x=1747254160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPj3FTwSrOy9EqQq/nrdWdKgDoZV00cUqzATiabesYI=;
        b=XhVpuGirg1sN/xKJjzbvyFCuY+RVc9RyseGL4TvyTleMJyQROxxNVcIzAhUlYyEhTV
         ovg+wEMXl3HD4Z7P6bk1lHswlYc9N6BWfypSr80/uFt9DGZghypzrx0YKR5GmupXcieL
         BVQhihBYyq1chE48Gi7YbCRiwSHXf1X7LuP/hjOAa7w6lZyHYLUJXVSHjd/Git1ZN/5w
         Sqe68JDvooykcOxm95NIF8TYPvgUPDxHCWybff8gw0o8Xto57fzqGn9yGna2NvGTUwzx
         mmXAijWSQN2AkKO5kiBTMSHIlldPGw4EfLYC+DYQoW8p/ko5VBYzVB6MfOenYKBoaWWa
         zTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649360; x=1747254160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPj3FTwSrOy9EqQq/nrdWdKgDoZV00cUqzATiabesYI=;
        b=q3brOAsqeAQNcvR94/RpwW5uRT+UwQ+DjAne7asHozjkQHn9j+my6nbqAZKV91Eg37
         zWOJhTbMyd7mp9ye4b1E7/Pe5GwyDp9xqfqyM+xZYoDzhPgGebiLalJmbeADzJicvfDf
         DWAfyb8m9ozxciid3STayuVKGBmPppvCpM71Jv+uSAzzoHcY3enxs2KpHNrPb5AdhC8e
         qrmtejzL8ZONoTkIKhNWfuyArxW5HFxkhT3TdQ3vrK7AhlxrhHrpMzHBeBU0tbI8FxNU
         pFb9BqXVO2GvWZ2EQlOwsV+07rdSx8C1rlS3V90p0ajzyHPXbhefB3TqhHGXaZ190pER
         hFDA==
X-Gm-Message-State: AOJu0Yzmc7Tk1EUAo1W9hQf8S8wQ4Ds8q6dbOWnQSfUid2yewrx0xdx/
	d7zf28MnPKuWLfupL+hhKj9aQFOw356n+m+YNNfQ5IX/PnxrC5YquwvMPA==
X-Gm-Gg: ASbGncvTpP323jHQ5lGg87TX4exl/RaQzky3fJHKH9JqgcJnoEGWPLpdQAykGZjpFTZ
	9vCdmsLgDpJrl7PHne0ffJ157I1gGoMRROrPdJyEf4WOE3Nz+ZSTVr7NyBtyuIIlzHWNUXUlUIZ
	PVia9ADrhlFZ9EpMlhKNqbDkfFl+Gh0KW15PWCi7GjgyulrIiJTuBM283DWknnE8I/7zwocHsEX
	+WrwFO7eZk0DPv1RCkaLYJzJPbQB8PQBdS9DLsRo0nFnvNRQ90IzTgHaqLnnCBxjmSSfT8cN+L7
	e1HZH5lCaciuf9140sRyNte2nJxyhTs6rCdW9t90M8ybHJdKQJBSHIv0Lv0j
X-Google-Smtp-Source: AGHT+IEQwmN+1OPKx+ExT0H0gstwaIAT4meGGbZXVI6b4Kwtw9G6/+vEj9eQFHV8s+c0s/9Df/IAFQ==
X-Received: by 2002:a05:6830:6202:b0:72b:7cc8:422 with SMTP id 46e09a7af769-73210b15634mr3494887a34.20.1746649359658;
        Wed, 07 May 2025 13:22:39 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:39 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	ryan@testtoast.com,
	macromorgan@hotmail.com,
	p.zabel@pengutronix.de,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Subject: [PATCH V9 16/24] dt-bindings: display: sun4i: Add compatible strings for H616 TCON TOP
Date: Wed,  7 May 2025 15:19:35 -0500
Message-ID: <20250507201943.330111-17-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for allwinner,sun50i-h616-tcon-top with a
fallback string of allwinner,sun50i-h6-tcon-top.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/allwinner,sun8i-r40-tcon-top.yaml       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 7d849c4095a3..80f1e49f5b7a 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -39,10 +39,15 @@ properties:
     const: 1
 
   compatible:
-    enum:
-      - allwinner,sun8i-r40-tcon-top
-      - allwinner,sun20i-d1-tcon-top
-      - allwinner,sun50i-h6-tcon-top
+    oneOf:
+      - enum:
+          - allwinner,sun8i-r40-tcon-top
+          - allwinner,sun20i-d1-tcon-top
+          - allwinner,sun50i-h6-tcon-top
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-tcon-top
+          - const: allwinner,sun50i-h6-tcon-top
 
   reg:
     maxItems: 1
-- 
2.43.0

