Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA32C86
	for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 19:15:12 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id z34so47820908lfu.8
        for <linux-sunxi@lists.linux.dev>; Fri, 19 Nov 2021 11:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fqxb394vIKMSYz+aT45wHm3mEL5MPXqOdma49Y8VwaY=;
        b=iJwB34nqy9HG3nya5j2s0nxBhaPCZreKD+ipuWoSvcocEoMrzp7J3medTjaLSIUKy1
         EM6aG7L3/0L0zF3nDSdkJBN2FZYJVjblPE6YIRA2BBM0tPT1XNRK2Xg/wGqClE+F69Dr
         FmzGu0ZjgiIVEdFs0Bcbo1YZk2D2HzYuhB1JcLqpDdEMMSgq/ZdN11MU58vrg6rlAJR9
         CkPLg6rVLTwBUwgAIeZg9HrByDmz63E5gg/ZFYbb7FwfY8ARQk7HJdVbAoxaupYQjeXK
         5nTHsMq9NGVxNtXyWaMSgPQkcSnT7FGriSPJ0EY8fYNDtQxCNghqESSIOinJPBZ255/a
         W1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fqxb394vIKMSYz+aT45wHm3mEL5MPXqOdma49Y8VwaY=;
        b=DhXxVlyNQmMhKFXJJJqmDmBQdmnwq5zbfVSyc3yZHSL5k3pl+bPWzVUuGLnNjqWX2u
         rpdVcj3ofkdfPRE+pS9Yr/pm9E8i6KrYi/JOQIxzLpqOwPoKvIkn9TcDcQAMVF7AT7hP
         J1XE9bKGuu+mcTMRThBBi8+/iICT2vF1G04HzWBrot5HjG3OQ4B0RhlZJkxx0lGvW2YA
         qmtiB+tt4rTjElui2CMbdQ3jGqMBJZS/VJtPjVsL0nuXZgZM0ZgIukTUCfl81RU7STRX
         mCAj/guu9D/6u4G48BG1RUOKBWDCORBSEm31dTY3iqLv0OlIDJ+tHEHRjaU2tfzL3MYn
         Dz4g==
X-Gm-Message-State: AOAM532v4GSGSGLBeJ41RQL1Gw90QYmNElnJ4XHeNyObgQJYgBvFneUc
	l2dbjNxTgo9OFllqKE1vVh5SNg==
X-Google-Smtp-Source: ABdhPJxnPfmlGPFS7PZT7SrKD0sk9fMrMtpuLsj88vaOYKm8D4yhTPMhA8hmZgGgsI5hfat0icJE0Q==
X-Received: by 2002:ac2:55a5:: with SMTP id y5mr34563844lfg.468.1637349310045;
        Fri, 19 Nov 2021 11:15:10 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id d4sm67676lfg.153.2021.11.19.11.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 11:15:09 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>
Cc: Evgeny Boger <boger@wirenboard.com>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Enable RTP (GPADC) controller on Allwinner R40
Date: Fri, 19 Nov 2021 22:14:53 +0300
Message-Id: <20211119191456.510435-1-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


R40 SoC has touchscreen controller also serving as general-purpose ADC.
The hardware is very similar to A31, except that R40 has separate
calibrated thermal sensor IP, so temperature sensing channel in RTP is
not documented and is not to be used.


Evgeny Boger (3):
  iio: adc: sun4i-gpadc-iio: no temp sensor on R40
  dt-bindings: iio: adc: new compatible for Allwinner R40 RTP controller
  ARM: dts: sun8i: r40: add rtp node

 .../bindings/mfd/allwinner,sun4i-a10-ts.yaml  |  1 +
 arch/arm/boot/dts/sun8i-r40.dtsi              |  8 +++++
 drivers/iio/adc/sun4i-gpadc-iio.c             | 32 ++++++++++++++-----
 drivers/mfd/sun4i-gpadc.c                     | 17 ++++++++++
 4 files changed, 50 insertions(+), 8 deletions(-)

-- 
2.25.1

