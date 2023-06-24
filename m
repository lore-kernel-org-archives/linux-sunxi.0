Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5727F1384
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Jun 2023 13:16:54 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-313e742a787so136197f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jun 2023 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687612612; x=1690204612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAPLdJ1hRBKYoDfC7BxuOkW8oX621hvqZ4G8PC6WVsc=;
        b=PH0n1FQU36Z0dHZzPpw68V3rlOsp7moXOEmfaBt3Wbhq8TqBVHJWT2PqEcFduHPw2b
         e8jze0QXE/vtzqa6M9HCgvp9TK5psbOBZ0x72hBRIwQZAbJ7eRs1Bw2udOznVh3/AdCd
         197AotubSzYP9d7b9++XatULfFDzyvw5rs6UO4nWiXCISgarNliSnlLoJwfNgB5lPyrY
         bz8R2pwk/HJLVZq1I6J01bZvQ28CP8hcsgf1o4+RiVCY957zfvLCaxZtjNg6uoPEBwLK
         7MwyExU4U1A1JjBWylSWEG8eZjK/zECNkmFH8n3aAyHy4O1QHGEPgZVcKI9TWwdLGEA2
         Lsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687612612; x=1690204612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAPLdJ1hRBKYoDfC7BxuOkW8oX621hvqZ4G8PC6WVsc=;
        b=THdjL6JUTmEWBY4BMsuQCbHnymhteKXAhPpVFbtSjhCqTOnbFqPt4a0OLPLfZbjDrb
         vtH53jgHh7YbTVXxH7aFP7ogrfeA0J44fBv7vbkP2xpX1Ag9CfH+F5IRLYF1ME4Nm49d
         s2ekHLUPKYz1KvhhRjyRLnlYjIxkt/uJaqHCHRIUq/vYvpyfFZ1jagV8O4ZvJZl/FmHi
         kQ4yRjL4HlFy2dIlnZJkGhtgwuvEtrKe+dBGhlX/TM9OIOljXd5XOYnLvC6SgveFLdKm
         VSiTwzfyIhdS4hAiQtV+rDo2w2P67fzgEaaCx7YFzvIpICl/KGuVtfjCcCNU91xr6INA
         30qg==
X-Gm-Message-State: AC+VfDwdpHOTnPV0ywe52nkUcegmUZxfV1jQPxLV4L9tBNxVWEWzJJzV
	jq1gMK85ZPmR9tN3bjMkigg=
X-Google-Smtp-Source: ACHHUZ7P2aSXnvI92huJ7ELPjVwzFyP5E+B7pL/1YCe1HolDXBTc7AHjIzHzD9wkkH9ja9mRwcXpLg==
X-Received: by 2002:a05:6000:104d:b0:313:e740:4956 with SMTP id c13-20020a056000104d00b00313e7404956mr582260wrx.25.1687612612033;
        Sat, 24 Jun 2023 06:16:52 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id l1-20020a1ced01000000b003f9b0830107sm5107428wmh.41.2023.06.24.06.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 06:16:51 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Allwinner R329/D1/R528/T113s Dual/Quad SPI modes support
Date: Sat, 24 Jun 2023 16:16:21 +0300
Message-Id: <20230624131632.2972546-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the previous https://lore.kernel.org/all/20230510081121.3463710-1-bigunclemax@gmail.com
And adds support for Dual and Quad SPI modes for the listed SoCs.
Both modes have been tested on the T113s and should work on
other Allwinner's SoCs that have a similar SPI conttoller.
It may also work for previous SoCs that support Dual/Quad modes.
One of them are H6 and H616.

Maksim Kiselev (3):
  spi: sun6i: add quirk for dual and quad SPI modes support
  spi: sun6i: add dual and quad SPI modes support for R329/D1/R528/T113s
  riscv: dts: allwinner: d1: Add QSPI pins node for pinmux PC port

 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  7 +++++
 drivers/spi/spi-sun6i.c                       | 30 ++++++++++++++++---
 2 files changed, 33 insertions(+), 4 deletions(-)

-- 
2.39.2

