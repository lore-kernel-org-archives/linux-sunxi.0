Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2558101CF
	for <linux-sunxi@lists.linux.dev>; Thu, 13 Jul 2023 10:05:47 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-98de21518fbso83394866b.0
        for <linux-sunxi@lists.linux.dev>; Thu, 13 Jul 2023 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689242746; x=1691834746;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o51EUVcuodqc0XkTYcL4bWCMRmfM3v1NqqP+NGxBbY=;
        b=saErMT1eYfuFzYCkg/HCcOysEREdt8zBN/bD8sxNULjrgFtU8eaB77NW2JLv1SfCUB
         U37hOTZQNnqze1nRbqPt+MyCGjk9Y1Yq9ZND9kSVpGynMhFoJcq8SiF+CFNC4dnI5y06
         NeX7x88IR5peJoZLrgJaKA9+S7HjrOS0vxWDB5La0XS7wBCq25P7BO1r0QewgNDIlSEe
         VH2q5IotsM4YR9qsp8lzg9l/YXr2fWfKRR+EtD+X/YdplhioA51oWWCv+PBe/Njb1Kfs
         fupOShSexfcMbdaIjndMnzTYWcsPjE9+Pq8E6/yeILPC1jcsDlGRD/XHeDTZQZ2wwMd9
         +lqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689242746; x=1691834746;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o51EUVcuodqc0XkTYcL4bWCMRmfM3v1NqqP+NGxBbY=;
        b=D1/FI18twWVV0IsqklhsAa4ntGuPBAZso3erhzKOjG+QJEaAAYhVpvMQ72FB2PRNzM
         PB+oQoksMuc5Zf/d79BOmVZ7e59MpNkcqXjhYMuDm9bASUQnyUutRM2m+DKb2+1f0v11
         BZ3GyFwi46M+RBzhg5yf1zZWF9sHoAGGZ+SSwvDrHLTDsGvgaxmYpqJgNRAoTOCwq/g9
         dUEBVbjfmDO4ZgKTy9Os0j1FiQQlS4PUuaVOY2slpPbmVMg8zCY5cUAcYk6nB/9Pmqyw
         Ud3xJ9nXDFdVQ0ky3jTGZtm6ZwB9oMmddu+o2YZ4F+wBgShnAXxT9qBgfEm/bXLO3Nb7
         5zIw==
X-Gm-Message-State: ABy/qLbBTVfI/1MopT5I0x9inUvLEFNDSXNcoejfBLShedIpeM9qYbh/
	WsLfht+ak+LKdltFZgztROyacQ==
X-Google-Smtp-Source: APBJJlG8tz5eUlBbh0OW8ZQUxodptZIofJVNSgnH2r+KnFLsU0smyZr36vQMsYTW8oqlhJt4GtiZGg==
X-Received: by 2002:a17:906:739b:b0:993:d5bd:a75e with SMTP id f27-20020a170906739b00b00993d5bda75emr1008632ejl.6.1689242745788;
        Thu, 13 Jul 2023 03:05:45 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id qt25-20020a170906ecf900b00992ab0262c9sm3780517ejb.147.2023.07.13.03.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 03:05:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Yangtao Li <frank.li@vivo.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230706040504.34057-1-frank.li@vivo.com>
References: <20230706040504.34057-1-frank.li@vivo.com>
Subject: Re: [PATCH 1/8] nvmem: sunxi_sid: Convert to
 devm_platform_ioremap_resource()
Message-Id: <168924274486.15577.2601617976381408054.b4-ty@linaro.org>
Date: Thu, 13 Jul 2023 11:05:44 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Thu, 06 Jul 2023 12:04:57 +0800, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> 

Applied, thanks!

[1/8] nvmem: sunxi_sid: Convert to devm_platform_ioremap_resource()
      commit: e4ccbdc5f82463e014b6b9072f206f80326e61e9
[2/8] nvmem: brcm_nvram: Use devm_platform_get_and_ioremap_resource()
      commit: 37bda099309f2c7c5a75113f43baf1ec3feeee14
[3/8] nvmem: lpc18xx_otp: Convert to devm_platform_ioremap_resource()
      commit: 8584695d9ad95246e79d3470f97f16578eb3c2f0
[4/8] nvmem: meson-mx-efuse: Convert to devm_platform_ioremap_resource()
      commit: b12a4928e60f0e683b1a8ccd317031de23a1679f
[5/8] nvmem: rockchip-efuse: Use devm_platform_get_and_ioremap_resource()
      commit: c169b0d3f79a2c26cbb1233948ea374b7b7c8ec6
[6/8] nvmem: stm32-romem: Use devm_platform_get_and_ioremap_resource()
      commit: 0d7713aa08dbd96d37f1fc33610b2cfcff87fed2
[7/8] nvmem: qfprom: do some cleanup
      commit: 4156cae2936605e982ad671d1078d41edf79875b
[8/8] nvmem: uniphier: Use devm_platform_get_and_ioremap_resource()
      commit: 17340c6c425fd0c29c75ee682742258955515a33

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

