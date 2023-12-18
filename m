Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B7A1B28E
	for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMnDupw0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-553338313a0so1174315a12.2
        for <linux-sunxi@lists.linux.dev>; Mon, 18 Dec 2023 03:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702897563; x=1703502363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kU1LiiNj9KIu6+7tYv+GKaquR+hqOzQ4EnqPiWM+jqI=;
        b=YMnDupw0/A5UYS9ZVeiW8wmw9eYOcFaqLzZhf1pzkzx0IGR7Mj2+BsMCE+0YltrIDO
         vaA11GDmX5qsjWn4STDO8kET0wBU/vV25aERVkkGbXrMWfpruFtiQOriRYqrkJIMm+PD
         5ABlrv5atWYnftewSf5Diw6Tp+WFF4RKDsT2w/6jNK/VyNOHP9uC4DvIRnfRwtefg5zI
         Z4tjCU9KAqpLOAoIgyQnSCWJ8pN/YHEfAJ/Glh92ex1fMbvdOaUC2ZuPcCg3AbLHY4vz
         PElxrdTmNoOgU8TaqyrnrcmiBgJF2GdUuIZ4Jfg+ilgiHdXLmMADZ1ruvOPWX4u9cxjQ
         kOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702897563; x=1703502363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU1LiiNj9KIu6+7tYv+GKaquR+hqOzQ4EnqPiWM+jqI=;
        b=OGeMX0nE9YqTpnxi+hzBpUTpnQAPdA20isKNCbLVhyjQ+G3V0Kt5Otcu0LicGKtS95
         0jdu7Oag/tjImSAQlWNPlDigPKM00DbsRTDlpCDEe9GJBoluu346xBQA5iqG7l1hdcze
         RQHJQ1VjidA0Zv2hRQ3oc8zv1MeMi4prfdPGYaptz+pRDNz/RdgJDBt/5T8fa1/84ygq
         Ry1fJDudZl0MFZrhSf4E6sQEtEup4oZLrtYhHMPj0P1+05uVa4+f7YR/8E3woDv+70lN
         1DPfgDl7m81BDg0ijQCjLADFtSQjc7GGFSFMq6/YHBSJ/JNctNGhFNZwl2X1xGJ0RTBM
         q0/w==
X-Gm-Message-State: AOJu0YxuTOeJvki7iPvngpIKiG50jQcjwkO48vwkhD3ZwTMBFPNqU8jt
	69SUYtUZ3yEQEZr1gn1NAsQ8xTyO86aSqQ==
X-Google-Smtp-Source: AGHT+IEu4B8/4kbVzadsts53Sxa4qj2ceKCfsDvnjL+HyYXZThTQF8KnpEH1qhhPjPoeNforQTv/XA==
X-Received: by 2002:a17:906:74cd:b0:a23:1000:56a2 with SMTP id z13-20020a17090674cd00b00a23100056a2mr3086326ejl.12.1702897563254;
        Mon, 18 Dec 2023 03:06:03 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.164])
        by smtp.gmail.com with ESMTPSA id pj4-20020a170906d78400b00a2353af1f7bsm1406769ejb.92.2023.12.18.03.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 03:06:02 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [PATCH v2 0/5] cpufreq support for the D1
Date: Mon, 18 Dec 2023 12:05:38 +0100
Message-Id: <20231218110543.64044-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for cpufreq on the D1 SoC, and has been
tested on a Lichee RV module.

Changes in v2:
- Revert opp-microvolt-speed0 property to <target min max>
- Add dt-bindings for "allwinner,sun50i-h6-operating-points"
- Enable sun50i h6 cpufreq multiarch support by moving Kconfig option
  to drivers/cpufreq/Kconfig instead of creating
  drivers/cpufreq/Kconfig.riscv

Brandon Cheo Fusi (5):
  riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
  dt-bindings: opp: sun50i: Add binding for D1 CPUs
  cpufreq: sun50i: Add D1 support
  cpufreq: dt-platdev: Blocklist allwinner,sun20i-d1 SoC
  cpufreq: Make sun50i h6 cpufreq Kconfig option arch generic

 .../allwinner,sun50i-h6-operating-points.yaml  |  4 +++-
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi  | 18 +++++++++++++++---
 drivers/cpufreq/Kconfig                        | 12 ++++++++++++
 drivers/cpufreq/Kconfig.arm                    | 12 ------------
 drivers/cpufreq/Makefile                       |  2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c           |  1 +
 drivers/cpufreq/sun50i-cpufreq-nvmem.c         |  1 +
 7 files changed, 33 insertions(+), 17 deletions(-)

-- 
2.30.2

