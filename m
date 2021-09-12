Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3903FC5
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Sep 2021 07:29:24 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id d6so9381984wrc.11
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Sep 2021 00:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZBdcwxffYSz2RZwsY3FdiDmTR5iWVRuIsz5WG9s6e0=;
        b=mbstrXTZ7CJiqgHTD8VzbSlUC5f6gbW37gVX8U1iiDAj/2mWI2mekhdTml88dmdD5j
         V+rGzH+CeRwm4cC/MgzrxEm3KfMylmQAUszcB+yz9/QADmMXzczGMgAvbClBXXPezWPP
         2KySYmMvvflXGznsO/uxHdmT/Bbv17WAtj/WGSuX00yAcCWbr+3tmc/zasDUxRzsYg1d
         QK5I1SwNqT/Y318H0RkT/Kie+iToCUI01OZ/wffJUsMrqlD4saVwGpF8wdlXlzgdZVJM
         fafkaoj+jqafTRhMqRb6+nOmLeTUzQWMpjid90n1YyFPNguJpT/93Hh8xTYkMWacaj3L
         Csbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZBdcwxffYSz2RZwsY3FdiDmTR5iWVRuIsz5WG9s6e0=;
        b=NKKY24imrxlAFAO4dL8HkzneaYPsSvqPm+0bfAcPAwdGhPHFlZvFdqBDX2deYgN1HT
         NeaLpp11gvy/0WbsPpNHEvoVSAQUnXJJGQ9gHOg5sGeTyfnPneBaELT3MljZoZomGQyv
         4uKkhKSWOOiHBwLZvYqVBzv+qrUWisfsomZYz8VIqm2yIY05d9LAZz6s/JTRIKXkAqF3
         1Rqgoag4m3jUljUO1KM7H5yn44J+k60xUIc3QAmGM5jXFtEPyErHdqhFGxO1fEezMewS
         g/VCpjNzePOED9MJso50cnwm2p1CnhZbBED578hew5dOjckyXY7wLLF5/vd/HQYw0mmf
         +5aA==
X-Gm-Message-State: AOAM533VS2KRQ9+/ay9IzhrClTagFb9Jdio26/XQ0Hd/MoJH5C+EPMbs
	Rj/A8fjx/ePzyNEyyPZGX0I=
X-Google-Smtp-Source: ABdhPJz4nvfQiFNKXBcEJWr2d1iLp+AdlSJBArr3BW9WSAH6qQxaUTFzEymeHIWc0lqAOCiJ+EZ+Xw==
X-Received: by 2002:a5d:4f88:: with SMTP id d8mr6382713wru.358.1631431762809;
        Sun, 12 Sep 2021 00:29:22 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id t18sm3584889wrp.97.2021.09.12.00.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 00:29:22 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: robh+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] ARM: dts: sun8i: r40: Add I2S nodes
Date: Sun, 12 Sep 2021 09:29:12 +0200
Message-Id: <20210912072914.398419-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner R40 has 3 I2S controllers, compatible to those in H3.

Patch 1 adds R40/H3 compatible pair to DT bindings.
Patch 2 adds I2S nodes to R40 DT.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (2):
  dt-bindings: sound: sun4i-i2s: add Allwinner R40 I2S compatible
  ARM: dts: sun8i: r40: Add I2S nodes

 .../sound/allwinner,sun4i-a10-i2s.yaml        |  3 ++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 39 +++++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.33.0

