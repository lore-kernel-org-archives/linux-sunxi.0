Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B23228ECFF
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649363; cv=none; b=CcidtldIoAXfnn3N6ACew5lopTkW7dinWkPWkFhVHYIVBe4JMnHUs9B7vJfRRSHzNrC8wjXfHKBV+GGqGntwrB1MxT7IPZ3pyDJuD26466YA4EZANqEGnNoei/eA8qjQGP9uupJRScp7faKbB6Opi8XWVAc+EMF48m59NnP4h8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649363; c=relaxed/simple;
	bh=bdDxkirV7/X304PhJ/J3+teqYXZovdfE+ye6RKbN0xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmR1FcCSn1bhE4U4vzqQwjpcLsSYtqUXvlzAmkpoqZUwfbNGZahOZSVTL+Yj1OaVBgA+okfHWf7YJ2/VDEi9cLPrSc3lb0JgHz0BAdZd67tc7l2OQ4KhUxl6AXd9MZtPAHGZnusaXhLclXu32i399kygIW+OVEKSalEoFd964UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCazeMsm; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCazeMsm"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c0b4a038fso168429a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649361; x=1747254161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l94voh9nFi8NC+FZhT6bHJgs5D7hhrZlzdK4jTqxAoo=;
        b=cCazeMsm7xHWnLfuXwtFMGM16Uiz1Sa7Rf161knY3EwLScyyX7c1KKVYuA38ZHgG10
         +rDSsd1mEH5EA/S7wUYKYYCSDo4XVSC0O5yKK9tO4TdyrGm20t4ZSAXfqiZRxzE474zG
         I4JsW51g2psJ1RQM5mcR6hIULKBSVQ6o+WDibCjxWdE4S+MEsnAToUxrSTpBhqv+dLS/
         Ydn6EDQMD403Xk36ThCwMq6xcxbMKlg59I+3+25tiTE/h++Ok+FvLOQP6TVMY4hQEYLe
         gWYswl9DptjPOMbVj4WU3oiUPKbaXyiTlb4yB7Uy/GOntbijokS8BtsB3G9NV0+/qXoL
         7wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649361; x=1747254161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l94voh9nFi8NC+FZhT6bHJgs5D7hhrZlzdK4jTqxAoo=;
        b=sPtgxWRpHIl1lXK/tJPRZUQt4u7/xC/kOBBgM7KVVva9DNoLYciaynS3Y9EtLi/I96
         K2sRWHUgMDTmcJXn9tPTmudMB20RGsT6jsPiBZRj2ZkHzbloCFeNIQ12AIZHFz/nDsOp
         zjNOL32VODEiqGGTfSne25TQeMPa1YGG/ydE/xl2yTt+8XxQMI9/yStTcRZ7hDDfeQHQ
         LSbhPSxey6OF/xwn/qhv7zm4JaTjmnc3p4Jfjs8JGdhKPXGp2Jbi2QZJit57Xm6Pu7ib
         sFYyPfwRl3VwGBB4B50X9Y5FhXDksFoLuaBgpk8nBEVkNY6VWQYPsUVs6pGLQBwTaoxM
         bHIw==
X-Gm-Message-State: AOJu0YxARlJz3fWSUZsiVF4NYATR77cTrUkg5a89DgSA4k3IJRSaQCjQ
	+qeeJD7XZMJdKPtnKS65AGflrzfkhGDbP2NbtbS/rjXtxjL8wfuYGS32Ng==
X-Gm-Gg: ASbGncuaZKQw+fgG3KrioxB+WdiruaG2PXJAkxICmxd92orFy6NSJlBNgUsqIkeiYSp
	qQdwSXWVk8MLxOjhwlVZ+fBJWAhtvfvKOsE14lROh5VSvIQFyKcSJNyZirzYAssnYVeckeGslOg
	AIJmMx9nMW38aNGfuyCh9gpp3pkU8bCoMl4anTVWGGVYh7fatY35obHl+S8rJHju4FXpOZlZTBJ
	tKW5sK2SEXEcNgHO8fUQ2BniPgulgXOlVsdEqURdZRvWOFZCJkdtiDfhPjofObqT3jUjj/B75WQ
	92/eO1G1+Qln3m86AXh85zuf9NMVh9gH+z7HBNkm6hAQNfzAr13tR9OWWofK
X-Google-Smtp-Source: AGHT+IEVQSwtup8hGlcNXSdOKoaKgaTojdmH8y9v80kzgTfNqzsMyv7A4MwSEPxNN6DhO6wxF1WRAg==
X-Received: by 2002:a05:6830:418e:b0:72a:48d4:290b with SMTP id 46e09a7af769-73210b239a5mr3495482a34.26.1746649361106;
        Wed, 07 May 2025 13:22:41 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:40 -0700 (PDT)
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
Subject: [PATCH V9 18/24] dt-bindings: display: Add R40 and H616 display engine compatibles
Date: Wed,  7 May 2025 15:19:37 -0500
Message-ID: <20250507201943.330111-19-macroalpha82@gmail.com>
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

Add display engine compatible for the R40 LCD controller, and for the
H616 TV and LCD controller which is functionally identical to the R40.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 724d93b9193b..caed517c68de 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -29,6 +29,7 @@ properties:
       - const: allwinner,sun8i-a33-tcon
       - const: allwinner,sun8i-a83t-tcon-lcd
       - const: allwinner,sun8i-a83t-tcon-tv
+      - const: allwinner,sun8i-r40-tcon-lcd
       - const: allwinner,sun8i-r40-tcon-tv
       - const: allwinner,sun8i-v3s-tcon
       - const: allwinner,sun9i-a80-tcon-lcd
@@ -53,9 +54,15 @@ properties:
               - allwinner,sun50i-a64-tcon-tv
           - const: allwinner,sun8i-a83t-tcon-tv
 
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-tcon-lcd
+          - const: allwinner,sun8i-r40-tcon-lcd
+
       - items:
           - enum:
               - allwinner,sun50i-h6-tcon-tv
+              - allwinner,sun50i-h616-tcon-tv
           - const: allwinner,sun8i-r40-tcon-tv
 
   reg:
@@ -231,6 +238,7 @@ allOf:
           contains:
             enum:
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun8i-v3s-tcon
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
@@ -280,6 +288,7 @@ allOf:
               - allwinner,sun9i-a80-tcon-lcd
               - allwinner,sun4i-a10-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
@@ -297,6 +306,7 @@ allOf:
               - allwinner,sun8i-a23-tcon
               - allwinner,sun8i-a33-tcon
               - allwinner,sun8i-a83t-tcon-lcd
+              - allwinner,sun8i-r40-tcon-lcd
               - allwinner,sun20i-d1-tcon-lcd
 
     then:
-- 
2.43.0

