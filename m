Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110888;
	b=vG8h7xhAahdl7YmPux9L4TagDTO20Q+TjXH5rk138hkcBPguiYYldIVbyFCs9b4CbB8J
	 cS9dLMLEGY1IT9JNFO75ByeBSBd+qhdJdSNKBC/Dfiw7MghpSHOIoYvFcCQCuaqNt+3n2
	 QKFukpV+hNr7L1hHYIPZQs4LScsYfIyUDmEMQNddm7jETEfhjnfVg2tGfAugXjnRQ67qc
	 IywECH499+mbtXOzrUmN31E7zUec31XB+ixsccxf7+GGSWcg3ezyvK+8L2JIN/IN2zyO1
	 XABE5oWTgU4ez2N9IYL1+JBSG5TzPU9shYy+kvx4iaQM9yOfWQhM6IGsuNEU/npKrRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
	b=grZDGfJGpGhHXWdpjPklLErKUQOrawvo7Ncs7C0rZBLC8nnrRR6X3uLCirQNN/vPjKWw
	 SL43I5PFAjXQGETEZ66ijMx1WIqWZ8Rk8ulUjUColl05/Yb7pzeZXnRYIRuO1j3+hIx3e
	 PF9XMBsxS0xgUO14NUNRlhvMRA7PB/uXSPPr5py51TG4s+W6Mq8/pTNvCG96mUWVHL26Z
	 Gv7GVSof6gEhhqufu7gXjzmGmvyWJUTFnibVEoGFNpaTILT8W5ZJRuCt9MGgBdL3paWey
	 gNIuytPpx3saQnWkHkQ3B0SNv6aMy0zP+II3Tubolt5XllPzG+r5IeVYF2ydblVdQWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vq15AZDW;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB85C60A2613
	for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 17:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB85C60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vq15AZDW
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1501023f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 19 Nov 2026 09:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110886; x=1795715686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=Vq15AZDWOQC1bXvh2iFQ2205sldQ6q1jsaGsNYV6xuZWkkgo5p1s6dU9pTrrIO/TOo
         YyxCXha+qenTdwixsz5CyGUWDqh23wcO0Lzlddl/tv0JJlINRNATV5PeV7DbJDP1xwWa
         WqPbIlt/gSyPgWTIDTcSGK7VsMgMDJh16X+TIRs7PjM68IzVktPtbCp3WYC+xSJAs5M2
         HPh9PGr0vD6anmfRtelgUzXeL9CfnZDSVqBrU2iUojP2N2At33BeGOzS1AA+lxLBAtCT
         wy5wcAVwaDs5AZWtVTzp4wrzyV2WJZ/H7zTh05dxyLRwlJawxDl+XH5LvpzZKW7feRdF
         9Lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110886; x=1795715686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=K/HCzQcmSvSZN1rm83IHAwamxQfOcWgR04ZjRn1J6Vgh7CO37xiKzkzoTBGub/u/No
         g6dD94m/IUOkTs80l/M+N+tEi+dAqxghNs3VlJvDR/fIsUC8NLnVyZdOl5DpgZHFop2G
         0PScaa/bzYBV67CMO9iWyuvFxWv/iO2EgcHA1AYd4Lo4ZihGOg9UsQncB7JIPM4fMnCc
         TfpkYIUabHuIcS8LVwaGvYzDvyWcY+bYXBOcQm0qpR1zZyyiV8C6C1e7G5RAxCGs1Z4O
         5WRmjEQIVFBTiZyEEUUUGOc2fAmY2cZdm14fk+SZRDXZbQ8r0FhntiHyrvNZyhxbC7zq
         WU1Q==
X-Forwarded-Encrypted: i=1; AL+hErE8eCPMKoN1ovLU3UKsar6UyJ25jxCRrJW8/6tr54JqKdXpTTLdAwHJKllc37RJfgJfI5g3b4BrxOyiKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9rgS/3yYqNBoVRaIn13nFfoqjl48bbrV1Cg9gOLzAw8D3NclRP
	OhRHe0XPt3NZjomKXLMg+8iSzbf50ESi70LF6L7Dxswa3chfrYHelLrw
X-Gm-Gg: AYBFou2wQedpg6KtORG9XB25m90H3OBBMUyYQ3f1XH+dax2wXQdV0d7DH0i7t6dRb+3
	7xmYJlerzAShyccGONwZPNztAihRah+apoRoI1zQJ8gYpaJAUw+VLg5OmlrTGZ1xe0juxQ5OaLa
	knc8dvQQ6t2bg8byFmcbvjdr/J/Va6sMiSWzlxuK4nTeflaUIJL6wi6uiIkXBiirH1bDJPdTUBh
	ITYplFuRMLvU5FkPcIasSpdwa5i7FYNR1OFbma20xeUnpaOy6FtsaiiMGlQXJKb7kfb2EWb9B/0
	0SQPbwAf6vwtvkHpCa0NYOuqVn504JhrRONK886qa9PC6KEKweOU4DTI0yl0RUYFFGMEwl2b1tx
	/vQuBYF4n7pWuozlVPJyzbb2OR2hNrHhAi45649TIy56W2ZuCkIL4AfMvuKeOCOjO6oIgG/xWgu
	bnaQVIvRqHujfswG1CdxxJx5LR3+e6XACA6SifkZ1J05fj7nin3bKe1fAUimg4Bwx0RD11GLMSq
	R+7RcBr1x+FSJzB7qUCv8XcdODShmpQEynMKoGCQSnDTRht7RlpKNOepyuuA6+ZaXhRREig4A3B
	w8VyV+JY8EJJmP4ehDqBfW0gQAUx8q5uftmsKlI+EumJVD5qLNZ1xs5/kMpKYAqdtuvkZi2s/3h
	2ZI6FP/rqLVlhasa6NroP7VfxtlB9YxUk8uBUXmqDzACtHUuYAsp2RfoUjINktrDBk9pYlIPBRR
	vH5kLUdyaq2ydh94Q7rINs8MTIKzAGS5FZJ63tI4lWekIaNPdQzi2dRNxTa7viGfrMKl/h0e1E8
	Pk8U++cB6vtQptpMODCP9Eg/qcI88Sfjq5ROBbChtePJPfgP+15lPkv
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr6257205e9.30.1795110886049;
        Thu, 19 Nov 2026 09:54:46 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:44 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/5] dt-bindings: display: allwinner: Add DE33 planes
Date: Thu, 19 Nov 2026 18:54:34 +0100
Message-ID: <20261119175437.2520400-3-jernej.skrabec@gmail.com>
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

