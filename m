Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E542CA6
	for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 22:03:30 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id 200so10592231qki.2
        for <linux-sunxi@lists.linux.dev>; Sun, 30 Jan 2022 14:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SY9YKyrTOsZYdhpR7gLV9XUnkAxeX5e6CMz+d+vP15g=;
        b=RvK1d0oNjw7XDzLRnZ8VsvbHJycZTAWrUI5YeHJNSKO5tTQkCbx7TrkqIZ0w+mD1TM
         DbC75gPJ4NFIs3R4ANpkiAkffMTXp8dQRcfbz3+ifxHnNF8jG2zoK5gTW1vTGBs3n7au
         xz9NirVrNWfUNEPNCojT25wxC/V8PQyyIM28hE+S4niQ96IQh7pgez0NXh3SXhhaeKzE
         5KrwyID6ZEwUjUmjc8GEIoxHgdFqMv+qGjDvX7PrFTaab6nSLMOl+Sw0LP+u2Nfml84X
         KwZUqJ2PBksiqi2yWXDUc9oMTELQ43kXFboL7i27n+1RjfD6bKgjbybNc8zq5rfTlfG4
         /8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SY9YKyrTOsZYdhpR7gLV9XUnkAxeX5e6CMz+d+vP15g=;
        b=P3ynmxpWlEnZ9K+l5AcizMKjUKN35AKEW5+cVZ2/RCleD7rVf/Vf7kyIj1fQODE6ce
         fFC3mJ1nu1I/YYmqMHBRiezqD5MdVMi7jWMFgpoZ7tdKuFIqhlUuqfV3xV2H1iMm0/PZ
         zvpiRZmrddmRPjPq7ba51kZLyUHKl1jnXL7Czr3QX0VBSHOA5DeZslsaXV0JgQ5tgQXs
         /CT+GXEl2SBY7McdYjAJiQfidkC0eSFQb4TV1sNA/NPbnYQLrnX/NRuz8PhvkxrdEQ9Y
         Dv0vvJx1K0fFRTMWxbvqoRW/iN1sF6yC9l7981tIq3tNundE+sp3+IPN/wRyoZ/JWp7H
         wmLQ==
X-Gm-Message-State: AOAM531GN+n36rSsb/HwoWJ9FLZxXC0mqeAOvCT4gmRz8J5oKt9P36kB
	fJxJ+bSo8DksP4+UMZCFQ6Q=
X-Google-Smtp-Source: ABdhPJzyrt88bgpefLRdQwuEGsixY1dfgovZLKKnuwMJxiS28ieAUANxCGWfWyq3TjQ3xQw4ckm5WQ==
X-Received: by 2002:a05:620a:4048:: with SMTP id i8mr6032906qko.482.1643580209305;
        Sun, 30 Jan 2022 14:03:29 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id h12sm7556651qkp.129.2022.01.30.14.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 14:03:28 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org,
	Mr.Bossman075@gmail.com,
	andre.przywara@arm.com,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] dt-bindings: mmc: sunxi: Add Allwinner F1c100s compatibles
Date: Sun, 30 Jan 2022 17:03:23 -0500
Message-Id: <20220130220325.1983918-2-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
References: <20220130220325.1983918-1-Mr.Bossman075@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for F1c100s's mmc controller.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
* New commit
---
 .../devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 4f62ad6ce50c..76137132500d 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -55,6 +55,9 @@ properties:
       - items:
           - const: allwinner,sun50i-h616-mmc
           - const: allwinner,sun50i-a100-mmc
+      - items:
+          - const: allwinner,suniv-f1c100s-mmc
+          - const: allwinner,sun7i-a20-mmc
 
   reg:
     maxItems: 1
-- 
2.34.1

