Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729483;
	b=jif+PMiVLUcM2Nogu+h2zt8QE3Zp36m7VgZFXRRe8hO/7czwt4f8RKtoVnuC5uV7HJ+l
	 e2zRJb89/4RLYPJXs3UcqoZ3/0pnelazrNAlmrZswceNdwv+n1dn1upOIy7L5BzfmYgzi
	 CURuiKT91RRJSdOpxjotyBT9dArHlXYDtjn001Yv6OwLU+7hZwSp0LKlHWIhKlo0PgfKu
	 o+AZKb6gTrW5iQn1ZGv7ev/5ZXhKwqEW/NhZszMHRRd6quzyyk48LJVB4dUYEWhRskCar
	 EZayDeyCEbtjLsyig6o7V97v/uay19H21xAvIW3W6o62Ah0frbWT4qc5xwPGuKPYNpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=;
	b=LqfJen3gU1WWSWjlC6Dc9puvogGa5iD4H9t4I7I2SvWfTzpj5OvO849TzfuHfQT0qRlw
	 Mp9Be4nv89c3crKSI+Aekmc+WrWjGgXefd2fFgKQV5ojhMDDRqgLPNpYM0J+7V2qP+voZ
	 GhrYndQtvyB2rFyqQuSw959OgGxOpRp9vA3hFUzmUyUb3/5m3qv0przo7DdPJ5YZIxPPo
	 +kIkYGwYsaOha1NPTrlLy1fC2C2l+7SIp96Zkp5rMdLNvqAad/DDl+gnAjR0ip+5nGq3e
	 0HOjDzR4h8YlWe7D3K9oox1M7pQogTCrIZcAGEK32/UnqBj7XcRY/rXwR8ymRyD9eWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOvp4lNB;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D3606A6A2
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E61D3606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wOvp4lNB
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so96304985e9.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729481; x=1796334281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=;
        b=wOvp4lNBQze1FQ52P00eIySTLqgJDzj81MM3+CH4vI3AQoqoDo39Jcn2LDpwAGaZfT
         dDPKE11zHXtjB0UnLnAOPkSJ3vCfcE7x2bUzdjW3WxMofA5fpXZ3avhzhTpehZhMkjpa
         PO7BW6ug1ZiaGxSmakSvgWAbx4BVLIe157tDTfm3frH2mMbaEIgaQw+BLJCLaiKiqTDV
         FYFn7RlqTqI99S+Dcx+B33s/jneZD9+SYjlPrbY+bmXPtP2Kda9WJJ7AwGvQB+SMbG33
         rRVNk4GAJyeqI/MPUg4iq5vfXvEbqGNqy6ccgwLI3BDsntyZkgsbdMYgBM3BgqBX8tLI
         X/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729481; x=1796334281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vAPLB5wINg8+k5DF0d3PoxcepaPENAHu+hHbKIVA9v8=;
        b=pRQ9q4I/d23v+ZkuqztnZakjT4QgH2ul8s/Bk2k8TVfQuI2Xum7Sy1S76wp3r3veJk
         zqyePhqFyfAw7XxhqUEsPiB62tX2j/KWzYFKrmTmfTsSQmYK/e8djfGfQ08eP8OSArYj
         nUrrViJxFS9i4uyCd/JIRps33IfevlG0+Tfl5v5/6tz4a46NDu6qzEn20v5uB0iJOjRi
         YBczJEJzoaqR/GHRSHykFhtNO9Bm3/ENFMqWiGXNsTSu7hf0WdlSD7D93sP+v/0BHpNo
         xz4pIBnzsOI6KkLuKWFCMhlrkWaMtoUa7KaEqtDJGxvsmsOIQoJ/FtzEbMw2T7rcUEct
         b7JQ==
X-Forwarded-Encrypted: i=1; AL+hErE96A3aV57cYFcLTPLc+PfMuanAr3hgP2pOKNDvZ5YRq6ymR56QM3sfcJ+irD0CgW5Mz7BrebQcoztR7A==@lists.linux.dev
X-Gm-Message-State: APuU4Z+xTbtekEthV/9HCYh9ttOsWgiGX7fcHRC7x0r0z08rF3uVRpDU
	DO1b9zBG2bQ2lRMbf/tEcKcuXKJnpnATprBC9fWAtiDlSZ9YgF1Ef2IY
