Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3DBD53E
	for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 19:31:33 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id a14so31642387wru.5
        for <linux-sunxi@lists.linux.dev>; Wed, 16 Nov 2022 11:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Trwv5nmiMu3txEdazub9avWN4gnKwT8sOlk30QnmJwg=;
        b=TpR01OSJYvsdxK5CvtEpxvA38/rAnBpnwSoKmqIekRAqZwQBoPSV9Xj2Ne3wK/Sdof
         4eWzngjNSKuqa81iPoDWL5je0mOPCWG/Rvv/u8jQP+/ajPySKZ+sqlRMO67N8boUB9k4
         ZocpAowec4j3kY7AZvLkvV2OAVf022ACl133s5a7KDtK7/C+l8eGMgEZ876c098nNCOL
         Lo4pNKwoZE8NyCgxjjmXojeBiGsTQEPC3vz4QdBFueYOZdMNv9EnOIxnbW4yalJJEr+u
         dGn1MNb9q3nBlGxmR75VnEmsEybTFq0fHX+pqkkAnPNfo/vEEg3gT9IQOh1JR6IhhzP8
         qBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Trwv5nmiMu3txEdazub9avWN4gnKwT8sOlk30QnmJwg=;
        b=AfUIiCshADBORX9Hsry4310bVsS3/O09fmL8Xg1h2K9jH4oXmxGM7mAsQ7nzC4Arxx
         IofZW+tWwKK8OyaESdRApFrPfr/uO42Ib+5e9C5j4NSWA3EQCk9+tGuiePPAEzOwjydL
         nd25yzNJZzbba6YBb+tiCZF1q8jt6OKw5l9/zl1hgfTmc4it5kWmYamOZepdXlOy3lla
         y9LZbhLTnqXgX+gKcqmaxM5YHAG2pYXNz23Wx97lCzIg7lRVgTbZfJCeTv8ihMdhV1GA
         R+Rqp2vY03Nq/PSSWzbqxClGxCFxcYmFeYnQrDTEZbQLc7SktblUh3I6NgUyVBvaNXrJ
         Pm5A==
X-Gm-Message-State: ANoB5pmNuusyb98IF0mn3KBkL8veKlcYHHl1RLJDm7H+a0LUY49hFndA
	V7bvMzJMjJMr4jiggsWUMgE=
X-Google-Smtp-Source: AA0mqf7/xPmVf0Rh22RU3CMEhI/LOjiRILBHHKXXqC9ktwO3Ja61VlrpZ4x4Cinr+HUtE54Y/6SXaQ==
X-Received: by 2002:adf:ea4d:0:b0:236:8fa1:47cf with SMTP id j13-20020adfea4d000000b002368fa147cfmr15476153wrn.50.1668627091714;
        Wed, 16 Nov 2022 11:31:31 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id q125-20020a1c4383000000b003c6cd82596esm3044646wma.43.2022.11.16.11.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 11:31:31 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mchehab@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: allwinner: h6: Add second IOMMU reference to Cedrus
Date: Wed, 16 Nov 2022 20:31:03 +0100
Message-Id: <20221116193105.363297-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It turns out that Cedrus on H6 actually uses two IOMMU channels. Manual
mentiones two IOMMU channels, but it doesn't specify which is used when.
Page faults were also observed from both.

This series updates binding to allow up to two IOMMU channels and fixes
H6 DTSI.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (2):
  media: dt-bindings: allwinner: video-engine: Fix number of IOMMU
    channels
  arm64: dts: allwinner: h6: Fix Cedrus IOMMU channels

 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml        | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.38.1

