Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB638F253
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095744; cv=none; b=kEuc3o6jOYrSNQxtaXL28MkZH2SFJM5Ii91wf1aZwhQeELKpeJ5yw2cFsJgzQEvUsvpq+uGKzh+BzCsT4o9yzoKRo1cakXSPitdU40YAt6aKbejpXVp0qWTeTrrI/BlENKW07jCilqpWD1doOoZXmDfCfB5S6Oe+L/G2BgWn1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095744; c=relaxed/simple;
	bh=SXgeVHiR8fhOHJmmAi0jVLf+hEeuVP7EPmwprBslUp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RdtJ17qnuuQqxM/AiEt99rNiB4ho5udV1Jp9l+/XGMhKBl0V45nFq3w5/UMLITjTVEpheoUjvxiA1kf/OPKmzYJ7+K2e9n6hHT14Vg1cpQTy7KI1xao5fevzYBvqRcVLxqF/O4qAWiixSJ5tiAAqP1VU8EDPWyYTm735CezBuCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtbGyNsl; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtbGyNsl"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8230f2140beso1108785b3a.1
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Feb 2026 00:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772095741; x=1772700541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrsbMfvVp2mlT8uZFPdqeEkocHGWkOVoRTFC4HeZudA=;
        b=gtbGyNslyN8Xy0uPPfh5hXrmZBGLWPysZL1Zhe/UaLHT6P3GBA8T22Bb1gF3OBg2Ik
         k9X+N0+XxLVwxOIKYfdnRljEXmJZAcEaKzTk7tcRe9sTEPxyzVNtxw4oqbcN2XlzEctV
         Mi/bQMWMLacG/9yPL2w/dUPVh6U88XZ1GSY4IFEjAZPAt6CUWl5e1arixxiXZfhrTruv
         hxqgtT5Ovs1g3wK3wTX4OkA8l1Q41Uqj1GOpgIKdtE/bHjlKMtlrKU9ZwAxbfGiBbS3a
         aZAmz/QiOaEN+ywfJ12oKaRVg/aqFD3qQYhWD7cGtuvdBxK5IginbXgW7vsqxD7W3N78
         JhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095741; x=1772700541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrsbMfvVp2mlT8uZFPdqeEkocHGWkOVoRTFC4HeZudA=;
        b=JsHysLEU2eQJMdf2iDQ6MCHx631qXeZdhcEWNmN6jKp7XBBq/nAXOIa9kkwi1yMJhh
         /v1gMdWtnfybEt4rQNAktQiufSnbwL7TKIiBO5aN1rXk5pmr5AR2cijHLyBQp2s8VMEp
         IICd4taHWS/duOTbLdWleCNxPn0PAhiwwtZNlbgKZqsGvKcCN85PajGNGiVcj/pB99Ju
         KM/s7QLtc1XMm7J80gUODFStNYwNu/iWwVjLgUa1Szd1aVmeluE++jAxqsGfx60zz8gV
         32Rgv/QcBxl6CFDaH/ADYcznd3f6JP/x4S9qft6QXQV5K1ccSc+ynzG2aQi9P8JOATRq
         ZnbA==
X-Forwarded-Encrypted: i=1; AJvYcCXAYgluVzFtPGVotZYHXgGZCCRmokrPfYw9xbhgLR3ZJzWHY0pXdhu86I0bwwGxZ7kFJnR4HAL8kaaHDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE5EoAXcjqFtr18J9QC2Q2DfeKo2PReSKAOicmQ0Av5sXexJtn
	dB1DzX5kJELQGV31healsp4+HWryL+NbkeRPXfAmU1X1se7JqUtJUXb9
X-Gm-Gg: ATEYQzyTSzf38ofp0xoSIr5W/ZC26sByv3j+G3TAPdQy3ZHarBQUOAQ0dzYKDWJyrUo
	/KwaXatsDC0ARf1MmQ0+j4RYrPc4aal48J7UPvIuazdZ+p3WoQHmJdDsvmdOMuuOWR3X8RT77qt
	0gLjfkoS228ZDaHTZjfj5VOTwWXWV3gxYaNJxWw7xQEY6PDMLB+AkuPvkymP6KrEtXQkHqsE/au
	OrNuJTJza2idy8TIu2IFMC/DnaPIUeHuQdMhpU+h/Peam5+vdmt3DN2Ox21JbygwUjs8/LnVofT
	5tebq+HeVYI1oE1yHd9d2F9I1S3vXGFCN0aLb+Z9rUpDZ1AjoyTNeqH2p7CjhESyEBvSqsXOjC6
	EvKao5puWKrEvStibbW+q7yz+13Kroj+LQr+wm2TLJd8uFYWwPxtH0HX3Tzo9hurNCkDhAv3zoy
	Ml/FEeXC1fKhuTcIinsMuVFJsUk91kQVy6v06G
X-Received: by 2002:a17:90b:1e48:b0:34c:2aac:21a7 with SMTP id 98e67ed59e1d1-3593862e00bmr2064283a91.7.1772095741512;
        Thu, 26 Feb 2026 00:49:01 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm1342441a12.30.2026.02.26.00.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:49:01 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Beijing UQ Interactive Co.,Ltd.
Date: Thu, 26 Feb 2026 16:48:45 +0800
Message-ID: <20260226084850.417731-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226084850.417731-1-jerrysteve1101@gmail.com>
References: <20260226084850.417731-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Beijing UQ Interactive is a company focused on mobile game development,
global publishing, and blockchain-based cloud terminal services.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..2bc2ed60613f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1737,6 +1737,8 @@ patternProperties:
     description: United Western Technologies Corp (UniWest)
   "^upisemi,.*":
     description: uPI Semiconductor Corp.
+  "^uqsoft,.*":
+    description: Beijing UQ Interactive Co.,Ltd.
   "^urt,.*":
     description: United Radiant Technology Corporation
   "^usi,.*":
-- 
2.53.0

