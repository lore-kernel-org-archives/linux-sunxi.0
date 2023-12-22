Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBDA101E6
	for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlF114f1"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e62c1245eso1563527e87.1
        for <linux-sunxi@lists.linux.dev>; Fri, 22 Dec 2023 03:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703243676; x=1703848476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ywwb2c8K+kZPbyhXDFCz7U5YWzVC2teLlAt2hSiJc0A=;
        b=TlF114f1z+5X2QDGgF4JWaBmZLYId5iZrFCSVlxAnbv5pKj4WLjwLtYpzN2YeZCGjy
         ppJ6N2ujjBN3D6XH2V+x7rkXd968FAbf5XevuPYaPbTbpseAbk2Z8qTvRo+G/m+95hsU
         RawYjbkWcwK70mP7QVUwEaA49b1dZ9V1duhNzaDI7NFflkgdBbDCmCDyEj2OgWjU07+x
         JMA/aduxn8Qn08AEIyrCO/0fi53eXmualbgjsv/ayNtoPIOgJMoVtmqK/7LRFYGAtrFe
         V9ve/JPkkLeDftOMXKQnpvdIZ3tjEcnpy7bmOeGAi5XEdKjqlPd7Iha/gqZg0GwkKa5/
         b+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703243676; x=1703848476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ywwb2c8K+kZPbyhXDFCz7U5YWzVC2teLlAt2hSiJc0A=;
        b=XeEjbbWOwjB2vdo9t0HxbCRF33qKpsvSfK+HaLUdcOKW0xHcrL7+/DA1fXaWEa3wAU
         wir6QgSbYkiLeJgkOAw374XmsCn05SFmRtuMV+4OIZsLqotWA2u6dEafTqBCEkuksiRy
         P7OJgvUp+O4O0jV1YUpOSlsfD9NnvKI5u/v+fegfDh0p8zp2Lidu0CRxIV1KT1Dm3ugn
         clCJgUlFOq9NHwZ0p5TT2a9Qdc6dFrH7dtxtZlu0RERzSP3GLiujxvFarTYzNYTMleEE
         amywnAwo8aybhtrWGYV85fDWXW/9n005FCAjOb2Bb33SPuHHX3Thx44I3lhVOJFaI20x
         n8bQ==
X-Gm-Message-State: AOJu0YxFBkxjI7qxLNDxklqOP2WnpPsU0Q/xuWOlsTEIv8BlLs0J3my+
	44dCowcXQIkUV1UedLbaisU=
X-Google-Smtp-Source: AGHT+IEHhoBZ6sLrw8lKHDckHa1uRnHimx5cP137ZR9Lgo9yiD12gvt8LEkOv80eCcFyVhpbiFrZ1g==
X-Received: by 2002:ac2:5dd5:0:b0:50b:ebd1:6e8a with SMTP id x21-20020ac25dd5000000b0050bebd16e8amr572807lfq.133.1703243675755;
        Fri, 22 Dec 2023 03:14:35 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.91])
        by smtp.gmail.com with ESMTPSA id es15-20020a056402380f00b0055267663784sm2420469edb.11.2023.12.22.03.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:14:35 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
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
Subject: [RFC PATCH v3 0/3] Add support for reading D1 efuse speed bin
Date: Fri, 22 Dec 2023 12:14:04 +0100
Message-Id: <20231222111407.104270-1-fusibrandon13@gmail.com>
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

Changes in v3:
- Drop 'len' parameter and pointer in sunxi_cpufreq_data::efuse_xlate()
  prototype

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
 2 files changed, 87 insertions(+), 21 deletions(-)

-- 
2.30.2

