Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D3A3C5DBE
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 19:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353238; cv=none; b=p0ZvpQ7cMUQOGUFWJf826It/OR1qa5TTcVvDmHJOf4c/NbjoPGGq+lozYEhaB77XXkRUH5gTxk4xz4MfZZPu61Wrnuy06oLWnDzGvFfhV7lGcSmiFs9YMauuHYzaG+0yZnuDsS0ZoEhApAJfX3G7cV0T5KKVm8/MZNnX7bYnNjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353238; c=relaxed/simple;
	bh=IOxmh5MhxMGcoJj1bYSLoRwfOsdl2l4K10+pW425y+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rCIw/qjxWkupoC6QEwBGaguXqFvj0WAHHu2J5ek7H6ICjDpzPrbTCcjnhmtkaNRjpchVNcFeDmRjBROo3wn3GFU7FP8ICFJn38OO2cNG+r91l+AbBSIdIE8YRJKRWvyInngrOnJUZK6x7dRiZwFOqjjk9mLdBHHAE8ZGzvfkIv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Th7cNiuC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Th7cNiuC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso18195005e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 09 May 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353230; x=1778958030; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPkvMBVXyvicDPmrKpPPSuducOnxVL8vyxeJt4rQ8ag=;
        b=Th7cNiuCmqkxl13eJvnnng7pDELKradPIZP1599K7xAHvZNSt34IET+7L4iUAOF+ok
         1IPHRaYatE8gMZVXyLDtCk/arOyOvg9J5IAZVltbbUsEuq9okpFAuUSsILUj2BYxcJrL
         oppe1aaUR5sXrNscnAJGghKj1mQsYvXcGcw58thSfPa+fScHgo0A/LirDSaTrYwzoNDN
         wMnjgp0WRpwJUSQXbXTavKlw2RJ4eJ8JElNL2bxUer67kBlzvpYEvdjRXrd4Rv8fohTy
         6fVVEFMrKJS1lEPkU8CP4cEX0XEIHRWzUiy9FH3kKokAzi9NputLXUu+eBzuijMZJP5v
         vaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353230; x=1778958030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VPkvMBVXyvicDPmrKpPPSuducOnxVL8vyxeJt4rQ8ag=;
        b=dB+8dmCwBZNlOgcSYmxPORlBf0FpgqrSSA7WMg7tQQKcUyGRO2KNxRDb4SSRlQKMTE
         /dwBKswVQpIvQpa9VVbMTAfWv9By1pQ+36Rsn8E5xApO5pFm9LvfWPpYETeiGPptt6PK
         G+K9wUQbFjHDrGZ7bH18zd9sMMgaXthAGD0gCqBCVkL7luSuNIihl1ofcj1Ue9z/fGLc
         t51S9NPHk5lySyZ4nz4QhdCEBFGKMco/96VpX95MFy9sHQl4kpWVC1JJz/HAmK2jpc6j
         5TyHzEOUL6WcaEkvqQhJlJd5HETxgVmIxTDPM+Q5U1hdLijPxrKsvoDDcwybmlb/6XGN
         4bng==
X-Forwarded-Encrypted: i=1; AFNElJ+JE4eHi0N841IPWbzROqFsaX5zH3W1dU/EBJcMcIE0nDJIY5qQz7ayVXbgEZoUxRmUAAQsHQ5USEc+Nw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKNjVnvseIqVsneeGFtU9kSNlxRtTGMSGol7HhfbkyP93kk2zs
	VIv/sxzCi/+08WliF490yoAY4N4POy/ecZ6JDXhG+JkVCerc1lD8YZ5i
X-Gm-Gg: Acq92OGN7rmOJu0kJ4AGefqlbBtV55dLE3krDzVOkjYKS2F07FKVa8A3DxVIW3pouGG
	UqxUwjsHbjwA/b/WjZS/fqZ1aO0h3pthx34oWMo0bVESL7NO23aPgZ8Mf6CeTIZynSWLe0avZys
	3fsByT6g0pmWDs79HYL9d42yGrzqqMrqK/WQJs9fETPn6fys7jhFQVu/Y30BQtKhpj/zUVaQ3nD
	VDsd+AWNLYdU4S1KGrxtk6UNzBzDHr6PhLR+Wshcp5Se3Dl3UACHg0CblFV58OygLTUaOhFLDKB
	9ZBRCppnvy7z9rvAyIM2+/Vnc7NjxDjTB3raHjYQ0coFKU4TycpvBxtu3Nu0NtqEZWC5w7ccnSG
	TmFLeYJMlWVr8yDdfpboRzGR6FqAIXI9dGhFxOF8W4AvS75pMqvbl5v3bSWzxzrVvmMdkCY525B
	n2DvRpswdxiXOUuUwViuVCCjP6Yqk2oQTUFmf2QBT2QaJXqQUuTWl9KIvMMx/wDxQ98tQ=
X-Received: by 2002:a05:600d:8:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48e676a4e03mr117153245e9.16.1778353230046;
        Sat, 09 May 2026 12:00:30 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:29 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
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
	jernej.skrabec@gmail.com
Subject: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Sat,  9 May 2026 21:00:14 +0200
Message-ID: <20260509190015.79086-8-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

There is no user of this binding yet, so changes can be made safely,
without breaking any backward compatibility.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v1:
- update commit subject
- reword commit message

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
2.54.0

