Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1091528ECFF
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649361; cv=none; b=q2Owv8O6g8oK3rrxpoGMP05Fyszsn04hW55NNnLvZDU5vOE7cipoJPpNQyFSW7vd0ECzxOGWMjqvIU5Aaxqu2JIObSc4S1XVJLK5M1J86pTBdq9oaUflO9VlR8MUpZWaQ3ZhdwHMEgFwUbR6sc74rLXZcl2M4gofCzv+js3/kjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649361; c=relaxed/simple;
	bh=2yDnuvqnsMKb5v7FhJuaXMCece+lX8rcJxBH6QMUn9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpV9HJHjHuVzLR5sw5ksP2aRs1AAerVL2jtJ9rxlhc7LtPhm/2q+VA0Gm5U5P9atxlfJJHfb06wQAbSZyVcU5Vmem6tAisaoHSVOGoZdkTHx6DrHv+PAVRk7lnXNvvY9mPUoLIQngPkvmk18YBSMxEL9iOfdTMzEzpAItDGlAVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUTwJT4g; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUTwJT4g"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72ec4634414so161089a34.1
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649359; x=1747254159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=id9bhPaJz6moPdglTk4FYXKc5tAiLx4T44z9LJHeLkM=;
        b=QUTwJT4gFRZFN1t4zNVNdJ032zmrQ32MQ4a1V7QLo2Dz1uAQB3xYowSAtu+tw+RA76
         +nZNcxqvSlpAMgioTulPW8l4jMPTRmDRB6cgnDU+/dlVlqcx9zJtDm+XMdab1ifQ1EQO
         Wcqie4wDXBn0djllnhWMfvHcXEKAM25uWhRo5e5p5nV3xIgmExBC2C3gF/DgP0Ei+yc2
         VtZmUt5swxCY5AxNzb/FsxUa+uKfJjwtoP35dnbS6aImIy+1igPD0vy4tunqZwd3R/4B
         zhdaKEZz/syKdtKsJe9CA2+Y5nhKqCu00Jeihk7uycPCjh9Q2aTfuIboi9vBSRvWQpBV
         sDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649359; x=1747254159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=id9bhPaJz6moPdglTk4FYXKc5tAiLx4T44z9LJHeLkM=;
        b=jxLxYhHTjn1MzgE+3F8YwqNe4RwaZ60iDHcpWlxu6RGncLwdaqP6YQb4EjfcfJ1ofI
         8kJXFsg1i7r0Qv9AWejw60XRafx0D/alb6GfjmTqqrYsKUshm94/5vuEyXPaoNT6WYcs
         /Dh/iHhunE1UUauH48tihcDAaZuikgj5nyP6M4NOlNd9udZwMWVJHmAbhuDsp4OCskKx
         1onrZEz+f8ntf2q2hXXESXEi57L7aYYouCmKjMAc62VJp98P2YjVgluhQ/nai2GQxY2z
         +arf0t/m+TqP3+su/LcSqItWfP0oKDA/QZFfeyys2loXQxq5veChKAiVfCTIvLw0Bn57
         W15Q==
X-Gm-Message-State: AOJu0YyBflIKi2/BeA6Uwk4G0DcfBc/a3v2RX3A5R79miJzhCd9vgXB0
	ci8aUAAymnq9rZ3UkvrVhPRMV2/Vf9Ae+6sICvg0hwoRNIlCrL/VDj0Ucg==
X-Gm-Gg: ASbGnctO4M67INRLJ5Aiet0hpHoI3TeoozisjIpq8apsaEHCfnyPWxmgqUM/cUcRnTX
	hH/ozV57CJFViYpknOEOVghLBiSDwTW8cxVLVcSmDuJ0PESlKyLWKnH2vgcfFRHsHQ2VGmz0VNG
	eI2/1l4Pv1Nm1oiKE8lghyxuHELB79mNvLUWjEGuArDae/J+SxsjlA5faeHfNB3dSIU71B98qtv
	EUjZC4r2i+B4suQAUMvZ44eW1kbDfS1RMBui6MJWwEh/Xq3Jm6QnlOb20LgmjDz3Kn85oDUJC0H
	fmha91b7d644tamIHwckKQfAvMSZX08pfPXZEL5Tr282bHsuRlqC61cpPVK1
X-Google-Smtp-Source: AGHT+IFO2FSa+xQWdLmtuKlKo0tEBUduiG8HDfdozWd6lG/VFdAHRJZVwS50QY1s0aePXNuu0vX5ng==
X-Received: by 2002:a05:6830:418e:b0:72a:48d4:290b with SMTP id 46e09a7af769-73210b239a5mr3495379a34.26.1746649358947;
        Wed, 07 May 2025 13:22:38 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:38 -0700 (PDT)
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
Subject: [PATCH V9 15/24] dt-bindings: display: sun4i: Add compatible strings for H616 DE
Date: Wed,  7 May 2025 15:19:34 -0500
Message-ID: <20250507201943.330111-16-macroalpha82@gmail.com>
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

Add compatible strings for allwinner,sun50i-h616-display-engine. The
device is functionally identical to the
allwinner,sun50i-h6-display-engine.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../allwinner,sun4i-a10-display-engine.yaml   | 39 +++++++++++--------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index e6088f379f70..81a173b41534 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -48,23 +48,28 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - allwinner,sun4i-a10-display-engine
-      - allwinner,sun5i-a10s-display-engine
-      - allwinner,sun5i-a13-display-engine
-      - allwinner,sun6i-a31-display-engine
-      - allwinner,sun6i-a31s-display-engine
-      - allwinner,sun7i-a20-display-engine
-      - allwinner,sun8i-a23-display-engine
-      - allwinner,sun8i-a33-display-engine
-      - allwinner,sun8i-a83t-display-engine
-      - allwinner,sun8i-h3-display-engine
-      - allwinner,sun8i-r40-display-engine
-      - allwinner,sun8i-v3s-display-engine
-      - allwinner,sun9i-a80-display-engine
-      - allwinner,sun20i-d1-display-engine
-      - allwinner,sun50i-a64-display-engine
-      - allwinner,sun50i-h6-display-engine
+    oneOf:
+      - enum:
+          - allwinner,sun4i-a10-display-engine
+          - allwinner,sun5i-a10s-display-engine
+          - allwinner,sun5i-a13-display-engine
+          - allwinner,sun6i-a31-display-engine
+          - allwinner,sun6i-a31s-display-engine
+          - allwinner,sun7i-a20-display-engine
+          - allwinner,sun8i-a23-display-engine
+          - allwinner,sun8i-a33-display-engine
+          - allwinner,sun8i-a83t-display-engine
+          - allwinner,sun8i-h3-display-engine
+          - allwinner,sun8i-r40-display-engine
+          - allwinner,sun8i-v3s-display-engine
+          - allwinner,sun9i-a80-display-engine
+          - allwinner,sun20i-d1-display-engine
+          - allwinner,sun50i-a64-display-engine
+          - allwinner,sun50i-h6-display-engine
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-display-engine
+          - const: allwinner,sun50i-h6-display-engine
 
   allwinner,pipelines:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.43.0

