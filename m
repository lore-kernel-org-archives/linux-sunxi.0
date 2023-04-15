Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18CC137C
	for <linux-sunxi@lists.linux.dev>; Sat, 15 Apr 2023 10:47:04 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ud9so51659784ejc.7
        for <linux-sunxi@lists.linux.dev>; Sat, 15 Apr 2023 03:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681555623; x=1684147623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICwYyWWnryvHm9RgRWeq29kRBlsUBNW7tslN8BXiwmU=;
        b=BQaKk6QpiVmZPeB/smhkVOuNZTbb+v8ly+PlkeCAAUt25cyNgPCVm9EHDY1zU5H9ZJ
         GVarHQ5Bc6ZcGPe6Bwfk8vERzbJADby9E/E4YAXf9GrGff/klt/bFP/Lm3NC4VKujCGF
         vHOa1yCSPHf70VHMBwULihW2kIzTwHzKKADr3KbFPA53nKl5Xb6wT9FbFoZv8LTZ/mH5
         hTjRz4qA8W12+1+3cOV2vzKvjJMUW0G5cSRcoXl0bdyEgPAPNH3nS2aL9/6bZcLTxOI3
         hPzl/BZxx9dUBa0lM+AOa+Ts1Dh7s6E2VR25Q7p8TuWCo5L7ZgLE4cxSLqulgNyQgrIz
         MzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555623; x=1684147623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICwYyWWnryvHm9RgRWeq29kRBlsUBNW7tslN8BXiwmU=;
        b=BqIpdtx5KMemkBsEszVagx5z/mVy7mjRwOq//N4JJHvv1ErBY4ShCXGygD5BvUtG+A
         poC6fJZQpyvVzI5BEfEPlJ+ZztzN48cM/fhLH1RxC1OyOBRlRObsCbL+sFjbxpYCRFyO
         7VomKYQvqnytKEGvrzpcma2tc6XRkOGqZwbcvVQ3IIIhG9jH4Bs9WODiw0Pv7ICJqcTB
         8ZqQ2GOy98j6SNAy8ZEtI7SsF5iGaHBtHQpSr2dVmS5tBZN8KAuQ2a3o6wJPYgqpRCQ9
         vqfmFMqBKX+hkrOXltcxR/mp51otqGfXzj8avuC0Ox0x1kXENUxDpQcwCudpGKJQiMZD
         wvJg==
X-Gm-Message-State: AAQBX9c0jkoRRq0Z2JaQZbCov9tnf8SsM+0tO+DtEnnGPqP2T96Ccpk2
	0qbj6hoM351nnV6s6WeAdIc=
X-Google-Smtp-Source: AKy350ZlZmmQo025rfm2e2tAa9xyZl6HKwCyENZ72HZZ0DvAjQTuASLgS7n6KD8a24YZf10jRtRI2A==
X-Received: by 2002:a17:907:2087:b0:94e:fe0f:b2be with SMTP id pv7-20020a170907208700b0094efe0fb2bemr1577373ejb.14.1681555622742;
        Sat, 15 Apr 2023 03:47:02 -0700 (PDT)
Received: from localhost.localdomain (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id m15-20020a170906720f00b00947ab65d932sm3607034ejk.83.2023.04.15.03.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 03:47:02 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org
Cc: Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	airlied@gmail.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-media@vger.kernel.org,
	hverkuil-cisco@xs4all.nl,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/3] drm/bridge: dw_hdmi: allow to disable CEC from DT
Date: Sat, 15 Apr 2023 12:46:10 +0200
Message-Id: <20230415104613.61224-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Boards can have perfectly working DW HDMI CEC implementation but they
may prefer to use bit banged implementation instead. This is the
situation on Beelink X2.

Add DW HDMI DT property for disabling CEC. This prevents confusion on
userspace side by not exposing unused CEC interface.

Best regards,
Jernej

Jernej Skrabec (3):
  dt-bindings: display: synopsys,dw-hdmi: Add property for disabling CEC
  drm/bridge: dw_hdmi: Handle snps,disable-cec property
  ARM: dts: sun8i: h3: beelink-x2: Disable DW-HDMI CEC

 .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml | 5 +++++
 arch/arm/boot/dts/sun8i-h3-beelink-x2.dts                    | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                    | 4 +++-
 3 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.40.0

