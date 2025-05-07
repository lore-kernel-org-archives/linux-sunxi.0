Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27E28EA7E
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649355; cv=none; b=gHKC4a41iBxuKQWZeMZqNqH5J4zkdhA6tuPk0U9Hlrv+6gweQRPLtp9Wsdk9XNOZqYxO37jkiMBxeVd5DKqJGS/DiIAzrOo+gk95QwFSnluXsPqqSmffgxgLGHl7uxU9c7pKhLjrKs5+CgEkPcdtkK3MQLtM7Yuqcls2BL4Zp1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649355; c=relaxed/simple;
	bh=HHC+IGGOoswomMAN4+ZC+pED0MP376pXx7EjCzIFbBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFD2bHw2QDPh5Z2bzCeHVqL1wenn7rKR8u9BJSI8hw+I72QGguBme03pi6hat9bcc16lBMvPL3MenD6oVgMQl9Q/G3AqG6fm2SPsSYGCdysrzwClqdjs1PGCcUn9Pqa8W9Eto2oAt/FYFFKjK2TjrmI1jBhSU1EWvvs1u/S3NJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORekTXV7; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORekTXV7"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72b0626c785so153191a34.2
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649353; x=1747254153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxQUx7fKiHIH0j8UlXMnlb4egqRRUOvhz4vjyisGI3o=;
        b=ORekTXV7HBhHlgYmoH84POlNCf1yRk0+aQZf4UDTEBS3uNs9G7apEguyUY7thBgWXT
         xyNC35nEgcUWnvudXnyCcEc0q743LXW4zIhxD0xRscnE9aW+r7ADM0zBjGpvYZC+QI8U
         j8B2uzkfBbAN21gGv3PfqnVJuOzYf0QIpHjKe/9uZPorqTXmFC2CWpxvs3y6dej1FidF
         bws6VaPPrqSTZJlHiyiXUFHJ5A9dPOTWMw2x2K/uhzfXo8dZ7hxgtBwPVfG4F0oUAuCg
         qIYZ8d/eDK/YLSVBosqxQ2oPm9lN+y3rxOQmVUkRvWYV+G+d7dFFk5D/VIcDXXxA68HV
         oCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649353; x=1747254153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxQUx7fKiHIH0j8UlXMnlb4egqRRUOvhz4vjyisGI3o=;
        b=Io9+a91YbFPdz6iLUAc8YWd2+odZOsMhCWROqoYJ50fbED2ewFw1d3myhpMf7N+l0X
         iUfCePgdbT7RIpLEy4IYYWSYKXVKlYRUczNgpOosEX7fK4g06TKEeAoF2OdgyrfcgTX2
         ijtuU9xlW01dqc1VbQmRG3CICyw6TBcUNPMCC2oZof/mbSEfsM9cdi04UHi6jJSTLbTF
         ztMh6x+sQH3np0GSI1Vp/uAmTrFzREq37GRJFnL5A+oKZqmMxaFQMEiCFfSpMw37IkI5
         4rsIEImFaxqH3Av3aTG4e6ExPuBF+yrQFBcSO87BgTiuRhmfWgFhe+cDDZ4pdxYM7Dy2
         umdw==
X-Gm-Message-State: AOJu0Yz9xPX8XYq4kKehp9OGN45LFL8qGv83K5Rtp65tOjmrDkrGjVEo
	hgwMM7PMhGADkn8UER7EE1JQvw5guGZ/mAY4HZSRpkfMdEUd1vNRbbYIDw==
X-Gm-Gg: ASbGncsKvKnqF+kfx26ZjHp8LyCYI8n6oonn3kjhH9u7wqk9Uupa09vfCi0Zu7GXrw+
	YLcQjj9epX1yISN8K8bAuN20+fR0MI4WkOxlo7seZAyxCUldk7dbADUJM4p9Zq2+yiqA4h03BNV
	t8TPOuuPLth+wQ3Q6Sxf5CY3vS6AxZxLzu8O3MKjHFCwzQ28BkFoGLnu6oImskM9BWL3+g3d2no
	fWY6PHfEZh2sPVYCDdt6/pfbI8WiKrnhQpiXW8q5t1DVFUksBwQK/uwO0qPrMnJkDXFgFAQ5dk/
	I3cp4qinE66ueo2I6u/4sShervO0KmiCTW6GSdzMQfd3PPo/AnqW5E9sqnFegRIJwNJzl24=
X-Google-Smtp-Source: AGHT+IEMEct8naOkTFIeGyQPkn5Ud20cBlIEl2qRYyNEjMLi4um0W9nrFDNK/o4EsMHn/xzNU9D3pg==
X-Received: by 2002:a05:6830:3489:b0:727:28a:1ca5 with SMTP id 46e09a7af769-7321c56f3cbmr461230a34.16.1746649352889;
        Wed, 07 May 2025 13:22:32 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:32 -0700 (PDT)
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
Subject: [PATCH V9 07/24] dt-bindings: allwinner: add H616 DE33 bus binding
Date: Wed,  7 May 2025 15:19:26 -0500
Message-ID: <20250507201943.330111-8-macroalpha82@gmail.com>
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

The Allwinner H616 and variants have a new display engine revision
(DE33).

Add a display engine bus binding for the DE33. Note that the DE33
requires 3 register blocks instead of 1. To keep things simple
remove the maxItems value for registers for the child nodes and instead
rely on the bindings for the child nodes such as
allwinner,sun8i-a83t-de2-mixer.yaml to enforce the max values.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changelog v1..v2:
- Correct DE2 bus enum to reflect fallback devices accurately.

Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3.

Changelog v8..v9:
- Remove maxItems from child nodes completely and rely on bindings for
  child nodes to enforce maxItems.
- Remove reviewed and acked tags due to changes made.
---
 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..9d9418c40b95 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -24,7 +24,9 @@ properties:
     oneOf:
       - const: allwinner,sun50i-a64-de2
       - items:
-          - const: allwinner,sun50i-h6-de3
+          - enum:
+              - allwinner,sun50i-h6-de3
+              - allwinner,sun50i-h616-de33
           - const: allwinner,sun50i-a64-de2
 
   reg:
@@ -47,9 +49,6 @@ patternProperties:
   "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
     type: object
     additionalProperties: true
-    properties:
-      reg:
-        maxItems: 1
 
     required:
       - reg
-- 
2.43.0

