Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60A28EA78
	for <linux-sunxi@lists.linux.dev>; Wed,  7 May 2025 20:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746649357; cv=none; b=VBvMdz4zC11ZZBHGiEVUjb3mWPIl8s/7wv58D+VVgQhe52REfTHo5Y/sHyEcFPS0c5C9Z4NGGvE535tac9F7Y8uPY7xTWfSNgTiMsSe0Bq2ZQnSbZBjchlfNK3ZNbPXxapw8Dg43Ld6MoGtqpUZAjpVqNMMscaQoEKba3CnoMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746649357; c=relaxed/simple;
	bh=7vLz3rjjqDY4MqwZRIg3tRY0XIdpWv8QPgzT+83NvjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=am7y7dvbdwjKx8ADJzb5PtiiO4Nfmz4ahU5mBrBskbsSMhhexW4/w2jRCVV4P7OyYQOju3uqfSifzLSy2vWquIjGZpXCuPjph9eacYM7ZjgcCGefUHgJPzOJkN1BBDRJKz4MJuE+xpFV9AW4awrmgI4/CeHKxwJ4MauffAF/kOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEJwLnKq; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEJwLnKq"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72b7a53ceb6so197421a34.0
        for <linux-sunxi@lists.linux.dev>; Wed, 07 May 2025 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746649354; x=1747254154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seKIm/ljynfx7Gt5G3g1qPbmhqkI57NM8oBXOLDsPF8=;
        b=WEJwLnKqUWhhmcvT2e4Y1ng+sphj/D4qKZunwnUJr3Hw+i2lMAqIzs4dj06DBjsHE2
         sBMJpxvuV30Ke3JSpEgW5OAqtcKNkj6UaHjnumOskB6ygLkEJkf4MiWgQD1hmlx/EyUl
         jic/ZdQvMI3HmpgbQWPxla0OdRuzdK2DJEceeVPf9ziM5LHkdQG1G2UFADMcQMGwqHpR
         L5HOvvQcNr8LdmxS98+X1CNtgw9pg/fHfSNZ0Wd9EPPSTswhau/iEAN9s0kD0uXhLb18
         1jg/Q1YN1NP2i1nJqzAO+ht7+Q4datEUG70vXhXNo9Ti/F2KNPyzLeCBs4TYHu3//gXw
         xHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746649354; x=1747254154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seKIm/ljynfx7Gt5G3g1qPbmhqkI57NM8oBXOLDsPF8=;
        b=lABtdKKqRkiPx2Za0IKhq6wTK+JRZAHwRDaXnS+3/FLODyH3/uGF+e+l5Tr2kqkbpz
         3n42iP/PDzWWsEOgIqTMHBC1KW1IFZdqVZzuJNM2kfipRwoVgN6jgsZYzdKoY1Xg5xlJ
         CSt3mwHrhXvwJqyXZx0zqslyia45JiLvdaaKmKK4IvLpadJhXCjLD2NBzoYVAskX0deg
         8qF2Amk42L60WKMCw8ZZCNe13jwOk9PF9M23rTSonrJMtUWJFgl/+V/zlBAHUMJ0JF2g
         dufT1O8qMeI98DRSOeJr1r2Z+ynU1SSY3ASrn/75ee7J7xdBDItqfPd1WrSseOrazFUT
         Nggw==
X-Gm-Message-State: AOJu0Yx0NdXomcdLtre4VnOteObYkAz40p4SF3CS12quw+Uz2sHfEvKH
	gmbetCk/bygV4olIcaLaR7gJJbcpalA0YO+HCtqr4k80HPwjmVYtUoTwHg==
X-Gm-Gg: ASbGncsRMRizf4eerVHfcx31Hf8Kk/Z4SSKz89+4Y3wKHoNSRh7A/Cu3Px9TSnS/+La
	91o+ICFd6JBdpup9pckof4ZDYYhVIRhgE+b/f8yAe7PwC7fntJELDX+euD5yXzKs68gKA47btgx
	JCsam3G8kSkesy4D45a8IoEYGeLFnbYZIb0aPlvqRtoHJU5trpTpM6IUDRzY0fFYRhR8Yni/V98
	SR1M7qlFN7N61Xla5l+M19AN4yo5I+S3c34jOxRjJcEzxoWP7xnJxe9acZKnxEvHtReyPAAR1Uc
	Ere7RuIOcinv4N+soHJ8ecAuuy7tY9Epb2Q533OAVwl33Hs0oSg3N4gkJKWheMG5ZiiyRR0=
X-Google-Smtp-Source: AGHT+IHALZ6h0iSHrJndLa4ejWvNDTzp2WRFgVlLimexXrna9Pc67+SeUmi8bDDRLkq9QHonddAS4w==
X-Received: by 2002:a05:6830:33f8:b0:72a:b2a:476 with SMTP id 46e09a7af769-7321b364c5dmr525759a34.3.1746649354490;
        Wed, 07 May 2025 13:22:34 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:22:34 -0700 (PDT)
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
Subject: [PATCH V9 09/24] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Wed,  7 May 2025 15:19:28 -0500
Message-ID: <20250507201943.330111-10-macroalpha82@gmail.com>
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

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- Increase reg maxItems to 3 and add conditional for h616-de33

Changelog v8..v9:
- Correct conditional logic for reg items as it was not working for me
  when using dtbs_check
- Add reg-names property and description for the registers used by the
  DE33 mixer
- Removed Acked and Reviewed tags so that change can be re-reviewed.
---
 .../allwinner,sun8i-a83t-de2-mixer.yaml       | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad..cbd18fd83e52 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,9 +24,11 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
-  reg:
-    maxItems: 1
+  reg: true
+
+  reg-names: true
 
   clocks:
     items:
@@ -61,6 +63,34 @@ properties:
     required:
       - port@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-de33-mixer-0
+    then:
+      properties:
+        reg:
+          description: |
+            Registers for controlling individual layers of the display
+            engine (layers), global control (top), and display blending
+            control (display). Names are from Allwinner BSP kernel.
+          maxItems: 3
+        reg-names:
+          items:
+            - const: layers
+            - const: top
+            - const: display
+      required:
+        - reg-names
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.43.0

