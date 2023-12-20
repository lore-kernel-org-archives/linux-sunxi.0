Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F549208A5
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 09:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjO92L3T"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a236d77dceeso306976266b.2
        for <linux-sunxi@lists.linux.dev>; Wed, 20 Dec 2023 01:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703065921; x=1703670721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9qpB4qf3ZId6lZMFowk0z0oliDO3YWtk6BSWDnuZ0o=;
        b=YjO92L3T3uz6AGRjELipU9ipVIDFHX0IoAtVE/igrHtmv44iUG6zVT7EbMdNJIFeJ3
         V+1SHlHow9SnXGi+yBUySW5Apk4a6Vswk7xJPsjzRhBEsxvZhKKZXgNaz3lXtWBoTxGQ
         PcZvO6SI0ZFMr0oUTfIw64AH37EPeFa5fgQIMZprb7cTYvqKvPt7Q/Grs6E5NkFvYqbz
         IGMtIWS8OcoE/PqoRT7bHyNuOdVqK9pSxzWcWB8nexvZD7Yopb9puAVgrVq0VhqDMeji
         qJkfO1ftse/JFosHDBQJWbhm9PMVSrEg7eGqIPWe5XOOQka3uzHgbf2OBCEaO058jlUV
         jmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703065921; x=1703670721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9qpB4qf3ZId6lZMFowk0z0oliDO3YWtk6BSWDnuZ0o=;
        b=Iqvc7b08FzrFBG+BGtMAgdfBdms/I6TBGaHFY+Jn+IlpyXV9//I/DMGGO5YcLpY1xB
         qn4NsP5sWAuQs697vCrhLQeiN3WOvZpz5T+ys5/RGqglr28iiRWeSrCnGnxc6Wynqzm7
         1ADrXbt27QVEkv+FGuIvi3HvIUx1iMLciBH5iwzEFrHFQ3NrT0ZabDJsLgNehItTL1kX
         jGUkDSE/sO6olP4iDKRxZJzyxptvvt9K+O53t5L0V6cTcdSOBQbi7PMV/vkOk1FFBSae
         4hoHsqg4u8UyORlp8S/TGAaO+e3lxQDMFHXuTArtI7HP5ndUxz2+n1ZuoVy+xHrm1r2I
         hIHw==
X-Gm-Message-State: AOJu0Yz/6c1lYAGzlBYmjZ9sQcyMpSrY3cRuBNN0Db8z5pi1MfJMfg3N
	SJjHBAz1sWQSQsRQIWcjTg4=
X-Google-Smtp-Source: AGHT+IE28g41l7HoQZQIn3TqFjt4hhf/zSXdXrozlWV0k0jrhm2KNFm8zxiuiquLZS9DJmjzTRsGSQ==
X-Received: by 2002:a17:906:10da:b0:a23:617d:1917 with SMTP id v26-20020a17090610da00b00a23617d1917mr1485420ejv.116.1703065920680;
        Wed, 20 Dec 2023 01:52:00 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.158])
        by smtp.gmail.com with ESMTPSA id st3-20020a170907c08300b00a1c4fde4e88sm16596791ejc.18.2023.12.20.01.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 01:52:00 -0800 (PST)
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
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: [RFC PATCH 0/2] Add support for reading D1 efuse speed bin
Date: Wed, 20 Dec 2023 10:51:39 +0100
Message-Id: <20231220095141.27883-1-fusibrandon13@gmail.com>
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
cpufreq support series at

https://lore.kernel.org/linux-sunxi/20231218110543.64044-1-fusibrandon13@gmail.com/T/#t

which is currently stuck at

https://lore.kernel.org/linux-sunxi/aad8302d-a015-44ee-ad11-1a4c6e00074c@sholland.org/

Brandon Cheo Fusi (2):
  cpufreq: sun50i: Add support for D1's speed bin decoding
  riscv: dts: allwinner: Fill in OPPs

 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  8 +-
 drivers/cpufreq/sun50i-cpufreq-nvmem.c        | 85 +++++++++++++++----
 2 files changed, 76 insertions(+), 17 deletions(-)

-- 
2.30.2

