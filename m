Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989FE30148C
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216065; cv=none; b=t6PXnlhyx/0kI3R0IQw50MwwETOxdoeovvpu1VUlUsgFAoRRslqY1PDG6cryfJHOjhTlRnUSCBbSs7zPoBMJeVe7a/stLDLqXFISf5xx9s+mWUcthWYAtQ6VlR+5YmxJ3termdrVdRLe6gPUnX9pW5CeH1QRAwx6o7kqnd5loxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216065; c=relaxed/simple;
	bh=/HxRScD2cq+UVkPX3OMV/vSVclwgfb2Shsd0VzOJaW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAU6cDB45vfv88SRRhpt2zbJTVCUVBYBEMbnera5U8Ce1FRMAlP7xzDmWR3viNxaddTfDVE9wVPn+aTk4Fm3aR82DnY/NQ1wjWbhiKBgKzFelyB88x5BFvUE6eHoh1d50CotafzedPC9MoqBfbADYWi0JuZZzInb7JYD8YrLrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlFnwFw7; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlFnwFw7"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so5265319a12.3
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216062; x=1763820862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LChDHbx4y116grQ6jx2/dXjEvBwJOxeh6WSv85ZRlvk=;
        b=TlFnwFw7vGF7A92Bnr+14uLcIPT7XaXohXK1cve8pZ0dXOgFFEICKOsCr9rSYvOEsC
         diT6YPfgeEBxXjMIMtjzo+Cqay5VK1gY3untykXMuI7TlYjZrSurDDyOQSPOLvE4Jhlt
         3k2jLd6EtmYc8vIezimsm3CRF/mOAL3VR+dTbh4i1aJLfj9UXHzdv9MtCcK2JyMsClj8
         Y3FJcX34D6efykbOEWrqDYPOR+1EzqgS9/TAn0DtqzWAVhewzbfdkojUU1gHTcYX68EQ
         ID1h7kBI/EDBl/kDAWy7X31tjIw0c/2hsmI53NCxJSMJF+daA9g2VDreRI7Ffkelw3N/
         GXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216062; x=1763820862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LChDHbx4y116grQ6jx2/dXjEvBwJOxeh6WSv85ZRlvk=;
        b=JjQ3S26p5EZkOYdz8DbnimetYGTEtNNSY/6rCAWGRqokdcXJtfoDD08A+0f04hJN05
         oitA9oR+kvFabbVkAv2qFZxEOcttjWAhzTBo1gUCA27nhD0k2SR1eZ3Yv3c/UWl1yzad
         I242Ke4XEdGATWFjxmW4us/ZaBSBl4oGYbP55BiuGeVlVNfu00l8cWDqCOkDep3l4//V
         5FoQLwRzVmsofTixQdLwh9/LbO+b7IoiDD1hPrKuZo0LlrupOj27zUi7xLaKWOlBXMeT
         RBdvw/mUuYrY1MCeVfl6raJBg2002D1L57n04S+kcBZm5AFO4pff5nfU/k2XssVAW/WS
         vM7w==
X-Forwarded-Encrypted: i=1; AJvYcCV8RYwhQ+3J3BE1U0RA/ubYTSWEhWZCXSuU497YN0bGs1ZqsEFVnvTbAL+p12xXch+QxAlzk9pQ65p3tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAWrp/2Oj5dz4XZBbPoGCy+Y0z5OR/ZIuZxrLRz87Q5rmw1FGN
	a5OEu58ZmqqhBjLewVfoPpipQ9W8XivCf7y2vFrqcWrvTpOVDT/46eoc
X-Gm-Gg: ASbGncsZOsauwxywJsXh0S/4r+hKhhfCLiSIbonHHRTiWL+KFwGu80gYYWT4DRUf4pD
	BWOilqcencXDUFTd8TRXXNY9IgWMaafxE4+HNtifTxHJwP406ziEtZKRvVPWDNfyLx7cXmYJ/Nq
	x+62/CoDaMYakQWuiI33X/OmyvoxJD3GcE1zISXLPn6Homo/exSGxMuk95W5d45wsLGqz3u1Mom
	yvkXISF7pQdWkghc/tmeOgEs8VIFlhUpiOlNw1dKNsdRlwbh1kMHEjYCC1+dVTSuK/ogQk7DWul
	RAFFOX0zZSIa3HhB4DRldGltWNNcUTKJ00hdKLOFJCkrm7wzYHlP2+vkxcyR+iiT9nOj5fLK6rE
	A8RsVRvTOGarZAyvEfoIa6ScT/eF+6LU7zHP+VTEaW/bi7SMKpCFcd3P7x16iUx4muYbwMK6kBL
	fPNlVuuQYPKdeoBZFoMr7GUgWbqi8Y47gWp+f4VSHsWhxoTU4HlZjtqVpYRQ2GbZ228GI=
X-Google-Smtp-Source: AGHT+IGK96g9RzM8eg44aCNe4s7zkdHo6HIsmO/rv+pQP0RPewfWCNhEzO33viKn6j62oVKNtGFutQ==
X-Received: by 2002:a17:906:fe07:b0:b73:870f:fa2b with SMTP id a640c23a62f3a-b73870ffaf8mr113667666b.27.1763216061567;
        Sat, 15 Nov 2025 06:14:21 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33 binding
Date: Sat, 15 Nov 2025 15:13:46 +0100
Message-ID: <20251115141347.13087-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Update DE33 mixer binding so instead of referencing planes register
space, it contains phandle to newly introduced DE33 planes node.

There is no user of this binding yet, so changes can be made safely,
without breaking any backward compatibility.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.51.2

