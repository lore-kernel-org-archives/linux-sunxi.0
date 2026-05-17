Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F297C3D6CDE
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 23:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061290; cv=none; b=Wrcq3YLRvWqyKT5nuh8YX8hZAFVNbK0aM/9rzVZ6IyvxK9fqw75PSna6ueRwKN5HJrZALvSGZrwSX4jMLNX9KoCdJ8OIz7TpdpGZ0tEPIXdPb/SS3xy3WfPfkobWTkTF/enTURssYMxXsg2N9Jhg186d4sTEWtowtORpIIkIfPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061290; c=relaxed/simple;
	bh=Z7KAxCj3Lt9T/h+NNaZYTzw8OR6eKC18xCSnWTFm75c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKrKmQDnN4aBhA2ucArUssogCpKU0iKtuaY166GcBqTYEL9kFw/Z4w3zP8vnvxuHBf6gXq6CKiEUbMUhvr2sTkwLk8ieRyD3ZoN72npCNgEoIitjWrulQmtyrf4kOrSsxRpbixigi0htmG6eP+Yc9Ln6aERHTet7H/M808+/99s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a1EH0peM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a1EH0peM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7645adbdso962216f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 16:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061284; x=1779666084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNnGNYWRDSiTCSAPERc5W07fZmdBUCZXZbGfR7wRvek=;
        b=a1EH0peMdq4OK34dF9iDw/bogHs5jatNNwwzqgcP26LUPImlBqMHWaJuUeiMm+/Io/
         UR2AgGgHhfoBKDvYApl7MIfV1mj+TyJgB7YKiaUOS5EDFzLNoS5tDzLvj035em1Enz4s
         SYRARpGXnHPl1HPfgrBA4iBlAuacWR3ZDudL+lVIQ9KTXzteZ//OrhGCxBQ2OcGdLZ8m
         RdC+1vMNo689l/zv6AQZlTRoeUHQa2MFY52yfAI9TbiF6oqlxgeNuKy9Vo9E5356B+MU
         kS4mbeySUV0ln1RE+UrFWOOUInC+QsC7Yo+CDl5rlQRUpOG+Yo+q/dMCrmpFjmnGPTe+
         hxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061284; x=1779666084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNnGNYWRDSiTCSAPERc5W07fZmdBUCZXZbGfR7wRvek=;
        b=S2OBdfXGc/d/A/QMPJDGY7E8sfRaoF4RgP1nFZf2Si1ijj1x26XjXlWcYFZVZJL6J0
         2lGQ+mL8qu7bGXIyQgU0gLp7DJiFNpR/0mnAgKEqdoob5DJ9MQ6sYOLfGS4OAgsP58Xe
         0VbPtktatFUpVMfs33LBwxzO6c0okFh5VTkKWrjrZzROldzKuHuPNBP5an3/7aRIndfa
         W3Y4RyKcAkAjQt9nbsWvkw65sl9tz7GYhpo5XZum2ynttRza9YXWq8udRZ9ZGA3VZt6J
         LSiQwSV0x3/s++K4Hc475NxXQVdpBFyOjz2rY60CaQeo2Q7aslT/cEvDDEBTLHItkFFQ
         cBeg==
X-Gm-Message-State: AOJu0YzjGByBPjEyFNHAQijEQW5b3vIxqn2wrW1rz1w5Ah50+1KkznR3
	wr+8QtdSzheb9FI/49KxwynqTD5JlpPUlNNvbxEor1CZc72vrG6THcwLozmhICIy
X-Gm-Gg: Acq92OGXz26r06fpuU7oBJOvkygByXvrqXziDIRBglfpNiWupRvEnqNIuIZuJX48O7I
	5WD7lg5DSr1pxd7K+uc7Z4AipYikucInk0ltS9r1kHA/a1rFoPYvNj/KVhhkonzf7AsNCO2fAt0
	G+LU6iiRr/faKhGBq6+foYH/6eDKa/kFgJQwHt+wr6I4L0yLYZTAJichswZGrAFH3Zu5qe+RX2X
	tKdGKSkzGVnmjHsKNIaFxEE3NOU1aUvZ3XgeBx4xuBglDcvvlTY22z/uXl0WTgYu6BVpRXwPtRW
	meE6jqCUs3lw0jhsXtFvDtmErk2tTAFe4c9ohLvIWvIV56Oln+5tgj9/yP9woKIHPZbloY2WOcY
	QIqroCP2UfdayKR4oW46ucouGVK8NzcY5m0n3CDASF/VZNNw0FKrIiJOU3Bj7e71yRzigBj7gTc
	Yo/HJAkvYqoj9yHL94ev3FiWtMs/QnZt0rOHgIYlX/McVH7tVh6CMt8YQFRB0ouXfJOAzKLWpin
	zirL1FH+KM=
X-Received: by 2002:a05:6000:230d:b0:446:96b1:f5f with SMTP id ffacd0b85a97d-45e5c35da70mr17323837f8f.8.1779061284317;
        Sun, 17 May 2026 16:41:24 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:23 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/5] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Mon, 18 May 2026 01:41:28 +0200
Message-ID: <20260517234134.2737320-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
References: <20260517234134.2737320-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Baijie HelperBoard A133 is a development board around their A133 Core
board. Introduce a compatible for both the Core and the development
boards.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
- no separate section for "core" .dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..f65bf1a549d4 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,12 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie Helper A133
+        items:
+          - const: baijie,helper-a133
+          - const: baijie,helper-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0

