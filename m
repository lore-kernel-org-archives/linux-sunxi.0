Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580FD1791EB
	for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713464184; cv=none; b=sXKY0Z2pmvgRA+Q0YV6i9Y5noaus1BG072Vvs/5Ba4+G/7/+89EHyHmYr1UuMK27ESXZIpYu1i3ucpCtbPQ5lw57RC50d6CbF9j+sKUaDTUkiLJzCJT1Fkvk2BnOzFcb94xqlvf/9p56ibrbEIZsV5TMfLhOx08Y1UCluck4Ttk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713464184; c=relaxed/simple;
	bh=vC9wNDCoFCG+63bXlhz80/EnfUoxmYoU48GUa+Mimoc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dvLFJhpd9TgeIvbK3CcjiLXoFghftyyRfuOdCrk+QgrT4P7L1ZaXwBwMYezYz3zM/MfONefptOWFQgtt9JOmxfGWSq2QimAP6UtcU1Wj9Rfg0pNafVep4W+ylPI/Zoz3Ldsv4w0MzoZD7p+FgXPsAGC6kXxmwDr3TZ7WMHzpEto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idwE0Dm8; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idwE0Dm8"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5aa2bd6f651so727860eaf.0
        for <linux-sunxi@lists.linux.dev>; Thu, 18 Apr 2024 11:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713464182; x=1714068982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx+uCkY2IHVYFvcxaqefP55bzrjYD/j8sy6xvhSzhtw=;
        b=idwE0Dm891qd4pal0+yKpPv7N/aHf3w5/zQp8sJSM6fT+d8SgrxjRxBYlk6uPKmEU/
         rTLmqy/abAnuNd+wRbnCOpcmqfymURkWUO7vYQiaRFI2PXZDf57e69+Ep+AKIWXeLh9z
         kGjJPedmmPUu85EFgGkx72yPHpBla1H3EBcrzN3BVuozHn+aHRZsoqGnrmsdnmq3LMLE
         bLN2JYutiAI3ZywGYdGl4HMjwZV64qFRhH2SgyfvdyW+P/f3kxp6bRKwgjh/yRGY4zSQ
         N3+nD0QsWUdFJqgbfSQWe2fwXymxq+rbZD2aMNxoxfWtFyivtf67zP/zB5E0W+U5cwGF
         2B/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713464182; x=1714068982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dx+uCkY2IHVYFvcxaqefP55bzrjYD/j8sy6xvhSzhtw=;
        b=eJrCXDGyMYc3OngE26VW1OpGIn+pxX6qSZm4AFGBLEsrWi+zLES8lbeLYhwX/0XZHx
         k899ySCL09SFboO36sLiiAVfH9QQjU477/9UvIO/lGYLnT92+CXTayzuFoc4lfxZ+oiF
         iWGjDZWxHjQMFGHHWxXYOIrLz7zCex7lR1uK6OjfGwyEUAFJc1YRm3PhykYkxZ1IUafQ
         1v0UXRAwsN1mConvGevUk1v6zfJhHHd9PIa3RpQmd2+jvZwnvtdziNZtDhAWqjkbPK9b
         RyuhqV0K44kvSVV/5/iVMqtf2N1akF/z+RtSOpwUGUEywOVTjLDoMcadJ8nb5PElsAvf
         k7eA==
X-Gm-Message-State: AOJu0YxiycUYO9MExiKchmEos5ElkKheWy2mHDry9uAwUHhqH+7ZHOAZ
	/xAffKskN3HW/vyZmP7bO6fz0c3KERjfbTAjJpPmy4mDcV44QIlMM2kp5w==
X-Google-Smtp-Source: AGHT+IGwcDmpvkOcf6VyHUItjQaGZIzHI+N5H26q7l37j0aPkI29YblbrKT3hqlPXl+W94+88SXJdQ==
X-Received: by 2002:a4a:5102:0:b0:5ac:bdc0:2bee with SMTP id s2-20020a4a5102000000b005acbdc02beemr3946568ooa.8.1713464182272;
        Thu, 18 Apr 2024 11:16:22 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id dh4-20020a0568201e0400b005aa77c0fe49sm483419oob.24.2024.04.18.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 11:16:22 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	mripard@kernel.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V2 1/2] dt-bindings: irq: sun7i-nmi: Add binding for the H616 NMI controller
Date: Thu, 18 Apr 2024 13:16:14 -0500
Message-Id: <20240418181615.1370179-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418181615.1370179-1-macroalpha82@gmail.com>
References: <20240418181615.1370179-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add binding for the H616 NMI controller.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
index 83603180d8d9..f49b43f45f3d 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml
@@ -25,12 +25,12 @@ properties:
       - const: allwinner,sun6i-a31-sc-nmi
         deprecated: true
       - const: allwinner,sun7i-a20-sc-nmi
-      - items:
-          - const: allwinner,sun8i-v3s-nmi
-          - const: allwinner,sun9i-a80-nmi
       - const: allwinner,sun9i-a80-nmi
       - items:
-          - const: allwinner,sun50i-a100-nmi
+          - enum:
+              - allwinner,sun8i-v3s-nmi
+              - allwinner,sun50i-a100-nmi
+              - allwinner,sun50i-h616-nmi
           - const: allwinner,sun9i-a80-nmi
 
   reg:
-- 
2.34.1

