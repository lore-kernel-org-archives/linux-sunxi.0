Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D492FFFB3
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763216062; cv=none; b=qQnHX3sxS7j6M1PzmGRPVTbqhfpMijOoxQXl76Y8plLNRLhmXHTupB9EtZLbI53KHHu3DG22JdFeYtIRI453bUdkziCIfcwfDzj3xwDVqLty7sbTXL7Q0GBE6MX59j3Yq/tW5FR3CZt7vfNCXLEM8BRcHAXVTdfvQtbQ1uGFCsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763216062; c=relaxed/simple;
	bh=7MNfMigmcUs3aZfsMvXzfgbfkCinah3cgeYsqRMUe1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVbP/VwR2vYvxK1iraetrevXhOz1B+GTq8z6czI60aSO1F9YY8nxw7ow2PWSw8b/mxFidc5VTVb0QzpehvYUL7ONrnbklYZKeNdNsGB69c3qHmu4CwCuLgEELgsbl9NKWWLKuv0ktfBu9I9g87FyX6+3jk5immH/YA/hfx0k9zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJePjLB7; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJePjLB7"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7379641791so120911066b.2
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Nov 2025 06:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216059; x=1763820859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JphR/yfHrqeoxGCFuZ74qbjmgj/bPrWp2+gxF4BO3oE=;
        b=VJePjLB7LKjrwkWUm/R2ng+SIs0xJU7NW2Sf9pEJUd4+kC76Rg1wx+j/4V0IyoSBBS
         vrBvN/qT12X9G+7dCndsCtPlujuHuactGBvjPAMA3OTQUD07QdtSlDwssQUQxOCu3Ak5
         69+SnzEtd49O1DmubpWyx2ToNK2NFOidboXcsDWRysANY6U09xCjoYnS0GXrBe8aSciw
         TlSQdBeHo023ADT3RJAClCCJ4g3kvW431Qb+Tms23ku3mWwt1itcDu3xqQgSMFeXt3/q
         BiRxtYnv8FC6GDoHFNNgGKTj+A7KAUCSDs6CeCnw0VnkO+RlZqA9DDGjVIw04POr8c9Z
         LK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216059; x=1763820859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JphR/yfHrqeoxGCFuZ74qbjmgj/bPrWp2+gxF4BO3oE=;
        b=GnS/EjrCQEQTEsy9P/z7okbEJQ1nLrn9c1EBqt5Igp5tHtjjngC6qqoc8rrLASkd33
         4XpChgjQPVmQWVuPMlhJz58F+K9ayNzxFyop6tX4SgApjzr+2tgUzKs2ukt6UfhVTSyx
         W21wML20OxJ1Aur9eU6eXlcd3SlJc/wTh5B/sMH7614D/p3Slvj1v2sjFEb1lGTh05LI
         S3y6BbA6jyyDl0BkEv8zZ+l8GrZBtjFzbUiKuWkgGtMgNEndCNAIRg/MdvqiIY8nFzB2
         J4RP7JfVzP7Ftk7zmtPR6b6V4vjSY9Y5womNIc/UY5qJNT18dwpOxOIQJcQOh1kRT5rl
         RQgA==
X-Forwarded-Encrypted: i=1; AJvYcCUp1RH22RJj0letf/O35D3K+koY7sKolu3SvzMRVkSyEn4DOXW6lUxgo7ZUc/XwRSVBmDK6PoY0khkvzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpokYD2amAUjjqq0DNGraVsZ9Gp1UN6qQU39/pYldHKnT4yUtA
	pUya87Op4KEstUuP8g9chj+6E1Wuz07G5Ujv9OjRqOknGRnw8XPaAxrs
X-Gm-Gg: ASbGncuqS9CG8eJKa1ehYgnDMt8Il1m/o+fy9yCMoyiBgHwjUGdRQl1wIB5mIOet6QQ
	JtuiOtyRP/7LKquweQz72dQG+v2VJ96oQn9mvB2HjcObDGwG0Ndra1Ynol6zTq1TbSJ5NMbm/Ce
	tj8Z4/iEzf/Jcb18Kcd1F7mKnB+V76yH835IlEKAdi4MhYSDsQyRLKYo/DrAdyvmIixjJusbxEy
	z2rxhHAtDY+eTIAr5+zo5Pp1IEOCPyOGQ6u4fvo8OTCoPDnarJU5/u/zwP9Zu17i/5SfhrI+yir
	4s8vR00VkzYRvzBw37R8wu3t2JNaigmPtxFST96EQWSxOtKCZ6JL1/UZ7W3Ap/dhcRmNTnlIvln
	9LZ/C5VWhSKVHUqcJH0g1F93aowc472Il+CB7wEfR9WQ88DpWnCdj9ibXkcMldlXz+E2DUPuO/j
	TWOfMmMkEBjGRD3554+/ptXcZmIUGwJSmAYizGABKssHqWyA==
X-Google-Smtp-Source: AGHT+IF/NKVfiJ7TrqEh+PcUiDYYnExZ1hICJ4keAyez444tuP7vZ12VBd4zl4CNGFC7PXxBkD/1Pw==
X-Received: by 2002:a17:906:7304:b0:b72:a899:168d with SMTP id a640c23a62f3a-b73677edba0mr706079866b.13.1763216058665;
        Sat, 15 Nov 2025 06:14:18 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:18 -0800 (PST)
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
Subject: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Date: Sat, 15 Nov 2025 15:13:44 +0100
Message-ID: <20251115141347.13087-5-jernej.skrabec@gmail.com>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..801e5068a6b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,44 @@
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
+description: |
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
+    description: Phandle of Display Engine clock node
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
2.51.2

