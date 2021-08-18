Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F182FAD
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Aug 2021 14:47:08 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id dj8so3575993edb.2
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Aug 2021 07:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=icsU2c4V7+U87qo1ckZmLrJ2sA4CpW/juiJiyR0EYQw=;
        b=H2nEEL9iAcu2bnwpcjo6Mdr4TgkXA/9QqMtfJmxcmUorajIrrx04PJdHlaY1mXVoQJ
         a2nZqCrMTRnagWFtxNqfsbuJvYzn2x37+Ilzi9BzFLvegYymkhEuIrlzuMgWe6V+Bwgh
         vBiDdDTbUgJ5PX57E3Tzl/pJJNVIY3pytq/G/MW0nZc+W5/qsKFlRo0ENDaWOFl6VAcD
         FhJFtzPRkVBL39IMSDZC/6Ts+Kqr6EvjPhu/+x1Dj70XMWYH7ObIBNb2ddnKcKnLXMPZ
         6H29wEsZ6CN4de8RBcqP3ixralaJ/5MwSJ/z4wSuVJu3Zy+aRgWqlKvGE/YkKzV93F6r
         kPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=icsU2c4V7+U87qo1ckZmLrJ2sA4CpW/juiJiyR0EYQw=;
        b=IkjeE9vylOTfUyxfslxpuvjOA5qKxtFgIt9l8Xoj+WGxFx6SGQpO3BjOXvaGd6M1bB
         63XYxfMQmZh1WfZE+RUYqAiRcsTYggqR63YpegWODGYO1S+YL7ayjH/1Y/UXYUhiJgvL
         atvdwDcL0LmQfUWqLyuJtIh78yInGO0zVNowfkG1DdgTB/tuWzrosbQ6ZN8fuLV8/3sM
         jNC6bz0OTI39W4fqJiDVDdg3EyC0g3klLt/TWabyTsc8L0bc29m9XxuAqo68wcUz5VD3
         MO8OTvk+7JAaE0ZaHZqrufYihUatoQQVFOxP7YOf/OCqrQvOd43a/escej0/Fq7xK1iu
         pKEg==
X-Gm-Message-State: AOAM532scYoMQvVZRG+dPPLnZ9/Bv1kV6f2Az+mz6inEnlJmPUTxGgOp
	tJiaZKZreeulIdSnQaA99W0=
X-Google-Smtp-Source: ABdhPJwM6xuEDtGMvk/m6OHHby1b74xL4bKzdUKxbakaO5bNUGtTJ4tBP98RfyG/vDG4sxVhN2Pddg==
X-Received: by 2002:aa7:d04c:: with SMTP id n12mr10646382edo.342.1629298026898;
        Wed, 18 Aug 2021 07:47:06 -0700 (PDT)
Received: from localhost.localdomain (neth7.eastcode.net. [79.143.160.90])
        by smtp.googlemail.com with ESMTPSA id x17sm2152808ejj.58.2021.08.18.07.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:47:06 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: thierry.reding@gmail.com,
	sam@ravnborg.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH 3/3] dt-bindings: add vendor prefix for Vivax
Date: Wed, 18 Aug 2021 16:46:48 +0200
Message-Id: <20210818144648.72665-3-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818144648.72665-1-pavlica.nikola@gmail.com>
References: <20210818144648.72665-1-pavlica.nikola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for the Vivax brand by M SAN Grupa d.o.o.

Source (in Croatian): https://www.vivax.com/hr/o-nama.aspx

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424..c234c392538d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1206,6 +1206,8 @@ patternProperties:
     description: Vitesse Semiconductor Corporation
   "^vivante,.*":
     description: Vivante Corporation
+  "^vivax,.*":
+    description: Vivax brand by M SAN Grupa d.o.o.
   "^vocore,.*":
     description: VoCore Studio
   "^voipac,.*":
-- 
2.32.0

