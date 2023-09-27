Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F93F1D69B
	for <linux-sunxi@lists.linux.dev>; Wed, 27 Sep 2023 09:42:59 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c1854bebf5so9845031fa.1
        for <linux-sunxi@lists.linux.dev>; Wed, 27 Sep 2023 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695807777; x=1696412577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRpBAVPx7Mp9giQ9yk+YOFRSp8j4plIwxLPeBKKHrT0=;
        b=XdSEbk/EiOxqY/eS7wgl2aLOy/XGM3mceSJ3akD3YiF/BpuF/sh1eGnT1IWKXWlLYT
         g9ibYrLRGt5XNzEoQHME2tcQ2CNsPjvtyM93ZkduGr6HmrmNeLzS4jbVd1GnHdTHZRbG
         BuzU2iaNgOUwI1tWNuU79ca96Lzoq9nPnb36mdwA+Oyht0s07+adMxPxn3wQCi2a75zz
         mPIgcNpCIlqYPVnDhpHtdbA9Y//+DW3hLy/lQw7hlg8YAihmKDqBiDoEDeopa/EduHvl
         JQpxFzZdj/h5sUNQQ+dGObDnNWse3n1rrDSd21eAEpgpt2dy3LYU5DYrYp39wFNFoZ8s
         MB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695807777; x=1696412577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRpBAVPx7Mp9giQ9yk+YOFRSp8j4plIwxLPeBKKHrT0=;
        b=MwG8s0KCv+BZ9hZOrzR9dnF+RMwQq5OFtRADbISNKXavSMKCtmVI2J85kn+5NP59jX
         NQ5fuFq9lhKNeaWko1gtEVGIJR/3iUsORnXddozxtLeBtrZUm7HHC/v7SRVKAhmT7JR8
         SDN12IWf9uhW0R4kWq9AhOgtrEiSmA8+jHOoUSX4LB2Bf8w3Epyw7TYKyJrIsEkSykiv
         r5NUJxxwMC1CJDc9O3LGTLiILq5hC8Wznw1ai3tvSMNr80dsrb/fyCqvv5q+sQ4VkDva
         ZQ6wCh40G6gQh8w9CLcVyoLnQb+kOzidy9Q97wSvf5T8m8rrYNcnek22ZwtzUS1hd6Ai
         qccQ==
X-Gm-Message-State: AOJu0YxF6pdiXASbOX4ela4hg5dxv/DC0e1syI1r8UqtQakU6lDrq7Cl
	Tpllixk+DypeoNYORXwpbVM=
X-Google-Smtp-Source: AGHT+IEgr9ZrYR/8ZTlJcBC7u1IjWbhaIrfLEcObqVd1wG4lgdemJ1NL0FSL1kmEaSGPygpgmAk73w==
X-Received: by 2002:a19:4319:0:b0:502:fdca:2eab with SMTP id q25-20020a194319000000b00502fdca2eabmr1064851lfa.37.1695807777209;
        Wed, 27 Sep 2023 02:42:57 -0700 (PDT)
Received: from okhunjon.localdomain ([94.158.55.47])
        by smtp.gmail.com with ESMTPSA id i37-20020a0565123e2500b005044391b610sm1853823lfv.289.2023.09.27.02.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 02:42:56 -0700 (PDT)
From: Okhunjon Sobirjonov <okhunjon72@gmail.com>
To: andre.przywara@arm.com
Cc: bigunclemax@gmail.com,
	cfsworks@gmail.com,
	jagan@amarulasolutions.com,
	jernej.skrabec@gmail.com,
	linux-sunxi@lists.linux.dev,
	samuel@sholland.org,
	u-boot@lists.denx.de,
	uwu@icenowy.me,
	Okhunjon Sobirjonov <Okhunjon.Sobirjonov@Mec-electronics.com>
Subject: sunxi: introduce NCAT2 generation model
Date: Wed, 27 Sep 2023 12:42:52 +0300
Message-Id: <20230927094252.61765-1-okhunjon72@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721134606.4505-9-andre.przywara@arm.com>
References: <20230721134606.4505-9-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When NCAT2 generation model's introduced for t113,
the modification in drivers/mmc/sunxi_mmc.c
> + IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)) && (sdc_no == 2))
in struct mmc *sunxi_mmc_init(int sdc_no) seems to have
some negative side effects, meaning enabling 8-bit mode for MMC2.
Paticularly,  IS_ENABLED(CONFIG_SUNXI_GEN_NCAT2)
should not be used for D1/T113 
since there is not support for 8-bit mode for MMC2 yet.
Therefore, the solution would be to drop this particular
change entirely.

Signed-off-by: Okhunjon Sobirjonov <Okhunjon.Sobirjonov@Mec-electronics.com> 
