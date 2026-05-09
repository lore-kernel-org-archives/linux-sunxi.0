Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2493C9EEE
	for <linux-sunxi@lists.linux.dev>; Sat,  9 May 2026 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353231; cv=none; b=sJDIeqYUu/qhOyMM7hlrSoniIqb7TYWxyIJ+luh98qnTfotd6GSJz27AP5kxX5nvcqdCcfB0Lw8bXyWj8u3coiOmgTCKl8FrwnB0/bVl+JG6Lrg+9F2yL5XEamaOXtw6mZjOsbx5K3Y+/he16DtU3gDqYelenUrn8Qd+9iYffx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353231; c=relaxed/simple;
	bh=qJI1RKZ4tm1AtCPX5qv4vqS8PMeax9pf5Xalvtfc+kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOlQuzR/3z+OdGz3VwrK5EoyE4ZrHq/JOxjphVVWDKxeE0Yt5s6orEckcXIE68KRzc/6+l1MchVifDiWewD5EuNoCIO5wMH6GrpuhObooyRrqMqr9h6xlM14Oq6hE5evVx5oAhbB39tmXzuQBEMmjvBkiaoLphFFVvUUX5MQFEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBG8LdWT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBG8LdWT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1841936f8f.3
        for <linux-sunxi@lists.linux.dev>; Sat, 09 May 2026 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353227; x=1778958027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfXcef4xsSF9aS7bEgNrFEzEGtCwPTxISiBE2oLRk0A=;
        b=NBG8LdWTejNpwLGPsDSzYeSkONyFxFQv6CJ6aFi8JIunfO2Im1p6ExudGwR4ROnYKB
         UBdDH/Ltn5zr5taIfywQkullPK/Ga7ERB4u7sAyrra4Z4UUJoLdV64Eg+skrgXYHyd3I
         8yJeQx8xnRhlL/KjtxAL2AtvV3Kzg0+LyGQ3Z3a71/9USNm4CRZv9g3B2JREi+YSzy5Q
         PimdpPsiCIOLjxWuUppXdoyuAWYbX3NJJ0gJvyymgqcH8fp9k3ODf9I8zrBJ2U731Jsv
         OgHtLbBEVWa/xHLaSw16zs2uIlcdBo5epJm6SnssEsSJh/sJJlvikdQlI/0bNBlVQEbc
         GQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353227; x=1778958027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zfXcef4xsSF9aS7bEgNrFEzEGtCwPTxISiBE2oLRk0A=;
        b=IiA5z60GjEQYLB/PdlqcC5ojfaPwQmVFBhro5SRTYbyg3w+tWxzbEF00Q/xtionDof
         hRrhNgIeLXVH4IF9lvl66G/wqS2XkeQYvegHKOM2c0V0/plUfkW0gU+Oz2aaCAFRJJgk
         kbA5JE1/o5b2e3k2kRoyy+oWB3k2qS+w4tWcGThxJrUomGG96zhPSnYwtmNjnP93gaBu
         vAzKaSUoPH+ekhvAnMCr81IhmGM7f6ja6N52EdlImzi3nfLr6qGrO0CywBtEicsrEcut
         GK6z7mViu+r6oLCNVcmIFOEitVMgS92i+M8iAnIb7z2OehF2LwaVOzT5VyH4rkrkaxp2
         iZqw==
X-Forwarded-Encrypted: i=1; AFNElJ8ENMduQtwRmyUycoqyXWRqbxVNA3jehQeHaJavSGmezj4S8exUnTqXfOZjS7KY2YbxVnfSeF0L92UZ6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDQFu6rb2QD6UFKQGL6X0i7KjK1aKvgxTwsvoLz4WUhKpUnQKh
	S4uHEjp5oZKJ6GFg3NRyIrjgD6H33kNxOuyO5TMN6Vlbm1k4K9vt9mTs
X-Gm-Gg: Acq92OE49r+r28zZO3FNbFzXCgARXemBRtyNi5hAoEnPTA4eS3OrkGwJa99MebZmTSo
	/qrQzpSf+qP269GP1/GSNtu4r70IpyndU0oKbyTFOJHQTQmro7Vu9iiU/JDdmMgcbGjIDkvot/A
	n3tONneoZGbkFXNhH5JIoQ50wPfQbYRcQY9E/sg7TTmgAKY8pIswmDrii5/is+Hq7Rc+Emahvat
	ZkavEqUt2EFGSphdxHsEpR99mCJy89EWbQ52V/IvgM3a0jCnUyZnIzMFhLsEGX6iJejbz+x4sMp
	KJ0yKuJmYHXFxmzJqZJ0DIRS3OXn/K8X7odeIJCQhFJ1Af3qWM/qmMV/ZQwF0l0lBpkMkVvDcA5
	kp0x/E7C/mqWOaFxklJ+84X1/OTEK1HE7DHaFltHMBVkEjm8DJ2oKmCFFgI1AuT9TyAMQfJyYpP
	/P790/TBHsu/wvLaJ3tVsRvocpcu0+2rXrX/2HOTY01vLXmGWoOHExJjObrH4Eb+zlrV/sewM++
	JHtAw==
X-Received: by 2002:a05:6000:2dc6:b0:439:c661:3245 with SMTP id ffacd0b85a97d-4515cc31e43mr28677269f8f.34.1778353227339;
        Sat, 09 May 2026 12:00:27 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:27 -0700 (PDT)
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
Subject: [PATCH v2 5/8] dt-bindings: display: allwinner: Add DE33 planes
Date: Sat,  9 May 2026 21:00:12 +0200
Message-ID: <20260509190015.79086-6-jernej.skrabec@siol.net>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes from v1:
- dropped | for description
- better description for allwinner,plane-mapping

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
2.54.0

