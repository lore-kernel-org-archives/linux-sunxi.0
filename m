Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D32F46
	for <linux-sunxi@lists.linux.dev>; Tue, 16 May 2023 16:39:31 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-510b56724caso1492683a12.1
        for <linux-sunxi@lists.linux.dev>; Tue, 16 May 2023 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684255169; x=1686847169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdE6rQVwO6h2KNb8VdfjQ0+WIgss0cnwggom+xyvQHQ=;
        b=dlRjaEnRnTVyeKmp0c/GNeCa4MdfzFN1mjULVO616k/lvjA31glSVPawlSLTUWOczA
         JSMRrNXroYDKKV4YL3h3Feg6nuWiPFdsmEuD+LQ/YkVva0+8mYQO/ci6tbZpJwmSMUbH
         Cbe8REmBTiNOkw+v0ybQFUiUSIoFLorx0hKj/mk8XN9LWdMHFWxYW+OlQdPpWC8a47jA
         QZBSaqSdSpPyalDbzc5gEvPgo0C1Rc7tOWnbysc9Kh9kXF0KH9VgPZbHsGHD9bcJ4Afv
         s1E0eosdT0jL7IYChzCfnC5tM2b/rpR3NAfPzm5+obaLTowN5jomdRc2OpaCBBJ4YN2K
         E45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684255169; x=1686847169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdE6rQVwO6h2KNb8VdfjQ0+WIgss0cnwggom+xyvQHQ=;
        b=Hk0hBc9kOi+I5oQY8TRa8Or+ZXzp2+XhGSA8MArxuvfiRUtesjGrzPEaeE2xI3CLn6
         4BHR3RTSu/JGOznxkYpb05cxG3icTYKlJGpkhJgVjEBQLqjvJJKrvFPXou1eG+KU1Fjn
         /jlcCcHEqjLvM8zT82CBdbfhKU4XAlt9RZORv2swgSmeuezYvNTFLzKGIEb8723SXX8J
         OMAQn6ILU3NbJGb2hP61ZyTXOpmdGp21GdGmxh8ukQtBw6/2YNO61RJ80U2vjITKAVxb
         YKafhxLoNRr6cLUKL8hR5M7ctbs5gSo4ZPIpxt81lYPVwFYwIyLm16hnF/mSZZ/xSQji
         k79w==
X-Gm-Message-State: AC+VfDyrQAmElWfsCPWg2VMeqOvqcZ7UNb9+iNiTMREyFrtVlnyk+VXC
	SS5sm2Vs6P58k1X626BQys+zQg==
X-Google-Smtp-Source: ACHHUZ5D/x8CQ1hyl5DzYWBTCdtlxBikcktVZkXe1wItsnn1SfqN/mK77HbHn+5BOxNE+lrYHRMmrA==
X-Received: by 2002:a05:6402:2036:b0:50b:ca1b:addc with SMTP id ay22-20020a056402203600b0050bca1baddcmr38244775edb.13.1684255169639;
        Tue, 16 May 2023 09:39:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id d4-20020aa7c1c4000000b00504a356b149sm8278191edp.25.2023.05.16.09.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 09:39:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: add missing cache properties
Date: Tue, 16 May 2023 18:39:20 +0200
Message-Id: <168425511043.243008.7280065132171806679.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421223137.115015-1-krzysztof.kozlowski@linaro.org>
References: <20230421223137.115015-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 22 Apr 2023 00:31:37 +0200, Krzysztof Kozlowski wrote:
> As all level 2 and level 3 caches are unified, add required
> cache-unified property to fix warnings like:
> 
>   sun50i-a64-pine64-lts.dtb: l2-cache: 'cache-unified' is a required property
> 
> 

Applied, thanks!

Please let me know if this should go through any other tree.

[1/1] arm64: dts: allwinner: a64: add missing cache properties
      https://git.kernel.org/krzk/linux-dt/c/4c84cced9304303ed1c73e35277891249e3cc2cd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
