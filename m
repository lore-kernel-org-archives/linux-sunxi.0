Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0898815AD
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 21:02:19 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id t25so33464269ejb.8
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 13:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UyHjDH2OkNpKB2ikr0TO8Pj6bQxuxcX9QhNW0e830ps=;
        b=XpyuldZcA2USszrkDGtQyVwFDTemciAp0kElwwETiPYxuUV2HXYkLGzvYduc5OFpNI
         YLhG1lLfVcjL2yEjgtUJCrdj+jiZLDsY4YbLQIfAqvhkdTzieWYLKtIuCqOOBpuPd/yV
         93nl8anaDa2xwuw1U9ptaR4MtxtfG9EHwlhIVJXO3T38oWZP3gYV46B82Tyzkl9dimNI
         /fiBUejbD+l6zrIYaFCvsEUo9uqi1gnVkt3FBLwHtRoRYcFFwnEhz8j1RplUkUiFQ+F8
         zHIO0NYCXx+EwNknXxzS4pXRaEEpRsnfs2GrlhUgrQJSXcWuhPvPP7R9zWvuYTzTmI1I
         oJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyHjDH2OkNpKB2ikr0TO8Pj6bQxuxcX9QhNW0e830ps=;
        b=k6Nv3rihGbgRkM8dFZ+LCIqpJL4d5+veVT0JJYk23/PM35xDYRCa2uoRZLTft5dtRe
         geAIjCKXD0Vupo65G76UdFjPoaljubq5r9QvHlJHbcA3TlLEnBTd5msFHETP8MLJHhk0
         Hm2YWioaBImV/cuVDNqzq2m1HtnSOHTZqXlsdwAcv+8DWwXNT9U7oJbgdxK6lYYDAMtP
         oURM3v8ijZa/cK+hLm1dRbXMBonM6592XgBQVu5xfwWM4EnEknuhjQliHo2Uv9w1+mf6
         mkt5iVtm057bFX1fttJb3By32jEWgxDOKpdFldAT1iZ6kwmg3CGvlA6+GfTIwpFyM9Kg
         rRzw==
X-Gm-Message-State: ACrzQf3ep1pZiL3iuQHw2e7lSbbbmtpgFpjE+Sc+nxDrXHED7rsqXyTt
	+NOSQTc6KwvZhwm10tyUcNU=
X-Google-Smtp-Source: AMsMyM6ZfIIK9O/eDcoFcAmmG+B0PKBsNHl6D9biVAzXEQfdGkdPy4y8uA7tr1eFqDPC07OKJ/vrKg==
X-Received: by 2002:a17:907:d89:b0:7a8:d67d:87d3 with SMTP id go9-20020a1709070d8900b007a8d67d87d3mr18091609ejc.364.1667854938119;
        Mon, 07 Nov 2022 13:02:18 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id k18-20020a05640212d200b0044ef2ac2650sm4638472edx.90.2022.11.07.13.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 13:02:17 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] media: sunxi: Add H6 deinterlace driver
Date: Mon,  7 Nov 2022 22:02:05 +0100
Message-Id: <20221107210208.284261-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series implements driver for H6 deinterlace core, which is
newer version of core, covered by sun8i-di (v2.3). Contrary to
older one, it doesn't support scaling, but it supports iommu,
has additional motion compensated deinterlacing algorithm and
supports different pixel formats.

Best regards,
Jernej

Changes from v1:
- use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
- move memory allocation and freeing outside lock
- call devm_request_irq() later, so base is already initialized
- call platform_set_drvdata() sooner
- deassert reset before enabling clocks
- set mod clock rate to 300 MHz
- set min size to 32x32 and max to 2048x1280, as suggested by user manual
  of D1, which seems to have similar deinterlace unit
- fix header year and guard
- added tags

Jernej Skrabec (3):
  media: dt-bindings: media: Add Allwinner H6 Deinterlace binding
  media: sunxi: Add H6 deinterlace driver
  arm64: dts: allwinner: h6: Add deinterlace node

 .../allwinner,sun50i-h6-deinterlace.yaml      |   74 ++
 MAINTAINERS                                   |    4 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   12 +
 drivers/media/platform/sunxi/Kconfig          |    1 +
 drivers/media/platform/sunxi/Makefile         |    1 +
 .../media/platform/sunxi/sun50i-di/Kconfig    |   15 +
 .../media/platform/sunxi/sun50i-di/Makefile   |    2 +
 .../platform/sunxi/sun50i-di/sun50i-di.c      | 1149 +++++++++++++++++
 .../platform/sunxi/sun50i-di/sun50i-di.h      |  175 +++
 9 files changed, 1432 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-deinterlace.yaml
 create mode 100644 drivers/media/platform/sunxi/sun50i-di/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun50i-di/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun50i-di/sun50i-di.c
 create mode 100644 drivers/media/platform/sunxi/sun50i-di/sun50i-di.h

--
2.38.1

