Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557110;
	b=gnlaq60mygoBxnXi0mKzQD7If1S1IheB+gdAafahb5QWJML7/D7I8Oy4YrJyWKiSEGId
	 ohUbpCN8gDraTQuuJFH9WY2NQl3KgnAvrPvZqSq2/KTlhhlORrvZ3WGbcbUJcim8iljud
	 7igDhZXmXO8+y3ZXGiCYJPj0IhBEv+qv9FRKz6HQkiYQQvkrKcj9tK8G1BQkY2XyY7Fqe
	 PJqoOjtzlmWJwYZs4YwB8YoyVSDRfv7vLjJc8ddBXuBDoAGCRHzTs53Q0PfYGU93wEfX9
	 2oP1lPdU7U5TZsYkvE84vDTUtqC2GRb1vEKRHF1uScluBW+DctSsECcglQAmDpmcMog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
	b=k8POBbEPU0VJAoDsgiMQHD7veXX2u5fT9GA1OIK7cbGXracx21yDUe4J/NF2TotQ+Pcm
	 RADDAfxfelsEC/dNRvQge7uzhylwi6T3oJHaLGCZqZFCcr7MjuXox+o3TiA4exGZqvutN
	 TPpD8Pi9JeCrvDxo+SjYD6dJkLmAlgZgJtq7hkd8398a9yQUk0S0Ndd14JP9A3kOxsj/i
	 4TQqPXVcMWMTz7FIP23xgO/0aXEUZPTh5FTEe2ROrR3zCOs0LpU67sfiA14wvs9Mf7agn
	 0vbcy908kAAMq49C6L5XOYEsBtXs1pbV+paVMyVRGXOeRexUAGWDza6jz2JeImXYnIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKaoqFAL;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43CD606A335
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 21:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B43CD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKaoqFAL
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e46e449e8so3265888f8f.3
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Nov 2026 13:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557106; x=1796161906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=wKaoqFALWQ+E1mlxI9iT28xW/lznlXXO5x7MFONEsnOMUnzmY1t9b9G5l4OUEPN267
         jp4+j2Vjuqbyo+P0BkDMq0ghALkRkoYDV2jU4UL5uxG6WhCnBPwaKHHShXWF+lp/Iu4G
         wbkJvJ3VpAk9nfcSukBuodorcmnZnu2T3FRAgvOs15pJizMe3+88PafozdXay1WSjkk5
         cQGtkUxa4r/5w6ezKULCzNxxMY3CZTk15rgHzDqeXrS++jETZXctZ8rgIFsg/Vdo4hSg
         k/A6G6bbuxp/EsB/TnrQvsmu3NObqCe1oW9vHO44H2k49xfVnODMMeRGd/y7ADHQoInU
         eWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557106; x=1796161906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+lzNuUt8nH42DBcwcZOHfmA1SLSshDnrkcQ11wbKfI=;
        b=bz5I+F48/QVbw/u3Yd6F512ZQFmuo/UKYIs8YpMdeV+/SAzsRCEBTdx6i+P4X7yt86
         pSxwBqO3TFcU2Rt7z0Mza0GKX+YGv6I1qXNsyHBrS/DkpmRxAfti1GF30IlLDrWpj3Nb
         4i/6EPCrt4INm00fOq3tWU9Dr37OmFRXQbiUzjx5o7lh9sN7GqeNTA2/1STHzOv9eIUX
         RyZzmWnby/9PVKucm9o8UFDkq8PZhFfqbAF1Sr6g7RoaDwOomWbLwSmGQznWEh6fzKqx
         qAgYb6EylHlu47VpeI/0IceM53Zue3ZVAI+NNsy0oChZ3s8FFuJzBnQWKl67L4YaVbM2
         MA0g==
X-Forwarded-Encrypted: i=1; AL+hErHohzoHU+yxB33iJZFH6Ix/7hcYNA/B7jgsNuycOAs3VVrH5cwbK1s/0SIqJtTOTSCy0h5ghYY3D94I5w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+1Y8M7dISvZEYHgl/7YsPCWcbJnkBUXyOk3WpO0Cgvgf8ve4HV
	j3XTgYGFV1jLD+ukvyagsawBSHYCKfafzSw9nmvSLy+pHfaSD2ZJW7EC
X-Gm-Gg: AZFdTZfhiMqHJ2FZ/nPnBY68PlE9lUknnca+6XHHQmv1rL75M0xpgJKF/e5Jd/lYI0O
	X7Y/1qqMgbOjTIGlh9YIftHqwkmLgTybuQpnYPDr1xe4fEPRgbwMJxSpuS3OHWB/u8Eq20677Os
	ZQlH0CjLqJ2HDAqJayCGbUzbv2FNqdmGHh8AE8NJkPvMB5PdroIlO4xpQgwX6EgpzAUqFaRPtaa
	ryFfcsjgGtE5rXpu4KiMDm+rHZCNXPzB/uDeHhW68467LMvSS1mB5BtxrnbGKcoHRP9oR4l1bOZ
	bDwvquVC5Qz4D0GRtlK3egXQO/BPbn3igxmoDNgZ4QC3jgouNL7XgJUxrVYxXZThYUfHpIpXh7X
	cau6eu4+62FV6XffwpgHlUVKn0WLjRKQXpR0p53S8QIvhwYPrKn8666OhrTMcj9kSdRjsN2Ndj3
	NIuU1F/BcrCUnhmUSpiwPtdm4YHMz8ddS9VwfsAiTPU9xbboRYQh9ehNxAzvUFYyr72629LG+Zz
	/VBfmRSmHfsH7VlfcfaaOQymzWDpqP/WuSN4WspoAcvW3RTGB4rZD1idPcwXZlsF7K/LxLnT4Nu
	GCtpky8DWSHwfMuh2iDL
X-Received: by 2002:a05:6000:4a14:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4abb71cbc15mr29539105f8f.32.1795557106230;
        Tue, 24 Nov 2026 13:51:46 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:45 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 2/3] dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented bank
Date: Tue, 24 Nov 2026 21:50:47 +0000
Message-ID: <20261124215048.42074-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
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

The A523 and A733 have no PA pins, the A523's PA IRQ bank is not
implemented, and the driver no longer counts it. Go back to one
interrupt, and one debounce period, per implemented bank: 10 for both.

This reverts commit 11f25ac56372 ("dt-bindings: pinctrl: sun55i-a523:
increase IRQ banks number").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index d7d0ba32ced4..c04b04acf6e4 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -36,7 +36,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 11
+    maxItems: 10
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -63,7 +63,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 11
+    maxItems: 10
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -133,8 +133,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 11
-          maxItems: 11
+          minItems: 10
+          maxItems: 10
 
   - if:
       properties:
-- 
2.52.1

