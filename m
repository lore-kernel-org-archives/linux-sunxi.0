Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723090;
	b=B+qkbaTJ1TYAtKOEH5H65w87lZxHTYJ36J+S6fIi5jv0sVubkuFrP3PY1g4mGLL8KRXG
	 cmNDmTTVBF86g/rwyNs5rrfhf95zsRiveJZCYk7N0pmhqMrE2TzAeZImtJKVzZ0lfXErL
	 bNru0IK2uh3wBgZxsyKe806w7QNFwQKV3t1YxiXXgT3RgLXmooKlXVlk7fi8AA4Mhghh1
	 AFUwq5kKkRQYN1PEpYxXHvvFQOnW+/wRUowOGe1Ed5Ps31aMD4N36AjRJw2deUx7xmEDc
	 gXJAC20q8zyddvK+nog4q9O04hkbbFvc+3/kEwuUjvv7GwmznGzBiW0/SNy91yYGuYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
	b=4r2Xj8AsKtPBmFB3zNWF4R6RMmOnBnSCSbQAomlz7RXgbowj8+0TrSl19NzKoQ2YAgDB
	 eM8otiKCfwjbg34lUX28ZEdXEAQUi1j6SNFYslfGILwU+pruThRMSE4h3U24P2cbF7rmn
	 bS8jHQjbaYvVp/IhI4cVHRLZzeDSnUnQI5gTB0Cmd8IZeD6Bnyth1wzZu7j/oZqEs8a12
	 x1QjMrf08OCojw0jZsXEFrclaqgSa3q0F/cSbSAaBGWW21ZynFc2cpgy4WKToXZHE7rKX
	 EW1Jzzzf2HPHOveMNowm2qBHNajizp2auY7FURsvD9HUQmu8+tH4kj8E26zkdp9ny8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJuc5BeK;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8026860A260B
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 06:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8026860A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJuc5BeK
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so11995725e9.1
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 22:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723088; x=1795327888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=XJuc5BeKT0widCE80uZXOuOD4cZ31Qog9Hgmlqt2IfMCA2tox6IVfSiqCW9firrW/l
         +VFMpCsMw8oPbDEJJcxPD2DWfCQNEcsG839MhEc+FLccHBNyY9OphhXmPBA6VL5/roxr
         It2SBh6Xf2uqhvrWe8+NgDMiewTFxOrmmr45w8rkAjQPuDZUuueLv6k0g2QkFFfi66QO
         CdUzdvxp3OlOnvBhDIXqtbMy77zDunKnlWPPKfy52IxJyp5bbX9CrkIxT6LUGrmuTNqX
         Fyy9uuGQxTGVkHPQKgeMXcB4GQtG2qCtyry5Dy9ugdDFNFPsdLt8jb4X7/E9oCOk5tpG
         ZZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723088; x=1795327888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=Au9850ieO9PFa7rMQ6vAqULdygyLXpsQB1dOTHiXQ75GUDcnABr9SOxnPpJUEcQeMl
         N3ydP6eXx8qZELOKgbmR8Pg2HR/oHZLM2P4iCXz8U4FhZnJHH8UyOgB4dB7CErLbcEN3
         u2DQ1IoMuciYzzX19dubBspPX7nvfOsLJAypQfA5EWWJMcKNQV1tmE35GI7mNrdWofGW
         7k6jaZd1C8OkWg5mSlVSE8RRa4hIl12F3rUs/By2hNlovqTX0s8fDK2BTzGgGtgBfWFv
         5v5P06cqKkNTKo3/l5vXVSNI6Pr+c+RLZHnmHkqj9JIIs2b5gj5F3PDSqh515omRmrop
         B90A==
X-Forwarded-Encrypted: i=1; AL+hErFdjlsHeS99kc0NGYqfm97An+OXeMT7vUBEmfx3PzD3gHJWOYj9FHtqwLEJTxpc2V/Or+QyF3eEopIJSA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8sqM6VSn/arls8a7aVaNSNvwq5HN/iO4Tm1oIof1tFtdUUiozf
	O0t3SW1/hyxea9ZYBQ1Z9JJrPb8/4w4IKKPawwqKTxtzHp/wY1iTao5O
X-Gm-Gg: AYBFou2IYKrOF6Xt+W0QgSqUnMU56/VNdXWCNJMythS4amhMhiyWmw5xrSn9C1v7ztv
	JseKPX36m9nQfhv1x2ykf8cEJn0LlwNJ8RbZJ3CzYlEApntadWft59b6o+38oXtt2rx3pA7qdXb
	t1u575UWU07E42srbaCSbzlVQmMBleGHCZjjUy613BDd8IZVoDv6vj9UaOK3lfzVCEOiQLNMWnF
	1rFeNEkxzFa9fPYAk1LE3pJx0AKeRKTVlAK+AHMepCYMEgKb9n0YVP+J68V0es+ZHnFrt1WyG3v
	Ds8VjSA7zr/zP/bIH2ygJWGFsNT24LultxqKKISm/TGUoeUKRHGTWiY58776Y+qkqA67XJYfzPB
	bXPua2i2vEkXv7cZw0fJAb8AINh6SNBh3WJD72c9YRnoDyWBWFg2kvtjMOvuW4uAJWRMSWVLoi3
	YaP1HP1XYqZlB5RjgxfS6Ld6YxvHhUxZO1KLNgVaOkamLRCG2vSHW0oYcaMxVxuXZ9CGIdxNj7Z
	JtQ8iJnOylqVnBlBMcbXOKb/Z1H7B9cLvLg1qdnQBYqB/tKrkQShgBzTgLJKsic2n5rjcsIQMxV
	A4lnhk2TSq4SgPSWwLYOkVK/E0nf7nkq94Lr1l4hSZuEx9ZXLcBHpYOZOvnPGD025Eux1YTxEfE
	hkHCvlprc/89WYYGI1/+KcNvVxHUBNNvY3Q0Y+juZRPIbdujh48c8+sZOxMKDUqSPGpGOLNpAS+
	eINFRPf9UiH+kfDvyPtgeEmecqx6QdOHGEm4WC5IbyzszA1WTGvREgIGFlAEwbi8NnTGTGzdq6Z
	FgsDRvfEtG3VA==
X-Received: by 2002:a05:600c:34d6:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb559f609cmr135894335e9.3.1794723087765;
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 5/8] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 15 Nov 2026 07:10:59 +0100
Message-ID: <20261115061102.229680-6-jernej.skrabec@gmail.com>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..0a07cb8a5f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the device responsible for assigning (mapping) planes
+      between mixers.
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.43.0

