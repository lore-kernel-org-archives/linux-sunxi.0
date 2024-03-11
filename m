Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5537E53E13
	for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 17:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710179287; cv=none; b=UnmbaWxL7obeltATctqzB+qJWUVl3W2GaEQ8Y5+I95aCiZ8p2lJrhD+N1ArLckwkFcH803ciF4jNMmH0S9pDJAEoUTRgI0XAnylraY+lacRCFnnobBS3p0pxSk0i9hMXSoeTE9/gpDFb90lPEGxigZqQOoSAU32D8P8Tq/qRppU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710179287; c=relaxed/simple;
	bh=m1rpnhn7JXdX2s3qbHdS/TBv1+G69uvfgda3bYdyRrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=seYuvI6JCgtPwk/GuHVJGwAhLiev1IssM7zT60zb48nXD03EW3KyYcbOCNKa/RGga5TiyGFd9GJq0q2p7YX0iWdP2ufOcc5MyubdaHIjNRUXWEAxwwfBR7MuYpijpafLulrnrqdwQUGqWGMwe0ijnvoszhKihI+iEaH/mTIYSFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH3lTuN2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH3lTuN2"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso74336861fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 11 Mar 2024 10:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710179284; x=1710784084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHhg0x14DE0Rwy9JhV3TBpucCCZa771jy1R7PKNjpko=;
        b=SH3lTuN25sJPMJrPTk2tfwte/tPUVy33bQ58OCpdg7S6Ce7MFGfvH25MaTLkas2Rk0
         jDNO3WMFszzZ42qm+ALwEws6zCCAi/eKi5vjCEGZhdtB5HoCqOFPW3B0IaUS7gIUzLgh
         PKQZ+LpCWbPcLfYODF4BpnR4xdFcyOxvIh6wSq1n9JQy397eW34LI1FFQRhO7Pl0VUeG
         0Oxzf3t2KGhNhAyNc0yrjzK9c4HuyR3kkK2zgc2EHzPdHwyz5SSKDgRRZ3gl10qPEhqE
         XmcL4Avo8ME0WK8oaTjfDVyjYK91hjwpN+c4Gn9Q4PzTE7IoUh+z5CTWRZijyi2Alpcj
         bXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710179284; x=1710784084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHhg0x14DE0Rwy9JhV3TBpucCCZa771jy1R7PKNjpko=;
        b=Q3Ptqph+HCd1Cyv2IZpHN3/KmLh9ywzQ8qSnTMQZVK6wzaMkbXMd9leLvqrY3Zy7uK
         ALyY/WxkhLd6uxGK+0LOJ+59fEv+fjdpspTnOjlvY1A650wkCMieQDo98nxcskWTqd1u
         65LHHPhs6lTHyAAnktcM3tBTKwNrLJmeyaQNH187TrcOtx/timYn4TzCN/VL/4V8X5PR
         A2WKndj5tSqHJVQT/3ehVqMh0RgxDdsgYd58Z9VUFgS8G40ATPmGqemwGnKjoyMCoxMI
         CtAENIUFqM5ZpHXMfRTuoex4V7o0bVwmLhSa21mrZME7kR8uJ5+DA38FM1+XYFtBHM1u
         6umg==
X-Forwarded-Encrypted: i=1; AJvYcCW9KmJJBNyCmyRUuZE9ZDfMHqyrUuj8668D0sbOHds8z15u4gl7eay/cWdd/V+wWPaOt60ZkowMsmFiz+QMVdI7UHPPrY5tL3pAD9E=
X-Gm-Message-State: AOJu0YzHf3DT65+bO4K5zlEbl+nbmNdK4qb9ZQpjnE93HclECpvkUN4F
	RmR4FUhvku7UlCOy+nJlJWuMwZPXuGkMZ+G6EtLTRCSRKzy0nZOR
X-Google-Smtp-Source: AGHT+IHxVvhvjS3M8eG/o7PEamztQ8mvtrYSePm/EMkHuSX2sVBdrwhmMH1xUUxWYLieFwdlMMDlgQ==
X-Received: by 2002:a2e:87cc:0:b0:2d3:f68e:ab51 with SMTP id v12-20020a2e87cc000000b002d3f68eab51mr3988347ljj.48.1710179284566;
        Mon, 11 Mar 2024 10:48:04 -0700 (PDT)
Received: from localhost.localdomain (89-76-44-138.dynamic.chello.pl. [89.76.44.138])
        by smtp.gmail.com with ESMTPSA id r24-20020aa7d158000000b00568525ab2e8sm1757060edo.55.2024.03.11.10.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 10:48:04 -0700 (PDT)
From: Kamil Kasperski <ressetkk@gmail.com>
To: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kamil Kasperski <ressetkk@gmail.com>
Subject: [PATCH 2/3] dt-bindings: arm: sunxi: add t95 compatible string to list of known boards
Date: Mon, 11 Mar 2024 18:47:49 +0100
Message-Id: <20240311174750.6428-3-ressetkk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240311174750.6428-1-ressetkk@gmail.com>
References: <20240311174750.6428-1-ressetkk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

T95 is a series of cheap TV boxes with unknown vendor.
Add compatible string for this board/SoC to the list of known boards.

Signed-off-by: Kamil Kasperski <ressetkk@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 09d835db6db5..1a2cef741d05 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -860,6 +860,11 @@ properties:
           - const: allwinner,sl631
           - const: allwinner,sun8i-v3
 
+      - description: T95 5G (AXP313) TV Box
+        items:
+          - const: t95,t95-axp313
+          - const: allwinner,sun50i-h616
+
       - description: Tanix TX6
         items:
           - const: oranth,tanix-tx6
-- 
2.34.1

