Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110891;
	b=k999g+/5T0g26Em0Oy03j58J/NVJiJkZbdKgVavCNiCY2I7KWhVwyvb9IuYTLFzbmYcM
	 3J37MIkTwuBZLieM223RNdtdZ9i2Lngl3olGcso72Bwv8cBRAkn1x5iAm4BZpho5bQ+mH
	 Cs/Fj4Tt2adxdNembfhG97svsZl6lj4zkrjKuwsoCLFxP4UAnjsL1VPq5LNPt+T2OAT+0
	 bRj9BHOPgs8m81MzJ3Baw6k7xLWTmITst9O3EqR15gHMTbre5z4HALMrK5BiktpLTLxTV
	 Oz1h3kJSfmCUWm79rEpj0smLoGLN6V+fyVG6q8fnRda3fBqRPNtcfjljhpecd9JvkaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
	b=sTcM7cg3IYi8v/m+xZwjrCq63cyR9eh4vZWWkZwIOCLxgw5iZeLbvGJeqtdkuqcP87Lm
	 o1Z/mLCq78oImBP4rrjqZz0VsefSJCAyC9QEg1sy/WbI9pUbut7Z25SPQ6GwVlq0b+laC
	 Eb8Kx94FDHj5w2qLTtYKLpqSB2WX3a4SGslRt0vmgwwek+L5y/DdLdlH+ARrICOKK1ap8
	 myRtsIlUzTSsVzcmQpbgW/UWYDXdi0rFAo65T7RfvRNPzbZqxcqu8naOxAHhTk8pQUsPl
	 FTAjRu8Eu0XHKuu0zWt0OXGPOB+P8x3yGlefCUMqTld3UiJJcYcfLrTLpkNDYDcbdnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWJ9BAJx;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEA960A2622
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FEA960A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWJ9BAJx
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so1564630f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 09:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110889; x=1795715689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
        b=XWJ9BAJxJSmUendwDXfAd1b/x/fv6mTMKoKoYdETiSNX5Ua3gVGhqf+6M9OlUyPZWC
         nYXvmTMbQdaq0pQfPGJjRS43qI2pFR8T6OS50XqEhkXf6GhhY/E5/uTyOovIegW0lIm7
         cA7JpVYEwT6ig028vSHy3PqvenTfr9JC6tf+cabmJXcrWejJ217DT/EJRqyG4k1f6QwI
         6JDoOJwxuYZimKYUc2lKzU1QokDzd3NaKsDwJ70Tg+Y6swmAO6kHsNYo8yCe1d6lCnMc
         taKIogXbfcP1Exi1/6v2CCS4khBwiodz5htH4jJoCzlEBkC5hc57IqpFpAgFfTS1jIHc
         +dKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110889; x=1795715689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
        b=fJrEpRa1PouDIPLujUR2V9x5q960Gpih4OGPt9OLpVcQk1DKMqzlCXOHDnQojCz+FV
         kMaqHvytxXi+PtrO9IIsL5/cWcDfI0L9vajJ6w1XVDVuxb4FrL8qxF0dw8qeikJwtCtx
         bAq7tKkocr+jnMi99nWDnWpFLln1a7Koxem5qksJezbSq2edWhsT8AoWLNqt8F99gqWf
         wgOyyrwo4jl/va9UaMgrBfVKkLtQigBTMeU1xUHGyiqEvdDR4nfoY9AjsPeXHaTUB9GK
         gtW1izicBEhtJZzy8/XaZ0NjpZki5T+4npa4pWHndS/eoaeM+VCK9NPcE+h7AIrIqlNZ
         hqxA==
X-Forwarded-Encrypted: i=1; AL+hErGFzXM7S8HoqzZmEcUpFP/0PgwNGJsqko+UCGXZF7Pkj9pyroLzYezwK6I6YLgMP79uHX9VtWJSdVP3bA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/oBKM6jMV4qmxwWNuD4n5e6ovWwyL1P1cWbbB2HtakJOqDOuS9
	FMSQkpCgKfJWHnNkqv3/BzqlxUTMcBXGVZnJo4Gax/EUIseXx7M8ocHtEVgpfw==
X-Gm-Gg: AYBFou0hRouIiN+he/CYfycaOec5EkiC5+oxXgG1Q3/+D+LB6c3Z0XoJGcKh5ryaofY
	q60L1mwk/p4ErHjsZq6FlwJkGBd255rqYwt/CpI4rNWQq4giWHnR3/qOvsja/fatCperbB7Z9u8
	cVj6VNbYJl6QjOpWQ1ZTLyEsY6vK4eUL60NsUPJWXGk9m9RCIzU8bBq8ZTrGZr0YsA0Raz95B7s
	7vPixpWGAqy6ATVqnESzG9QlmMltX51U48dVgYwjm8+og2aQVBFs1XM3IeuMLy1UV1lf9TWcGbW
	US4LNR7F2TnWCR58fn1Z0V8H1VFliLzv65ybwWY0JmlQF2o9wUA6Jdp1XUAQilMcy1jFyCTTqST
	w0Td1IItVsm3gV3l2Q8mA0Dw1K3R/sTA+Z6lP3CMZwkQqGhlAl98lRQEP722olOmn6NodwW5TwB
	Korhb1iLtxKnxm0/T2mbUyMmuMgAOUFDDyPzhgEptf5NtyF5y6vktB2U/lbN3oUj2WzmYeYg5il
	sZMsQAh8/44b9s7N2qT7dusjwUEMfFO/4lJz78L2HdYNCK/ZOlUuhnPtUSUT6iSm8IHrIC+osmb
	zxHq1ncRI1eAKD8xUyTjby3FGyNE0WWukzRD/GieEapLqbgdmSoLzMsqirrgNXpNVlFqQOWwjJ/
	Y6nIO/3LsEj8JZPpnCO6U3RNVXx87GLwtQJWnastCvO+yc+64iab79pJhbwzmF1aBRMxV38X3Wl
	G6S6RCFk6SqII5buMrD17Fsfgop/ysxHHC+GRZIc9IGNCUIxgQCzlqR/D/rTb+8Vap6qvsi69Hk
	Ac87gbigFZjyiDd2Si5Cusq8UuUjpGS2WTjHYX+cWGWiQAftBLQ/1cj
X-Received: by 2002:a05:600c:a11:b0:4bb:69f2:87f7 with SMTP id 5b1f17b1804b1-4bb88812c92mr5507015e9.18.1795110888897;
        Thu, 19 Nov 2026 09:54:48 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:48 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Thu, 19 Nov 2026 18:54:36 +0100
Message-ID: <20261119175437.2520400-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

This change is intentionally not backward compatible and the old binding
will not be supported by the driver, for the following reasons:

- It can't describe the hardware. Plane register space is shared
  between all mixers, but the old binding puts it in the mixer node, so
  only one mixer can ever claim it. The second mixer can't be supported
  with the old binding at all. It also has no way to reference plane to
  mixer mapping registers, which live in display clocks register space.

- Supporting it would mean keeping a second, mixer-local plane
  management path in the driver, with hardcoded plane mapping, which
  doesn't match the hardware and which can't be tested, since nothing
  uses it.

- It was never used. Upstream H616 DT has no Display Engine nodes and
  the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
  upstream yet, so the old binding never produced a working display.
  Vendor BSP kernels use a completely different DT structure and no
  other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
  H616 display support. Only out of tree WIP patches used it and those
  are updated together with the kernel.

The driver will print an error, asking to update the device tree, when
the old binding is detected.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
2.43.0

