Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433313ACEE0
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 20:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782247723; cv=none; b=QUo3LJ5OLG8Z7tf0w8k5spPtjrV2vqLnFojwnhWTuSbaFr1CpZe/294vW3hLcbHy9c1bzNjJFpKjqEWsc0kFIIVUNqjTbxUXyGSdNl+IqougQuO6vdwXPLgL2xtk4YBzJzmKYSYxCGp1l/Lb4rO6qruwdCrkV5WXtVefRb9J+aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782247723; c=relaxed/simple;
	bh=dR45JslvD8X9ffV3iYwOxJm087D1op+CNofDiF/LfOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUfJFDVfar3a61KtkYPm50p+mOeKsw3qmTvOpfVJVx80Ommafb3A8wEJfhPvynyYkwB14gSDRvSIN6ve4j/UI6XEyuY/mSqKTKKV00fHS36MfyDxZGk/VYJly3Vi1gqqcmxTMYBIrPiBBIuyryyWKGvtW7xz+OHx5BMmkiQNgXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7Xw53wA; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7Xw53wA"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso14146085e9.0
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jun 2026 13:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782247720; x=1782852520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHPVJLFdyyFn1B3+/j6XeVWPQvw5tBspxfdA6KrvZVs=;
        b=T7Xw53wARTwU6z66QZZ+rxmOrl8U6L4bu8gDLDMdbZi323fl7gg3mTaq7eJ+uWaZgD
         HgKS4PmcQzEmt1k2xzLP6/AJDdX2q4BgduVSSund0m1XlR2+kRLIo9FKw3p842TcLtmE
         ZBJYQ/wp4MyiLnTK1UYcfUgnzBz9KIs7x6PC7CygHSQKzKZhIB7yR5fJDYP5QYaFPaqk
         3ahnFq+P9J+SZcJIN8Lrhtv56cVKcSYDccZpMTygwCczQYGiuf2+FDBJZUbL2gbX++YH
         hOGbXG15IRZKFVoBv5VY9qukIiTkFvkPDLC34m0sTPhMGSoZmOPRALn7OGFvWWPjRag8
         DgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782247720; x=1782852520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHPVJLFdyyFn1B3+/j6XeVWPQvw5tBspxfdA6KrvZVs=;
        b=iW8hUPsIBficyAKkDqJFse0vKjz6624OxVSv96ss/eT5+7v8i1JWnrYx29FmzwMjB5
         a+tJtFkDVEIyH0RGgcd9wUXp8YilAiCOFpLM7Fts+fixM91gsZGzHQmVijvAr0AbCo0W
         qhzyvyN8ObE+nd0dee8Wa/6Las1T7XWBQOMZ0U/HdB0Bnz9OZFAezaGetACINrSSV2Iz
         h0f6Wn7l60qtHWUbGqU5VD/vMI3P0BwYVk90y/8gy1CilNKdnVlmHz1U6mfC3EuDF8jr
         KhKsOt2gVziIWzfxllfJ2LtcQ6ud3UfWRxzEK8LKT7Oj5wGNtht2qirriPbIw008PYhR
         ZOGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5szlHWnA5cB5jZ3kHlF1VyRSFVzxirE+384ydNyYqurTtg7ZP3NbzCGBGgMV1EbNYpVa5ZyXft4HTqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKtKG5fLmB9PRWcpOOOjveczDZ/E4sEaa/W6LZVY3o/mfKjYAo
	9Ivxed6ibCvQV+ytz5UK/74WTKvy/EgOgCIHWHQXBMFJzbzS+Y6ydaGw
X-Gm-Gg: AfdE7cn9IYqd+bz0sy1Iju/mI9/awIwreGDBpmBsQVd+60bAp6VJtNdrdCogRHooMvz
	aIesblYhg225JfCVtXjqU42t0v5kivMpk3quk2zEzm9CyxJ9MRcSBNVl+AE8GU1k04yteT2mnx1
	h+I2I3Tm1gKusa3P1MC7yFeql7ciX/W/FR5EzOrYMoaK4Nl53PbJ40IHzBIOJgRHGj24hXb094r
	vaEiBuEZHg6tKeLzlLZ0IwsD4TofFhBEkGyhvhoU7+rzp9e43eFm+c455vpcDrQm8wk/EhX0DGr
	/Kilmc7JT58tQ2B3Sbol0gyn/GBtPH/hGKUBMRBzJDRlTATzn+IHD3qabkoAIY7h2qb5xKVY/YA
	ZlM7fegFG0UHkDYFNijJExxQrO4XUZYt0ldI0/0wgTICVd5+OqnZSMS345JCZ+ElSugusRlgrrI
	XA11v5bQYpA88EwBLBu/xOag95gFERFCqOoT069/F8hg==
X-Received: by 2002:a05:6000:401e:b0:460:6b12:1783 with SMTP id ffacd0b85a97d-46a7ebdf3eemr8161239f8f.4.1782247719719;
        Tue, 23 Jun 2026 13:48:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840f80sm351996f8f.6.2026.06.23.13.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 13:48:39 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 3/6] dt-bindings: arm: sunxi: Add Baijie HelperBoard A133 compatible
Date: Tue, 23 Jun 2026 22:48:15 +0200
Message-ID: <20260623204824.691832-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
References: <20260623204824.691832-1-alexander.sverdlin@gmail.com>
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
v5:
- no changes
v4:
- renamed "Baijie Helper A133" -> "Baijie A133 HelperBoard"
- renamed "baijie,helper-a133" -> "baijie,helperboard-a133"
v3:
- no separate section for "core" .dtsi
v2:
- introduced baijie,helper-a133-core compatible for the Core (SoM) board

 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..82dd58b95f8a 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -96,6 +96,12 @@ properties:
           - const: allwinner,ba10-tvbox
           - const: allwinner,sun4i-a10
 
+      - description: Baijie A133 HelperBoard
+        items:
+          - const: baijie,helperboard-a133
+          - const: baijie,helperboard-a133-core
+          - const: allwinner,sun50i-a100
+
       - description: BananaPi
         items:
           - const: lemaker,bananapi
-- 
2.54.0

