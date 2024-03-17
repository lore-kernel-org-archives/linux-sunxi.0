Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A221EB35
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 19:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710704877; cv=none; b=Wo0fmQzeeNq/65NuoU+UrMj1Rs3UHbT+qKKZNg77DyAdEYv8pMs3zMA2gumYh9Z6YHkjjFHllnp7hdrR4THqtkybt7LVaeAEgHkUsMgacaEaVBNqnFKymriBflZEWA7f0NC6FpAZavp2KGyjoykLa713SGzcLccLi2A//foYr7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710704877; c=relaxed/simple;
	bh=oyR06qU+csCnIicxC6KaxDeCepNpijanUR+yklL+4uE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mf4MUsQBc23uchUJDwGDCnl7v6hwbZcln/wNL7FAf0d7uyRbDqieuugdWRO2W3nQTAZYrpywppxeoS9J9/nAlIVIS+NmmEsPCxfNGO5jvbNPx8THiluJMMle9kv3pVcWvAfrjAGMTR2gBAG9gJ92Ge68vWt7q8QXt6eTqpx8vMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ut0+MdIs; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ut0+MdIs"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d220e39907so54800531fa.1
        for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 12:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710704874; x=1711309674; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ar5SPvQbP2e4cGs9D4/VmHfS/OBugCDvvOGlm53Vplc=;
        b=Ut0+MdIsTd9OQ23Si/YFTWNwIIQUYU1mxYhOojiAUsYiogYh4N+JvNbrLOTHJsL/0G
         Gv+YwxGrHwW2gg4ShYYHl3fcTbsx86Hf3s/TZjaPhXnBw2ra17iDjP7DviE5W/u7ZkzR
         I1lljIhhuHi31a065k8AhA2mUbOIMlVb9iJLX8RIPtGiiirj8g5mhOrlvAbWzW1PPile
         SEgAO8WsubquTc8c2i9GPW47hKClm1u6ibIRKdDttOrvssOmbN4FPOXzXDaNkZI9W3F1
         mJphW0jD2/ExZiV02tINV+NLfd8Eo78PDCUHLX9yMsUzvbhoRaTsrmDg8F+Hb5AxawgL
         cCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710704874; x=1711309674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ar5SPvQbP2e4cGs9D4/VmHfS/OBugCDvvOGlm53Vplc=;
        b=ipEzxtzDtzW1/wllmFLxjBPIWeUjgyfCwvzWMPwz1iTbQCrdr20/qyya8i1WUZbVL5
         VnzmiZeWU5g3iE+oGHXbQtTCowYkK+z0Q0QaLiGs5WONTPU4/dnFAjEF4dVttILOVwGG
         OMDi3lMuDFY9pgobf9JIj6p+51cTa26laI8SP5AsRdkg9N0nrCGxSi1omJOAVZL002+H
         c5YIpW55txq4uOwChrtuhUbSDq1ZPHaS8fxdzdpBV27nzkgrUkA0inZJRfn3CFCtQTT4
         srA561O3/FtBPHjsONwm6r575hJK4+pipCxg7diLzNtcLluIuK67YKPDk6w7BKEjEcrC
         Ml4g==
X-Forwarded-Encrypted: i=1; AJvYcCWtmemtkFauMSqe75FoHXVsdQCe++dWHVHZ5qtTeEPQmdsMOegOI+eKwjuvUEYT2znLnlRdGwehlB18PlbE89JiT/z3ft8PvzlArYs=
X-Gm-Message-State: AOJu0YwZeAgyhweLw6GgVbJeTRgVsq6Xn7EWMa0KerYaRpeh+ulV2c40
	5QFFjCRNZht3TBOhJ3F14Bh0pj+J6R2JLXmaUp4XQR73dMhWyh94
X-Google-Smtp-Source: AGHT+IH8YbsixVcrBCz8Zv/9yOZXhoo7nnGlxmguft2CGY+/Y2/EBPRx3/Pqyo8pju4M9zKICoIIFg==
X-Received: by 2002:a2e:6a07:0:b0:2d4:5ce9:f909 with SMTP id f7-20020a2e6a07000000b002d45ce9f909mr6902582ljc.17.1710704874055;
        Sun, 17 Mar 2024 12:47:54 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id i24-20020aa7dd18000000b0056ac092a7fasm8234edv.87.2024.03.17.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:47:53 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Date: Sun, 17 Mar 2024 20:44:49 +0100
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add t95 string
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-add-t95-axp313-support-v3-1-0d63f7c23d37@gmail.com>
References: <20240317-add-t95-axp313-support-v3-0-0d63f7c23d37@gmail.com>
In-Reply-To: <20240317-add-t95-axp313-support-v3-0-0d63f7c23d37@gmail.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Kamil Kasperski <ressetkk@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

Add vendor prefix for T95 tv boxes of unnamed brand. It's hard to
determine the actual vendor, so let's assume t95 as default vendor for
all t95-branded tv boxes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 04505cb0b640..65025ad4dcd5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1416,6 +1416,8 @@ patternProperties:
   "^synopsys,.*":
     description: Synopsys, Inc. (deprecated, use snps)
     deprecated: true
+  "^t95,.*":
+    description: T95
   "^tbs,.*":
     description: TBS Technologies
   "^tbs-biometrics,.*":

-- 
2.34.1

