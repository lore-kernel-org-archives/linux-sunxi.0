Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73E286AC
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Mar 2024 17:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710870630; cv=none; b=F2+CkAnrC74D5bPp/3x8zKJvOIYVDOxURtQbNWu+hCk20LU7tLvk/pxB10IhrnnY0urrwYLk18Rna2kStoVmfqGm4uSvlTnEclCEXfpLgWdiEkVbi99rN7toFU1TwBg85DPR7hQ9fQFTDmCGaswWV+kkK2nxGVKYVUhaRII46GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710870630; c=relaxed/simple;
	bh=oyR06qU+csCnIicxC6KaxDeCepNpijanUR+yklL+4uE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=njAKsRwHI2dmYKl3WfKIqpPPmpSHUS1rJnw4hvkauCZBg0sZ0J3Xuwr/aMRfDfcNu5AHZXdOAS+mW/Fj1LIekb86+sZqz0HFGTG6TOgsN0LKd04iaM3n/OG0GcsHaMo419FioTpk4QJgC4tE7PyiAZAUDsR7aAz1RQn5hnbUo3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfLawYXJ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfLawYXJ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so6731258a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Mar 2024 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710870626; x=1711475426; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ar5SPvQbP2e4cGs9D4/VmHfS/OBugCDvvOGlm53Vplc=;
        b=YfLawYXJO1sjmGtY282SIps9cvkAzIro0UWYH/gQu+fC4XNf0gfB16+V0mTpHAvWla
         kfl3rKRIgX6bqLrNebNRxvYvfTlwBLnD699rwX7LZ28DGIW8IUb+Cps0nCJm2xtABfVj
         XCs4Ld/mekBN1MjchGXnwmcmBsQhIAHBAbCsPATgMaSXwhfXw9wTHu/KTXMu1GwqT/Q+
         XLX5zE/QUaTAe7G5KOTXoRmCFnK9WRHsNtOwsk+BsyRkLQ6WF/fz2kLIb2ZB+vlfxeGC
         iQIpMFI4HH+3r9kFf2l7H64SqGmtOaC7I1sPfkrI5pnZZEisTIMizDelrLuIIEc8/4zf
         cVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710870626; x=1711475426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ar5SPvQbP2e4cGs9D4/VmHfS/OBugCDvvOGlm53Vplc=;
        b=b/hPD3xtYXGxU1Qky8UBi6wBFpIEu7eY4nYpW/bZ4h9N4e+94Ks6O9WIiG/nF+LYp3
         QKBmonvJWPLBQlMUBYrwIOMuTlZUAniPMc38jwz11W5mRThRBFkXgJfqJ0/vuS5AXUMx
         ZSU2NvdvZ8xrX0zWcAMy+aIgzPV5OjwiizSKDyltKGeem6oUXBj16Tb6MvkxvGCPUpL+
         0/igGX4kGsZngT9ojsDuNvLYySVEJwdNtRS5WHuE/J5nGexV2LGM89qu9y1B+L5eDclm
         nPsB+4nn22jkAbXapzG6qa3JjMWoorv3uQmUv7UNgpPKMVRFg6QzzFbYdhE+9eIqiKnM
         reIA==
X-Forwarded-Encrypted: i=1; AJvYcCVHRTt1ziMY0nz9B75Tj3285MBCrcaqnrqrVuqZVneFdkc2Br3w/2b9kt8yEAmaX2bbmtCeJN0LE22VqqeS16Ptg7GiROTQF3rfuGw=
X-Gm-Message-State: AOJu0YxbtKFO9axwO3bMsw2dHLkOIe7CO1/0bjFlTWOvXzuFWxNq1ss+
	IvWsbP6vr374RcEhP6pUv1oGWHwmJJqC+UjTsiJP2YQxpN8phk0Q
X-Google-Smtp-Source: AGHT+IF4qt41K7Pzp9amQtDYp7XBOIFm2FLXJfiWIYT5GxvGUR+xjlhVBj+SweEImSVMLV0I258YEQ==
X-Received: by 2002:a05:6402:3884:b0:568:9a2f:84b with SMTP id fd4-20020a056402388400b005689a2f084bmr2383330edb.10.1710870626401;
        Tue, 19 Mar 2024 10:50:26 -0700 (PDT)
Received: from ALDERLEJK. (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id et5-20020a056402378500b0056ba8b68505sm84329edb.92.2024.03.19.10.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 10:50:26 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
Date: Tue, 19 Mar 2024 18:50:22 +0100
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add t95 string
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-add-t95-axp313-support-v4-1-6204b6d23229@gmail.com>
References: <20240319-add-t95-axp313-support-v4-0-6204b6d23229@gmail.com>
In-Reply-To: <20240319-add-t95-axp313-support-v4-0-6204b6d23229@gmail.com>
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

