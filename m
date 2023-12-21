Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C184D51C25
	for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx/69MMZ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e39ac39bcso819291e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 21 Dec 2023 02:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703153433; x=1703758233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fIP+gY5tjmlfd94qvCRw5zI94zpMLdzYlGd9t55ptY=;
        b=Fx/69MMZIoPC1cBBFAMvH8FqhxZMo8/ChIh2B4fIxhH2EUvud7Fo179s68fVf8NNhQ
         u7x9dbs2m1ddpG+ghuqxR96vzKUEJtoXs49K7ffwPvsXvYKXAQsgqyqBggcvFvwh8Ght
         clQq2tO3i2ueBJoJCTyZFJGLHsrToR3H0wrwqKH+kuWZGWEN0UEDShQ3zmgw+308GeYY
         6QkH88a5kdhYoa4ARdLQ7MCN2/L6rqDyQV7aT8jJgWltg3YJGxTGiENeUcZgQnQxqZ4u
         WPRLox165UpxO4QTkKYfr72fdlQpBIGosYBXtq8Iw7vnWdxIbuvoWnowKFzrTCnr2ugc
         OMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153433; x=1703758233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fIP+gY5tjmlfd94qvCRw5zI94zpMLdzYlGd9t55ptY=;
        b=PhTd+m1Sj4qUDR8Cf8JK/GcpTfY4EJoe+smzENNP7NB+XxTyMs3WxRFmo0ejQ2/p9s
         eFG4pzVu+bDkec5h2pLyD4m2IozQp03ZMxazHv3Unwm74unUKIlXv7ltdqlI9iTW1boY
         B031jTWkQeMg6sL2Ez7Je5YizWX0p3KnhGQMzu4aIh4iv+oV/TtwrgSBIP+0KiYTTGvZ
         5ed/fdxxBSMflhakDTcBNZTOBTKyfKrxD/7Usu3ucdflOlhTjq0F1hCJLvSTyStoKxwZ
         dTBdvPIdm/Hd2m3PWA3DhZK+jVXxmJJbcoV4azj74nDdCoVVWPscDyUZtwpmIXJe8wtT
         d72w==
X-Gm-Message-State: AOJu0YxvT1DEZWG6z0r7i6N6yfZhICr78FqoX6+oELFsDemomYHulvqc
	fJQ4U7ApCRHpUn6A6ujqJzM=
X-Google-Smtp-Source: AGHT+IFtYAcqviJSNW2hlf7hb2pY1nEpa7NDu2xXdMOCQkRzDnF1hONtWet1/ZO/uZRytB3dHQ2T/w==
X-Received: by 2002:a05:6512:402:b0:50e:51e0:732 with SMTP id u2-20020a056512040200b0050e51e00732mr622482lfk.277.1703153432484;
        Thu, 21 Dec 2023 02:10:32 -0800 (PST)
Received: from localhost.localdomain ([154.72.163.204])
        by smtp.gmail.com with ESMTPSA id x7-20020a170906b08700b00a25f5dba09dsm784928ejy.145.2023.12.21.02.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 02:10:31 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH v2 0/3] Add support for reading D1 efuse speed bin
Date: Thu, 21 Dec 2023 11:10:10 +0100
Message-Id: <20231221101013.67204-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This series is an attempt to get feedback on decoding D1 efuse speed bins
in the Sun50i H6 cpufreq driver, and turning the result into a meaningful
value that selects voltage ranges in an OPP table.

I want to make sure I get this right before sending in a v3 of the D1
cpufreq support series here

https://lore.kernel.org/linux-sunxi/20231218110543.64044-1-fusibrandon13@gmail.com/T/#t

which is currently stuck at

https://lore.kernel.org/linux-sunxi/aad8302d-a015-44ee-ad11-1a4c6e00074c@sholland.org/

Changes in v2:
- Make speed bin decoding generic in one patch and add D1 support in a
  separate patch
- Fix OPP voltage ranges to avoid stability issues

Brandon Cheo Fusi (3):
  cpufreq: sun50i: Refactor speed bin decoding
  cpufreq: sun50i: Add support for D1's speed bin decoding
  riscv: dts: allwinner: Fill in OPPs

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 19 +++-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        | 89 +++++++++++++++----
 2 files changed, 89 insertions(+), 19 deletions(-)

-- 
2.30.2

