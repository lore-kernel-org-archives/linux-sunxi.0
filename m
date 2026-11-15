Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723093;
	b=rtPgNJKPUbxmSsqyC+fiStKWB8KWqJE+DizvB/ZR9hDQZJw0AvJHdKiXrb2QGek5TIBd
	 5+enRR1qFHMOasPIoW4G1g6vyp6WctBiq195/bWRcELanQ8uQHOVm+pwnx7dCL45mXPug
	 6Xzqfmuea162NNIJEVjAX52IQmGPpPLIdrVdrpH4nlCIJG60bc8au3G0NSI+j/ytZujyB
	 7I55OgJODFf61zt2kYWwTt0Iw68A3RL4Dbt8eOuMQ1tQxEUqBr0ZvT5z8WMEzQWTHMKEM
	 teaIcwYqWtqZArfN0ddvl0qEW1DOBDr/uDOjp7sW8Ls9cp5NqfFPN5nrdfXF6XeCVTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
	b=b2CPeFh5g5ZCg1qgp54Rrkqb9I3It2BAy1aKapVsKGGyWuWMSAxxNPKmlDsxM7jFd1sL
	 DhyWylf2aswIrJoUUl+U3avLnKcTxyXP2mGb3i5HG/GBEBPX1qZsjvCDu8AojvnAafjHz
	 SSH2Xqr6EO4EtcvyIEJzS3hlEjjxkp+JYkmm4Xb8TprYwK1a4O85KwDy8vZVdo3Ozy7BB
	 SpS5HTN4avK3cG4bT5WEo53ZySRWmifZ9lCItHfTVd66VR0fUV9HRS3ma0amJWoJ8xi+O
	 aWcXrDU/4sbyVcnCiaTo+EnAFjNQ5flb3rSDYo69PiOmruugssN2/PGGrDKmPsjfzhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsqv65wV;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB98606A897
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB98606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nsqv65wV
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso9534855e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 22:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723091; x=1795327891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=nsqv65wVZ+WB3KOqfKcr7yO+YYGyIni2LQTJhxOpTka0lY39VYLbYGvHou7nh1Z+l4
         MjbovEJEDom+4uriV7RZ4eJBQtW1pcEAMDgIX+ZXlmmOR53xlLkGwVX4eNqAKzqLlodp
         4eJbi29TLf6rC7H9JgqyFoamifXmhAsbo1HwxtsHvX+aFAqdWoNYZxAIpORU4HoMs3pl
         xUfHCfi0IElCtXLrqy4tlQ9YWHFr2yP5cujjnuqGrC7b8yVUmstJFkFuVI8P05xToQSG
         0UA9P0rT4rOit0atVRAnfKQ7UmyfQiWcB/KZYxiCj3K+m1OQpOYvz2YJ/CtCQ1hzqzNg
         2Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723091; x=1795327891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=uRWIJOmTy/v+Kus5W5pyu22L7KHsvpra+WhOBZxokwQEytNUNbruYfqJhem/GTOoTk
         8LrWUh+D5j69+2sI8xIU3GB09yBXxWXqSrLQQSzmPEmf8C/JXrJH+qfzR95yblTIk7Cr
         36y3ncqFVYolG+PanMidst/yjrawOO10+dkbUp7aWL2kC6GG14ScHbRbfgjbOmxi/qGk
         +RPMgyeb6ozviBudiF7dzb3evWBECTnHHygGx4RyaSsj1Ywp5dXBOettPGJMVCcRw57/
         6qU85tIlKuh3HTuRkEriY19J/KvrErCaug7aMEgisegOW/AiOJv/KGUF3DW1xHv2CVWO
         Tx5g==
X-Forwarded-Encrypted: i=1; AL+hErGRW4ZKfwtPGSkxEG2m0UOa180vAUEBKU1pq5IeegqjLLDbNLKDcInV+HDf9g1WO6+vwZnvpgmIqsv22w==@lists.linux.dev
X-Gm-Message-State: APuU4Z8xYjkMUPD+qHfcKcCpn1i/NPNq/Kl9A6GlbtIMD8DrA8hMsMzD
	WwDCsTQYBGH1PHiiTMdshBPuXfRi3eYMPrYR0Y8F920RaQSqo6vwGoAS
X-Gm-Gg: AYBFou37vWRQys2QZLVv6o2Ft1/hqk4zDEESR/0WHrF86Scn4f9uYqL8H/UJ6dXHNC7
	ERFhskcfm/QccLFEhbfFO5XxjTPk1DK1t66VzrybS42/4GZsZBaGOzMIxI76oP2LUaQANey4aXo
	ivEofj6tNu/cjJfj03xl1LIuJlKnwD7C9Yeu7O8cURP8Kn6BeG/03Yqyr2lCPyXFD/NvIeETNfL
	tUb+D6icJzbOxrTLc9lNJfcFo5lp6z9ykCKE+gp0S6McC6QIgcTdkhyiANQj4FMTbEmUdu4OGTm
	k84exlJUWrwtmXwbHLxD0OjKxOOQqi8dcegxGxglDWLUeQFBSLfihZ3f1zHbHLdjnhuhKqipr1k
	4u+vBY58Yl00N7XhWbMdV3x8W4jtLNMc7x3XK46n6cS019SDphxe/Ov6ULoU7E6R895JJ9sLUpU
	D4gSdhuAX+74Pttk2jxtclHsxRz17N1hjj097IitXoYTcUf5EDvI24ep3M6BOe0qlG3SKNp6gy5
	lyK4Yp6HSLZVu0KRrekEbC1fJItwu+ccgpBvFAxTrx3aRBx7HZ9KKHIcJuFsfJx9hbjTsXDwOG5
	ePXnA5+yR9kcQXj/Qz/4KL7nyKDDp/U/4vnim/ACJuhnAvMHbqr9uE3RE3JamXpA8T8PTl3kN2F
	vtUtXTtJsWrZ2GBroZoqnWDAyTtYtELUeJ/0dFYVLF2j55qhLPk2MbiqkZTbERzmuda1htZsToa
	6gM2eiuunqj9zC8t8/Fn0jxSZdLPIGVx3zOl8x403LkDIeXeuLfC0keAf5dXygGGAbPqqf81CsN
	6GWK92wVxGS1g==
X-Received: by 2002:a05:600c:3112:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb55a4ebfbmr158351435e9.13.1794723091535;
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
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
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Sun, 15 Nov 2026 07:11:01 +0100
Message-ID: <20261115061102.229680-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

