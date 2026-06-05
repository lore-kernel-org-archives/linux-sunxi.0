Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68474451064
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Jun 2026 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643402; cv=none; b=dGpuy0AmjCB7oc48NHKDRONZznU+iH1K1iz0d/eOeT7oREqwoj/jcGY9yEc/bZnkyxUfCDtcrN4v5b3ZdZgPMFsltA/SV4S3ugDF62JEn2gMwf/RUTq2mPoLLrbWMO1IEE0f6DZpO6I6YZgqVxeLNBQoIClB1MPKz73Wp3gdgbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643402; c=relaxed/simple;
	bh=81QWGp2xwz5I5iCFmW4tGpxlb1ZZCK6gGl11cl7Gxbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i9nutPPBEKHJKzQn9bpwpLjUEGfSMeHnhFbsmbFmFf0QSxw/CPnCqZ4lLZBWut3/N9cH0cvTZNh3xVXCIhnu9M1BUfrZ3BwVDycRqqs2/k2TfK2Zl+TfXpH127Kfn6NM+XZBHMI1JjgsAVzmS1TTDmv/XaNKZ+EkGlqRMa76H0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQAR1EDS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQAR1EDS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso12885905e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 05 Jun 2026 00:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780643400; x=1781248200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//utTjSSQFS79aIABVKNXcplPpUF6UEdGauCN88OgVs=;
        b=YQAR1EDSCA773IU/792ZqU9zaktAoosnx6JNOnpirSlEX4q0W+FHa/hclruy3DrPa+
         PcJ+EVPHq2hFhuBmddkVSaaqawolDkBBaM0OTpHjo40a5aACaZnbtgp6R2UKpzp3tcxx
         JIu/JLb47RQCKAEikn0MN4//c4O4l7t/GL63ICGBxrBrw7V/u/ffM9drPGFtV+wZRo3x
         9XbNF58spMjig6FVLc1nejPdbbr4bfyYMB/KAxyGJ5BMOWu2h7qvamHb0FlpS3y4GH0N
         qD4kmhYqOkr0/M1kqYvwBlvpYZmnf3HEhn1gD3uiZ5QNxcRSU38RAdNIXGmkNVlIcrJZ
         l0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780643400; x=1781248200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//utTjSSQFS79aIABVKNXcplPpUF6UEdGauCN88OgVs=;
        b=WooPXFnTUUx4FNB23pd5dIilUSBXQ8itKQHx6N9foXUX1apisZYuX7bepkcXwTtkxu
         X5pqhJ3+lAO+b4RKmDnVibOdobAdYqkOTHTvHXQUyq1pSCJCz8jWlf4NxgdwE/PaZtAl
         1pqggDHf6sdTAKnCqkyUNl7TXBGvwZ8mCJ1MjCto4xrBOCZZSFDUn2kOAwVTTRcJzec3
         2hiOR4/IxCCWpo/HbvBgfjN033AvOBgwl4j/euXVJlY6XD76nxcmFBeMEPdO5S290Oer
         +0srWkSJnDHBTMXegmFmUU3Mgw0qcWofzfA0NEReGJ7mrS9an7+nwWQSoJaVB20amaNK
         WUOw==
X-Forwarded-Encrypted: i=1; AFNElJ+6T/u+6HKj659qSxzHPmJf5yjWbUhoycjOWI56mhG56aDIo6+HnKJHdsHGe9c0spkkKjYI7ZBOmfqNRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6vJz6MK6kgXWOrkEW/KMBf8LKFsZymtDHmzYTxeSa2qEnljgJ
	onNEA5+nQPUTyO9l4it+KUJ+AbcwlxYb0zr22WlvHm/fzF/VaCk0i+Hm
X-Gm-Gg: Acq92OEA0BzLB4qMV4lMuaJhz+Lp1E/iQ3J57h+dMS83n07ZMBEOJL1fBKeIAR0x1if
	j6yawFkuYQpAJKdgZCp6DzHngACXZxvcGzwA4Puo7wQ92NI8CE9mOw48siNHrlyh9T5H8NSkSRW
	/FNmC1U+504Ov7dvKM1KOHMShDTnc3NVkTuXz6eL86sszriiT/5qrjztPel+fnZ6E5TTfppGnEt
	GLyo7udC9eddmk2IZI9JEa3eVcdekOLe0pZxwvEZU2VKWVLqjrJxDfM5haB0VYnwW9gvuwoFGmq
	DPese2H84xJY/o2xc3OWymRaI/aCFtl0URFeia4f0LV5ZDOEy5UKoGLv7OB0tcyKwOWeZyDh6Jc
	oGEmH/o0EV+656LYxMi18IE9q+vg70p5kv7Kw1NdNwQ78Pijlq0FtOwB5wvFCEvBrejfwq/94rC
	t2lrwrWsJd1hLxeTatziXMro+qFjZ5Wz3YYBtrwhBw/wJE/MdSrDLs0Yz7Z6oCHwNrLibjLpjOF
	K3E2hK5+FpLJPxafEEc2g==
X-Received: by 2002:a05:600c:3f1b:b0:490:bcf6:46bf with SMTP id 5b1f17b1804b1-490c2599fecmr30837895e9.9.1780643399552;
        Fri, 05 Jun 2026 00:09:59 -0700 (PDT)
Received: from localhost.localdomain (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm25132882f8f.5.2026.06.05.00.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:09:59 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v4 2/7] dt-bindings: vendor-prefixes: Add Shenzhen Baijie Technology Co., Ltd.
Date: Fri,  5 Jun 2026 09:09:16 +0200
Message-ID: <20260605070923.3045073-3-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
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
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
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

