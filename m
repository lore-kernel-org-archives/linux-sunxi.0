Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67317F8
	for <linux-sunxi@lists.linux.dev>; Sun, 17 Mar 2024 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710639369; cv=none; b=mMPHRPMxpgkEAcJsDs+b21pN+7YebsY0Qe/cyqXE8ZlTMLs/YAj8oJEktMU51vyNJfG0FKpuoKdVJ2M6Wr/t3g2bz2bBkdT4dRuFKvdtATLisRVTAYSnwdkoB5d8jFP6lVv7Bs10d4D/7+Tro0v1G+j7z2RHQkzA5cqGgHsS3kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710639369; c=relaxed/simple;
	bh=j02q7jjG8JGXprfpOJo8e0jKvdXDrtHrvK2/2T6nX9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+Pu6gnwtaJ9ksnwC/Q8tCCqZEPy6+BMuplhCp9oe8rxANzXi7HmDPLt8KSIZ9ychpeZ/FNVAKQOUaEDlAtmra/3LC1Lan1MBaEXqbaB3UJajrkwSV2BLO8eNCE+ullXL3QkqGwYuRi9nH6h7Nc3iF7zKUAYVtw7YEDN0KQkdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkopsYe5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkopsYe5"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-513e25afabaso560193e87.2
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Mar 2024 18:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710639366; x=1711244166; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M5cIl0G6+U3PlWWvuEct8q0vVwSnOHBYDmQm09HKXis=;
        b=UkopsYe5QNZm/zXsVeX3s/jZh55NSiMGnl8DVk23VbR7Mg2AkwfA1855fzcpRnL9pU
         9QACYW7XMMmk1XoVv8wU85xuIa2nD3CdHZFb7DQiGJ1jBR/J5oeSnnQhaolaXfiQ5jsn
         BQbVtjBs8RgcdialRS2WqycNsstRJ2Jq3yNnkoYzjTLnEyM4iJquR2TmXxVBnLz2cOw0
         VAH4xC+7F3Qvb+2KkkjlgQzY7NYlUZuRbZuj9bpROMWOuqZA9VKFJmQDIZjRWEwP4IW5
         W3dFP6jYmpsJIM4DCDiFnPcMrp1uW7jAtGFwmIXeYw6lC0Pk2624ZaowybfyuJ9c7aVn
         j2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710639366; x=1711244166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5cIl0G6+U3PlWWvuEct8q0vVwSnOHBYDmQm09HKXis=;
        b=RxlhlJeJyP59y4elaMqrE+8lcq60SKZpmRLNy//0Yyo67/1HWnP/4nQGeWkvyxikZZ
         4jVH1IQ0FYdvjiKcqV9TCIDUZV5rYIzpO1cRYVGGPnevtWVULCm6kfPTT3/39217nsT/
         KTkDZH2ip8QlyT0oKw8HE0x3+OiGlfSyA5eSraFr1s3BTbP+J6AY0OTmZV9DYNyiVOEE
         DB6MroVtqkrJ2JUlHfuJRaS/aYDkIKsGKIO4xynA/RM2gHw45zrW7DzueaRpWaWIpplG
         xkIJq/NX8tW7AcqmzooJpD4x2VRPudDxK6RlvbSctyr8tjIcOA6Oop1wBh6DWAxC9aV2
         xl+g==
X-Forwarded-Encrypted: i=1; AJvYcCVdM/6/iYw8X5QmR3f7X1eXatCVNPW8QnsoO7jmZ9YPvfOagR7fLj1zPYXJ5C9udr5ozXDCc5+UPcSQk9DPO0Zo6T/L60Zlz9uTvGg=
X-Gm-Message-State: AOJu0YzHjD1rXjdvXsIeLYkTNc63jQlYNIN2oxb+XQdL43zlII+XtKrq
	sqawoy+nFYYXPV8SjBkM0l3Uu2ojX9+5b3xspgTQqgQVmlRZGTXO
X-Google-Smtp-Source: AGHT+IE6EfWBotUXrEhlVyc8BxxMwF/tdsUu328c3ofLf+WzalH39pWBkQx1vZpJmRub//gJ1bG9cA==
X-Received: by 2002:a05:6512:1d0:b0:513:ce00:1a2 with SMTP id f16-20020a05651201d000b00513ce0001a2mr5052500lfp.30.1710639365781;
        Sat, 16 Mar 2024 18:36:05 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id p7-20020a17090635c700b00a465b6c9a67sm3273109ejb.6.2024.03.16.18.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 18:36:05 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Date: Sun, 17 Mar 2024 02:33:59 +0100
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add t95 string
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-add-t95-axp313-support-v2-1-e38032811758@gmail.com>
References: <20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com>
In-Reply-To: <20240317-add-t95-axp313-support-v2-0-e38032811758@gmail.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Kamil Kasperski <ressetkk@gmail.com>
X-Mailer: b4 0.13.0

Add vendor prefix for T95 tv boxes of unnamed brand. It's hard to
determine the actual vendor, so let's assume t95 as default vendor for
all t95-branded tv boxes.

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

