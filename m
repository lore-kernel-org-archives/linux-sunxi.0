Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D1E2F80
	for <linux-sunxi@lists.linux.dev>; Sun, 12 Sep 2021 07:29:25 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id m9so9423930wrb.1
        for <linux-sunxi@lists.linux.dev>; Sun, 12 Sep 2021 00:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q4RL0sqYDQpryks2hL9tjkn/HeWDVonzaaoKuLG05Vk=;
        b=kV0FwxCcUZPNv2Sxt7roikRo7jM6LiDDicK3Z0IAjf9ahaa9/SsZpSS8lIFmdFQajj
         xka8kYlyccXLabLzhnOcQpIkfve3AA3L8dWk2RWcgt5adAy0pj39oLYYKbM4ik0cORKQ
         gDo8aB3rA1Ybkd1MEzEZkvW3EEpn74O9kzlJZ7IFsEb3rdwWmHyV1f+slsZ7XL4kKLKF
         Iqiyt6FtmRE+ceskzSZw3X7zXHetZ1wrpc/tL8ZSYHUqhuVzYn59JWOyPxMpmknxroPZ
         2SXDjJDrbkMjDhXHJ8zYH0dDKDvNPGmXJ28LFJFjPcQ37iXo3y0E+PnaCbMsqkYsTqlk
         9ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q4RL0sqYDQpryks2hL9tjkn/HeWDVonzaaoKuLG05Vk=;
        b=5/vkAS4wwiN6P4ghovE7LazKd8R1L1SqLKPPYdTMQbO4nB/LFBaX8u61KOpwSYx02n
         w360/pn7HJl+GslfWx2I62AGrMW8F2rnLNcePYCaNeCBELV8qwZ9yy8UODeAYSkqud7a
         jMlsU08uee01CQsm1KHIRQpHogOyPG67hI4/WNJG0aRSyIgRSG5Wzb5+zex385t32VSP
         YxwRS6EpOlV1C54vXuxq3iAwt9B53ccaOVdJ7uOtdjFOhFuqZ68MVmKq2Y1aP95pXEqC
         ICub1uL+gcQxTL/0+asyOTFBOijhMEE6X1NeSFj3G0ndS1mvxVj8BNw6idFgE8EBArjj
         TuRg==
X-Gm-Message-State: AOAM530ScyNUmbFcihFwQIzk2edFAyVtsBUkOEop4/XWmkWjw8fooodr
	fiE6ABl5qRlJyF2LFYS9O1s=
X-Google-Smtp-Source: ABdhPJyzGL9pJtzMKYuimQOy8clVHIFsJ1uTW6/YaQEONAIxa49BkFdACyZzJGio4nTTzUBvHyzDNw==
X-Received: by 2002:a05:6000:1081:: with SMTP id y1mr3890013wrw.14.1631431763798;
        Sun, 12 Sep 2021 00:29:23 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id t18sm3584889wrp.97.2021.09.12.00.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 00:29:23 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: sound: sun4i-i2s: add Allwinner R40 I2S compatible
Date: Sun, 12 Sep 2021 09:29:13 +0200
Message-Id: <20210912072914.398419-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210912072914.398419-1-jernej.skrabec@gmail.com>
References: <20210912072914.398419-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner R40 has 3 I2S controllers, compatible to those, found in H3.

Add R40/H3 compatible pair to DT bindings.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 39b66e9ce3e3..7d48ea094c66 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -20,6 +20,9 @@ properties:
       - const: allwinner,sun6i-a31-i2s
       - const: allwinner,sun8i-a83t-i2s
       - const: allwinner,sun8i-h3-i2s
+      - items:
+          - const: allwinner,sun8i-r40-i2s
+          - const: allwinner,sun8i-h3-i2s
       - items:
           - const: allwinner,sun8i-v3-i2s
           - const: allwinner,sun8i-h3-i2s
-- 
2.33.0

