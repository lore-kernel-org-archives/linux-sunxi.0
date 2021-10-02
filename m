Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7673FC9
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Oct 2021 20:29:33 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id l7so24390072edq.3
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Oct 2021 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vt8iMexHSdD7KbcYDMZcdIIcyzlp3dp1Lof2sQDbqO0=;
        b=M/mzD4/EMeKIOCfJBivq3S4lbawIgHIBp794vss/bPAb9x734BRVXuFVVeunx7Mjqg
         SwWoQjrRlTaP9IJYmIHXkBYFII7A9IkH978/b1/pcib6WdMOduW6c1qa5WO55h8jdwVH
         VLoNIQKXDhTi2fQZ21UBda9RGzZgw3tZj52LQGReC1EgoQwBW+VRwJRv3+Vduh6s+w4b
         c2QjkVyj1iOE7jPLpNKKbbJOADgLas6420+39W/+vI6oCrzBiC8N9cFcYJcB16FeRchX
         rc4iNDyh/6apEp0c8+AtBzE6lEM2bOfxQjCwLSIFgphSyHxNxOfgq4xVtjO4Ryw9/AgL
         uOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vt8iMexHSdD7KbcYDMZcdIIcyzlp3dp1Lof2sQDbqO0=;
        b=b/ZbbDytpVaFjwvXeMHoBCImZ4hxdqW5qc9x6LAib5KoDjjo80/Ov8Tb8zHFCHvN1r
         jjUPaWRgb4928KPbywaDnWRpwpTDKVDc4hYEVxgAAh+iCaCX9Lx1LFkITP3bKFJnMqht
         yEoCSh5aKw+qDds4Dg/hLB18EEZlW0BJQT8x8oGICKrPdKifosyZZxxfn6n0SjXd0xNZ
         9NGjfJT5RWiBcbb1RsWYqHOKgeSzLwEdRnLxuTBLfqKUulUFDq2u56t/HO6qFNJV33p9
         RF9VDVgbgyssRed7EaOPWenwKp/DMK05SBmIgroybyaFYrey0mMHxZZS4PEFqBcESeYg
         LkPg==
X-Gm-Message-State: AOAM533Srib562N66asoQHpSdaX/U0ZZ0kdBwXrU7TdSR1u99WH0xkuV
	EJcKp8yRYLvYhEVTQ2SBssI=
X-Google-Smtp-Source: ABdhPJy0d8P8w3XvIbR9dgUeoowMYVdxVx6bZnqiPHejidI5ELd5zXNysiRwgmiPD7bkyV4B9le5KA==
X-Received: by 2002:a17:906:ad5:: with SMTP id z21mr6255743ejf.109.1633206571868;
        Sat, 02 Oct 2021 13:29:31 -0700 (PDT)
Received: from localhost.localdomain ([213.91.86.150])
        by smtp.gmail.com with ESMTPSA id v13sm4546771ejh.62.2021.10.02.13.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 13:29:31 -0700 (PDT)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: devicetree@vger.kernel.org
Cc: thierry.reding@gmail.com,
	sam@ravnborg.org,
	airlied@linux.ie,
	daniel@ffwll.ch,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH 1/2] dt-bindings: add vendor prefix for Vivax
Date: Sat,  2 Oct 2021 22:29:04 +0200
Message-Id: <20211002202905.509437-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.33.0
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
index a867f7102..1a7d9ca02 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1264,6 +1264,8 @@ patternProperties:
     description: Vitesse Semiconductor Corporation
   "^vivante,.*":
     description: Vivante Corporation
+  "^vivax,.*":
+    description: Vivax brand by M SAN Grupa d.o.o.
   "^vocore,.*":
     description: VoCore Studio
   "^voipac,.*":
-- 
2.33.0

