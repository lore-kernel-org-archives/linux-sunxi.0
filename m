Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAC53FEC
	for <linux-sunxi@lists.linux.dev>; Sat,  2 Oct 2021 20:29:34 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id dj4so48995103edb.5
        for <linux-sunxi@lists.linux.dev>; Sat, 02 Oct 2021 13:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9pxbaCe1jXd8PJ4n/lIgwYwRQ4fCdc6uEhCTsMiImNw=;
        b=cognP8IWO0Em4WyQUSXxBGBF/EP7BlFzqXdahoScz0mEHdq1e5zNTDzPkqdYYeLIJs
         THgf5K+aenscavkgU0obRVmlCzuv8WUemaNF6u47BM+cwl0O2Z8brE0l9Zt6dneb2w5g
         yunAINyGuSTTfK5vjEQR2DuBjyaDSKnTmhFWcy8zMx1EKbEWIspnXVbxPMd1tvbgA4Zi
         RkuJDZjq3gX1dmMIof4E7OXpeuThU26F5f8blyvPWrpG6vnu6odPitz0ckIBj7z1YKll
         +lsmfJhOL+AJnEWUzdzP16QzCFqohrVpNGsCkdZFKevCULP8fr7fckdoh/gw6hGFFPKy
         kNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9pxbaCe1jXd8PJ4n/lIgwYwRQ4fCdc6uEhCTsMiImNw=;
        b=cdXQR+jH2IFR0Zz8G+Kw/qBb5Ij2VthlS69DABvvv/vv2+9xegsm1KLJmV0q3pKk9F
         TrkWS++g97Y5C3i5sQxXvtkXCnsc2ehOh2X4wku2rL+hu+DbnKzv7iLXuGGenDctI51j
         5ontcWByatH/ccZakR+C1jJbhBVszuVEx6Qa2HGWOVxKZdvpRkW7jBKCCRdRhbGb7YsA
         vmKNGK2UL6ntXOzUki9T+lPCpeOA7IGuz9ACGteN9cVEUJL+jhRoe+OhntF6kukBIHLQ
         CvXAAx03yaTj8KiQBVJJz0afvhXn6Z7CxhF1f+3MeOeMEwg2OoIXwG9sXVCmGajGCc3F
         CDtA==
X-Gm-Message-State: AOAM531rXp8lKIWg006jZtkokbab1b3TKIl0J95f4sCk3jk1Z9ufwRGR
	MBvyaJwwSa9xZZu+esiUse4=
X-Google-Smtp-Source: ABdhPJwOW/INGC5vvgKa8+gZmqo37WLJWF2bpA1fFk4Jsg1ZtMEemXapHioR9+s8hHZVvsFlZL419g==
X-Received: by 2002:a17:906:1290:: with SMTP id k16mr6291388ejb.566.1633206572841;
        Sat, 02 Oct 2021 13:29:32 -0700 (PDT)
Received: from localhost.localdomain ([213.91.86.150])
        by smtp.gmail.com with ESMTPSA id v13sm4546771ejh.62.2021.10.02.13.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 13:29:32 -0700 (PDT)
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
Subject: [PATCH 2/2] dt-bindings: display: simple: Add Vivax TPC-9150 panel
Date: Sat,  2 Oct 2021 22:29:05 +0200
Message-Id: <20211002202905.509437-2-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211002202905.509437-1-pavlica.nikola@gmail.com>
References: <20211002202905.509437-1-pavlica.nikola@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This tablet display is unique and hence must be added to documentation.
Unfortunately, it's real make and number is not known due to obscure and
missing documentation and lack of writing on the display assembly
itself.

So the natural alternative that came to mind is to name the panel after
the device that contained it (an Android tablet). Hopefully that isn't
an issue.

I can confirm that the parameters that I've obtained are correct since
they came from a dump of the original Android OS.

Signed-off-by: Nikola Pavlica <pavlica.nikola@gmail.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 335776c45..1bea31fd9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -309,6 +309,8 @@ properties:
       - urt,umsh-8596md-11t
       - urt,umsh-8596md-19t
       - urt,umsh-8596md-20t
+        # Vivax TPC-9150 tablet 9.0" WSVGA TFT LCD panel
+      - vivax,tpc9150-panel
         # VXT 800x480 color TFT LCD panel
       - vxt,vl050-8048nt-c01
         # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
-- 
2.33.0

