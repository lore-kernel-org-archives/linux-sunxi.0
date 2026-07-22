Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FE8435EFA
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 20:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784751454; cv=none; b=QPJaI5j7OCH0CiTCZI7k52I/kNG1hkNgWobQ1IwSA6f/nx8SdfPVIGIvAFfp9GHooY+KcxCg/tzoliK7f8TY0TzPwYFok0ckdrxVq24Bqph9qoneceBZ0yMnYIoSynap/WAmmtaIm0vIaBN6Dnk0bMsZf5d17mHnYB/q0esyirM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784751454; c=relaxed/simple;
	bh=p2luxpgausQjIcXu34TXu0p86I0tMOO4Cg1dU7QLAbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6FZolF4bxbOeDSFqgxfkn7ddqloOT1vnP3WgRQ2131Z1qOmkA3ASlKhPE1Zi1shT1cDMX+NfNgK2+8+Sk6qMoP40heVsFNsDogyrOlaZSpo14m4p7CtSx3h648mWqFZuYra61fmObEeXq1fK5hWwAeYnQWc/r3Dq3dF85OmkHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snzSY07Q; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snzSY07Q"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667ef69424bso11116200d50.2
        for <linux-sunxi@lists.linux.dev>; Wed, 22 Jul 2026 13:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784751452; x=1785356252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=snzSY07QFcHayIvFPXDGKXD47qpyNkBW+5xzUXUWxg/PeDqdEOD8t7ct1IP4oescXk
         jTnMNmRnY9PFfKTgK5vofXKmp9E6//yPbuJovsJwoik4QW6EZYZBpumFpS5h7egt4vY7
         vhYirmgeP4kMh4RZd0fwJbwfZ+wf7kFFL0Ep9Vw/nkThlI3mo1vazGjGUMuBcpelauJP
         Rb/2JKTNg22nTxLEFHIBCM07IsHSmKbsLkfhyQKWic9hDwbP+L9jcy65q5yXX0SJ1TgY
         MjkU6fvOXrI41WRYwhiOMxoR1Yk53s7unu+vbUQXd60OAH2FZwBcawJ8AkRiJpb2kLSM
         ksLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784751452; x=1785356252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fvg+6+1EtvjWR0RkLSp0ui0eU2DSRzRszmxxfr+HzU=;
        b=ee9pCzFS0RGsEVsp14q5yjkGz5rGh4j9EDGwVDGtFIgT8epT/9eBAgCr5oMnaQI60E
         9K86+tDIFGLyaZPnRmyoGdb8VGkUiLnzTTPYhP1sUBcTr6dVNogPbGvEn3FJhorKHzUA
         U+dh0Lbf0IlWF4eUyajK2IUOe6iJUyF4ekdZDxmafIeEHah41xQKXiuBGQZD4nJ04XLx
         2mulE1XY7POa1XBWj5KhVmKlwJoLiPoVKTldWWEDd8Tj6OqomVj5JDZz6zttCtcBA8s5
         lm5tJjaLI5VAeXtrl86amnxjMZ+m0mRenoWnVuu2xv24yc738AfW230i+HkRqdUQyR1f
         Ij1w==
X-Forwarded-Encrypted: i=1; AHgh+RoCfDp730s9AGYQSdIDb4gz5+3MbbmxVejM8/gPeV/oRqkL87RDZx9jeacjGUdxNz6FBpDHne6AWbin7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJxiMy2+exGUF0USCKUCQJnknDhOfmriZ74ES5mSCfyy+r9xzO
	L3FxTB0Wf4fAV+hb2DotiDohBW9pDHdcWXKvMGyPP/2AIBX9XqOABIIe
X-Gm-Gg: AR+sD11L1e+ecZnoB+yjusfZxXj+DRxWEN11PWtLchu7YvDX8GhgNLAsZHpfzmJURge
	vdWFoanhosaWCO32dzleLPjVUYnH7LBf5bK8+9SsllIV+6rXKiMhCyjZ+qPUoncZUizL2wa3xt+
	iDJYIiCayXZaZ+ivpCmt111U9gVIQAWI5lT0DmVXEPW6BE3NwdQ/e6L6Ha60iFg7xTKhDzC1c6g
	1pieY7dOAEcKGmiWT+wdv0X/lfLHBVtPVoHhVPUt/XnH+EzHTrHLJpiNRiTpfACyTsAqymoQwYw
	xacEjPpzz0TJtLTk7W2EnWiAWqPd8SD1nybIqTjPSyKC3NMQILdSo7TQd4gozgoIkJ7a9xdjVgp
	RufMT6umguHRO/+hSBVfuuFQJ53aVqo7mL+zZB09mEQtl5Xhr+lDWuUiDbeuEGOWFjiMnn43pp6
	7ZXnuoOPVibTeIN1o+WKVmLZAE13CFtV5w+twM
X-Received: by 2002:a53:d987:0:b0:668:9230:e266 with SMTP id 956f58d0204a3-668a4cb0f6cmr27020d50.46.1784751451559;
        Wed, 22 Jul 2026 13:17:31 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:4392:41cd:1ce2:e391])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6689056dfbasm1958866d50.9.2026.07.22.13.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:17:31 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
Date: Wed, 22 Jul 2026 16:17:15 -0400
Message-ID: <20260722201717.2205609-2-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722201717.2205609-1-utilityemal77@gmail.com>
References: <20260722201717.2205609-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
The reset defaults match the fixed behaviour of the older IP, so the
device works fine when driven as an A31 CIR receiver.

Add the A523 compatible, with allwinner,sun6i-a31-ir as the fallback.

While at it, merge the standalone compatible entries into a single
enum.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
index 42dfe22ad5f1..18b28feacf83 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
@@ -16,9 +16,10 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: allwinner,sun4i-a10-ir
-      - const: allwinner,sun5i-a13-ir
-      - const: allwinner,sun6i-a31-ir
+      - enum:
+          - allwinner,sun4i-a10-ir
+          - allwinner,sun5i-a13-ir
+          - allwinner,sun6i-a31-ir
       - items:
           - enum:
               - allwinner,suniv-f1c100s-ir
@@ -27,6 +28,7 @@ properties:
               - allwinner,sun50i-a64-ir
               - allwinner,sun50i-h6-ir
               - allwinner,sun50i-h616-ir
+              - allwinner,sun55i-a523-ir
           - const: allwinner,sun6i-a31-ir
 
   reg:
-- 
2.54.0