X-Gm-Gg: AZFdTZe/zqjuJuyXPOn3jU/Se/wh/Cjj8xfn9sj/oIijO1nId9p9vYA0g/JNsMaco8Z
	/IJaBs1e5EQnkOG1Vfkmf4JvNaz6/nph0pR/Wvc1v2kycgldsGE818VOaQHKFltE77ahQPaSM2x
	DusFzg/Zci8pH1AjfAXYAay0Hjqvm+uUdjJ6y4AXcgTm7NZeYiFZaXgMw0LE8Twwq9/9qrqNT5z
	UE0Eo+M/SbEtyyBVCMxT/aQ1MVSNTCGp0NNNrXTaHkAA4wYDew9Dr7rnqzHpLtP1Dm2AUVGdB9q
	f2FuuyfYwXGLAEffcyrszZ3eY2AtDqAARs8w2ZBgYSbWxKo4m+4botj8BTnQkn+FAG/KJo1WjZt
	FAPh6gf7G0HnKGsy0yUZbzLac/QRd3YlR5c6CPegTTWfv91vR6s1K0jXi/PyVmijvGi43QFYGTB
	yxcWTjTTYO3QoRzhMCIgUfgCj804cwxKCUHitoonnTWM8bc8SSqeUrVFd6GuugWnDL5Xte3Qrkj
	xsPDay8pyjg8G6vKLqRMVhhMWGKrkYBGpv0IxXfxY0Yo/eHJM6fnE7rxAy5yrhnHAp2pXgdwJDh
	/qeXAIBfPrpONpLX01mDh/T+4ffUHgQP+TVVc+JU8yFZmbpLkvU04K7oq+ZEkr7XnPiFHj+3NDm
	fk/KR2H/inE5R63Yx2ouADpplKltn05Wv/YvBWAK2dYWwsRxj/sqF+dpFQyw0MGy8GswkaAaJQ1
	//4ui/4IcyjSwDSOTMHHz+EBUVcTK9/z0jNt2YhHtw+8Bw9cQtX4KbH0d++sdFtyfXINfXBTJR7
	f9ElmYwxW7O9IAxc/8FbtusGm22NGmkSvbG2UDFjg==
X-Received: by 2002:a05:600c:4f53:b0:4bb:68cc:7b94 with SMTP id 5b1f17b1804b1-4bb8616516cmr559444565e9.18.1795729481269;
        Thu, 26 Nov 2026 13:44:41 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:40 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] dt-bindings: display: Add H616 display engine compatibles
Date: Thu, 26 Nov 2026 22:44:24 +0100
Message-ID: <20261126214433.3562326-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
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

Allwinner H616 contains a display engine 3.3. It features two mixers and
four TCONs (2x LCD, 2x TV). Supported outputs are LCD, LVDS, HDMI and
CVBS.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../bus/allwinner,sun50i-a64-de2.yaml         | 20 ++++++++++-
 .../allwinner,sun4i-a10-display-engine.yaml   |  4 ++-
 .../display/allwinner,sun4i-a10-tcon.yaml     |  7 ++++
 .../display/allwinner,sun8i-a83t-dw-hdmi.yaml |  4 +++
 .../allwinner,sun8i-a83t-hdmi-phy.yaml        |  1 +
 .../display/allwinner,sun8i-r40-tcon-top.yaml | 33 +++++++++++++++++++
 6 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 232252e8825e..18ec57448edd 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -26,6 +26,9 @@ properties:
       - items:
           - const: allwinner,sun50i-h6-de3
           - const: allwinner,sun50i-a64-de2
+      - items:
+          - const: allwinner,sun50i-h616-de33
+          - const: allwinner,sun50i-a64-de2
 
   reg:
     maxItems: 1
@@ -49,11 +52,26 @@ patternProperties:
     additionalProperties: true
     properties:
       reg:
