Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3442C1FA0
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Aug 2023 18:05:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3175d5ca8dbso2519363f8f.2
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Aug 2023 11:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258738; x=1691863538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdRAieAfV+HXU2d8HHj56ySjii4cMQwtBoYAE7N8g5s=;
        b=n0fK/y30pRu67o6OdFtdPg9SBOZqPhrCfGUIUocdWZjGdUAnThcdzYcbzdDR5Cy7ZF
         Tb4BjhaShFAziu49DZm5WGefcbR8geefa8kJjdc8BO6EgWlYcMlFibBJiaEvgj9WlP6v
         qSkkm02uz2+hqpZi66JrB69ZA+yjSKuauQ3jGgYf1Nxlp2aFzSycIoAcf4bklWfTILZA
         v/fVLZmzWwh6YwsMLwsmDw2UMQXXP0k0iol0blojjuQXXalegi1jH91cCOwFeLvT8J2i
         qlEXnndY6XpbggsMj9nzzDdKUDtQpzljDFtYbAqLz+ivTVk0PtRzBfmWnCXbzLTpMeWY
         5N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258738; x=1691863538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdRAieAfV+HXU2d8HHj56ySjii4cMQwtBoYAE7N8g5s=;
        b=iabTKZkeIu1EwDs2KHXHXwz6Ba96mQ1rbXc70R5QZMKm6689LbXAtTi692pCy/pTAa
         Qm8RIMuSwU4B2tOqMLrPCUMMl3ISYFXvLy0rThGJrbV28qmBwzflVOLKNCydOPooGaOs
         /TpndjmDxITkXckzbvkkivV+zNrbRwrXXeGZ0XWgHunJNI4UnUI21sVA1DBayN0pq+3s
         UiFm63a0aNu6qin67fcw7xm0M23LKsG0RpyZ3cpOm8R5H7SFEQun/7i/lOsTDBxP72j0
         PoRNIXuRrhiLdBfv8Eforb92YjOFGP0Gkvoz7zTm9S+jieDkh5IRaafHQEiFZF7S4kuX
         8miw==
X-Gm-Message-State: AOJu0YxXGl0Ip2zRQh413f1Hlf/Sl4G/DdMlu5i9C/v9mb/LHe+jhsQQ
	PwwcUvFnxFsubu+/ZHgtcFM=
X-Google-Smtp-Source: AGHT+IE+5m/SQ3eshBedJihbRDlO9MZ+wChC74UcCgeJKgphC3WBm37dlSMr1RZdbjAWZFPdnVj2lA==
X-Received: by 2002:a05:6000:10c6:b0:317:6fff:c32b with SMTP id b6-20020a05600010c600b003176fffc32bmr2915238wrx.53.1691258737930;
        Sat, 05 Aug 2023 11:05:37 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:37 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/5] ASoC: sunxi: Add support for D1/T113s internal audio codec
Date: Sat,  5 Aug 2023 21:05:00 +0300
Message-Id: <20230805180506.718364-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is the series adding support for internal audio codec on
Allwinner D1/T113s SoCs family.

My work based on Icenowy Zheng's patches from sipeed repo that adds
support for the R329 audio codec. But, unfortunately, these patches
were not sent to upstream. So, I adapted them to fit the T113s.
In the future, support for R329 could easily be added on top of
this series. Because D1/T113s and R329 SoCs have almost the same audio
codec IP, with slight differences in the analog part, plus the R329
has two additional ADCs.

The series includes modifications for the existing sun4i-codec driver
that brings support for the digital part of the D1 codec. And adds the
new sun20i-d1-codec-analog driver for the analog part.

I would be glad if someone have a look :)

Cheers,
Maksim

Maksim Kiselev (5):
  ASoC: dt-bindings: sun4i-a10-codec: Add binding for Allwinner D1 SoC
  ASoC: dt-bindings: Add schema for "allwinner,sun20i-d1-codec-analog"
  ASoC: sunxi: sun4i-codec: add basic support for D1 audio codec
  ASoC: sunxi: Add new driver for Allwinner D1/T113s codec's analog path
    controls
  riscv: dts: allwinner: d1: Add device nodes for internal audio codec

 .../allwinner,sun20i-d1-codec-analog.yaml     |  33 ++
 .../sound/allwinner,sun4i-a10-codec.yaml      |  64 ++-
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  22 ++
 sound/soc/sunxi/Kconfig                       |  11 +
 sound/soc/sunxi/Makefile                      |   1 +
 sound/soc/sunxi/sun20i-d1-codec-analog.c      | 220 +++++++++++
 sound/soc/sunxi/sun4i-codec.c                 | 364 +++++++++++++++---
 7 files changed, 643 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
 create mode 100644 sound/soc/sunxi/sun20i-d1-codec-analog.c

-- 
2.39.2

