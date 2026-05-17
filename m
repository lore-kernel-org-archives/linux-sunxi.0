Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2835E1CE
	for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779061285; cv=none; b=MoZhJz94LNCG2cS4FF0XYWDha5E9JTIZDI6lkp28waRvt+S7YtPo/eZ895xsKXXGC9CkxuEMUeivLnwWOHt+f5v22ueVmrjOtaHK/dzQiN7+I0g6jL3Nswa7i4HGsqFePC50zcS85ClRV5jWbRg1QhJOnZxEddzBkHw/heapuEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779061285; c=relaxed/simple;
	bh=OWCEmsRz0qAl88C6oETHRWXimfKd+7tWIWARlti8lDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMfzRzZQoyFb6a+q20+acByYZWVs5mK8ejToX84P873LCH4gVaf+K261Q0++AdLLYT/OcabQ1MdWq5uroPGFLBybAYKspfmMu9t4xgKepSy1qs6LcZSrPs2bxiEPcq97eVbPyYxHj8ew7YfgQm629x/n5BndQmK2iI48Nb10ge4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpU6KyD9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpU6KyD9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-441209fb77eso818066f8f.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 May 2026 16:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779061282; x=1779666082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=GpU6KyD9ESpCuj+HHhv5MkR20tz1AA1/xIOzsQrYxg4EJAIWGQruGCJXCrNGzUVZAG
         Ht/VOpJiX23A7S9WBnjkzNxVc00NW6AcBhx0ZXKmq7ZpXRG7VN5Z9ITOG+8TB7fAyfgA
         4QBfE0xfWV/sD6UgrOw8ZBG94NN5U1X5iQPWK5VslpOHOdXAyt5Y+CFoPDoabBK9uOK2
         3vH7NAeAwGH+XGpWgU36lDSEck8OcO97UzYAiqZpeMkodpHnTDELziy3a4Js/UxC0F8D
         d+pkYJKCcnMTC4UoB7cM+ZUaJvlCd8pRS2jtNxu71/USXHACtIEdBybQeo7GFnp3+jBI
         6J5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779061282; x=1779666082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qekc3CBVxjBSgzBYIYcZVSh3VYMZermzOtzi6JTCBsU=;
        b=PbaiaQrdvu0V/gM3+0P/+xEsb+ufaatHlHGHvNckEm3gKSWRhBpM7s58js99ru78EE
         wecME45OjSi8DvL0Ly8lh2C3BzF61JTakgA6Un7casUz/Khf7OVpqPkIrhET3pzwnJVD
         xywXhwazFaC8T1yTquTtmKv/PiYGmiHGMgTaf43abkN3vBrk/YDXsKayqccuN5aeul2U
         a6DCjkejyrinGRZCKR+jInels/0hchSCOtK5HeEHXT55medu3IBM7cJaiQAk1pU1e/ry
         v6Tu2UAxAiZ60ZNPsA6ZlEK9ZCWTPH0z0w/LRMpF8W059M4B5lI1pSqTkeCD0GztvMgd
         RSog==
X-Gm-Message-State: AOJu0YygAAtr38RgE6GyhAk95Np3Y1OkFspXkd/0F2EBIw97AZWm2Q8L
	ofT5kqSHkxBQPLuFNqdtC5mDjS/WaB+8wL32PErcelOGtJZOmOOjlsF0e2jzWBqY
X-Gm-Gg: Acq92OG4DueyJVGkNEPGIW9eVTk+MZMuscOKCHJXixLTf8G5ReGxd2afkG2g4/cNY3A
	v8TWxqeNOyM3C437IxHG7vaAVJfYsxC4HiNC67qjSnMdjGGfU0Oei+qjR9kgUR4OBJrH2O5rgCN
	LoKLazCQbLm62H4DbTt/gnxyPD9bypSNQT6Vuwkvein8WiVGTKz6HhHRLEGJFFaNaLzoFFRm5d9
	ycFOSa3m0o9niMtHuvxw4xW6mqhoJyVyozxdPb+61eFRbPx0iMSSxQDE6LooviKkiPSIz4hQfqx
	5f58CI9Ko2/1KXM8dpKcUnBYRcqJCFRYIxxNOJiERD3HCz2kXmfvZwVYIUyDWCzgkNbqa7HL9+4
	lPxe86xNRm4p2iPje17Nln3a1Lgu4WRH2bpUz7dBqurqlMJvodnwwFhK2kCkfHYLzjCEQnzhtSK
	Me5wA3g+3+jn58bF+1EjHyYVNiAkDf6KIREzHCFcsvalm3qrRikibfmVQPfS6zOWOOV6T9J2rrI
	23xcXZfVyjmNZwvb7S3aA==
X-Received: by 2002:a5d:5f90:0:b0:441:2397:f40f with SMTP id ffacd0b85a97d-45d900ec71fmr25972014f8f.4.1779061282572;
        Sun, 17 May 2026 16:41:22 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm32845129f8f.33.2026.05.17.16.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 16:41:22 -0700 (PDT)
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
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Mon, 18 May 2026 01:41:27 +0200
Message-ID: <20260517234134.2737320-2-alexander.sverdlin@gmail.com>
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

Shenzhen Baijie Technology Co., Ltd. focuses on R&D and production of
embedded products as well as customization of embedded solutions.

Link: https://szbaijie.com/
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..095cf654787f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -229,6 +229,8 @@ patternProperties:
     description: Azoteq (Pty) Ltd
   "^azw,.*":
     description: Shenzhen AZW Technology Co., Ltd.
+  "^baijie,.*":
+    description: Shenzhen Baijie Technology Co., Ltd.
   "^baikal,.*":
     description: BAIKAL ELECTRONICS, JSC
   "^bananapi,.*":
-- 
2.54.0