-        maxItems: 1
+        minItems: 1
+        maxItems: 2
 
     required:
       - reg
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: allwinner,sun50i-h616-de33
+    then:
+      patternProperties:
+        "@[0-9a-f]+$":
+          properties:
+            reg:
+              maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
index e6088f379f70..6e26f184ab24 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml
@@ -65,6 +65,7 @@ properties:
       - allwinner,sun20i-d1-display-engine
       - allwinner,sun50i-a64-display-engine
       - allwinner,sun50i-h6-display-engine
+      - allwinner,sun50i-h616-display-engine
 
   allwinner,pipelines:
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -74,7 +75,7 @@ properties:
       maxItems: 1
     description: |
       Available display engine frontends (DE 1.0) or mixers (DE
-      2.0/3.0) available.
+      2.0/3.0/3.3) available.
 
 required:
   - compatible
@@ -96,6 +97,7 @@ if:
           - allwinner,sun9i-a80-display-engine
           - allwinner,sun20i-d1-display-engine
           - allwinner,sun50i-a64-display-engine
+          - allwinner,sun50i-h616-display-engine
 
 then:
   properties:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 05ed4ddcff3a..eb8d1fd9d8a3 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -36,6 +36,7 @@ properties:
       - const: allwinner,sun9i-a80-tcon-tv
       - const: allwinner,sun20i-d1-tcon-lcd
       - const: allwinner,sun20i-d1-tcon-tv
+      - const: allwinner,sun50i-h616-tcon-tv
 
       - items:
           - enum:
@@ -59,6 +60,11 @@ properties:
               - allwinner,sun50i-h6-tcon-tv
           - const: allwinner,sun8i-r40-tcon-tv
 
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-tcon-lcd
+          - const: allwinner,sun8i-r40-tcon-lcd
+
   reg:
     maxItems: 1
 
@@ -256,6 +262,7 @@ allOf:
               - allwinner,sun8i-r40-tcon-tv
               - allwinner,sun9i-a80-tcon-tv
               - allwinner,sun20i-d1-tcon-tv
+              - allwinner,sun50i-h616-tcon-tv
 
     then:
       properties:
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
index c43b02ec884f..44cc5c2beb04 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-dw-hdmi.yaml
@@ -28,6 +28,10 @@ properties:
       - const: allwinner,sun8i-a83t-dw-hdmi
       - const: allwinner,sun50i-h6-dw-hdmi
 
+      - items:
+          - const: allwinner,sun50i-h616-dw-hdmi
+          - const: allwinner,sun50i-h6-dw-hdmi
+
       - items:
           - enum:
               - allwinner,sun8i-h3-dw-hdmi
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
index 1b47f3d99a78..fc88c5e2a3f6 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-hdmi-phy.yaml
@@ -21,6 +21,7 @@ properties:
       - allwinner,sun8i-r40-hdmi-phy
       - allwinner,sun50i-a64-hdmi-phy
       - allwinner,sun50i-h6-hdmi-phy
+      - allwinner,sun50i-h616-hdmi-phy
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 7d849c4095a3..41324e1376ee 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -43,6 +43,7 @@ properties:
       - allwinner,sun8i-r40-tcon-top
       - allwinner,sun20i-d1-tcon-top
       - allwinner,sun50i-h6-tcon-top
+      - allwinner,sun50i-h616-tcon-top
 
   reg:
     maxItems: 1
@@ -201,6 +202,38 @@ allOf:
           items:
             - description: TCON TV0 output clock name
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-tcon-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: The TCON TOP interface clock
+            - description: The TCON TOP TV0 clock
+            - description: The TCON TOP TVE0 clock
+            - description: The TCON TOP TV1 clock
+
+        clock-names:
+          items:
+            - const: bus
+            - const: tcon-tv0
+            - const: tve0
+            - const: tcon-tv1
+
+        clock-output-names:
+          items:
+            - description: TCON TV0 output clock name
+            - description: TCON TV1 output clock name
+
+        ports:
+          required:
+            - port@2
+            - port@3
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.43.0

