Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F028600D
	for <linux-sunxi@lists.linux.dev>; Tue,  5 Jul 2022 19:41:48 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id sb34so23352328ejc.11
        for <linux-sunxi@lists.linux.dev>; Tue, 05 Jul 2022 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uaCa1pHvEpowovin1FoM/a/4D+WGXtSWycYEfFOoJn8=;
        b=E48zrzVo+gN6mpL47FsShaJe4OOP8N0urz7fU3N5XDnh1/1eee50P/6qK0R9qBZpOm
         TDgf4z9e4retyFZOOfUabP3h+tziDdJWJ2A83eb0X/D29VNDiY8tbPRjZCbeOMhhUltf
         IG7ABvHDdejjOKocoDXZ6uiHzC+P0XEFZAkmxzRg/OnnVFG6p4O3Q/xqCMCe841McsTX
         WtiBUpctbW36a8rAWqM+VKnnBwfv+ZA7AInVrLOnsamFe97I1TI2vTJa38O2CE2S9a+D
         wOvI36b/OhvHguk+Ku925sOESa78BJxccZw8D6M7NX8goy6W8Y7TFcvJ1iD+2THk3xIw
         EfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uaCa1pHvEpowovin1FoM/a/4D+WGXtSWycYEfFOoJn8=;
        b=VfQUvy4/SfYqwWDLNh01XJTp1tw/rs+yN/uk9UnPwZqpw5FQXITrfmwQhrfovOIkav
         XRMTVT5veSwig61bv6O8ZVR3hBF0DnwaJoNXxyaLm2qj9bp+sgRRe+/uz9LKQVQweMkc
         MZwQi9lYWGj98m60pbiLnLOqPikg96D1gCa+ZUqvaZy7L/mohAXMmxBteQ2gn8FABQOE
         nwRTp2pQBTanA2rUdnalQcoHyJl2D26WNqevcCtIeZDRKzN0KWzWVL2ZSZRoQtqRKHPb
         x65i9zlG8/fdWB42NMH8w7gfXBr+1uJMcya8Z9tDi95IdVULD/mt/pS9vXHZHUQ7oXS9
         56Kg==
X-Gm-Message-State: AJIora/SntVN9Bxp78SIwNHPEQkwEcfw/00kRqOMMukaWeocn/0Cku66
	zM0lzKvvCBzHCyfC569Sm/tRcNEqYWDe0w==
X-Google-Smtp-Source: AGRyM1tP31/iJRcdSA/OIBkPjZrBAQZpMldBKfJr0e8X3l3cfnm6ZyKMwkJzx3sb7RMZzdMNmluOPA==
X-Received: by 2002:a17:906:6a14:b0:72a:b32c:e839 with SMTP id qw20-20020a1709066a1400b0072ab32ce839mr16896534ejc.468.1657050106412;
        Tue, 05 Jul 2022 12:41:46 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090638c100b007219c20dcd8sm16204874ejd.196.2022.07.05.12.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:41:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, qianfanguijin@163.com
Cc: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, qianfan Zhao <qianfanguijin@163.com>
Subject: Re: [PATCH v5 0/3] ARM: sun8i-r40: CPU improve
Date: Tue, 05 Jul 2022 21:41:44 +0200
Message-ID: <1753004.3VsfAaAtOV@kista>
In-Reply-To: <20220517013607.2252-1-qianfanguijin@163.com>
References: <20220517013607.2252-1-qianfanguijin@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 17. maj 2022 ob 03:36:04 CEST je qianfanguijin@163.com napisal(a):
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> Change history:
> ===============
> v5(2022-05-17):
> - Move opp tables to sun8i-r40-cpu-opp.dtsi
> - cpufreq supports 720M, 912M, 1G, 1.1G, 1.2G
> - Add cooling supports
> 
> v4(2022-05-16):
> - Invert two patches.
> - Drop the cpufreqs that exceeds 1G in opp tables.
> 
> v3:
> - remove "allwinner-r40" compatible from allowlist.
> - split dts in two part.
> 
> Test:
> =====
> 
> cpufreq was tested by tools: https://github.com/ssvb/cpuburn-arm
> 
> 1. cpufreq-ljt-stress-test
> 
> - root@ubuntu:~/cpuburn-arm-master# ./cpufreq-ljt-stress-test
> - CPU stress test, which is doing JPEG decoding by libjpeg-turbo
> - at different cpufreq operating points.
> -
> - Testing CPU 0
> -  1200 MHz ............................................................ OK
> -  1104 MHz ............................................................ OK
> -  1008 MHz ............................................................ OK
> -   912 MHz ............................................................ OK
> -   720 MHz ............................................................ OK
> -
> - Testing CPU 1
> -  1200 MHz ............................................................ OK
> -  1104 MHz ............................................................ OK
> -  1008 MHz ............................................................ OK
> -   912 MHz ............................................................ OK
> -   720 MHz ............................................................ OK
> -
> - Testing CPU 2
> -  1200 MHz ............................................................ OK
> -  1104 MHz ............................................................ OK
> -  1008 MHz ............................................................ OK
> -   912 MHz ............................................................ OK
> -   720 MHz ............................................................ OK
> -
> - Testing CPU 3
> -  1200 MHz ............................................................ OK
> -  1104 MHz ............................................................ OK
> -  1008 MHz ............................................................ OK
> -   912 MHz ............................................................ OK
> -   720 MHz ............................................................ OK
> 
> Overall result : PASSED
> 
> 2. cpu freq slow down when cpuburn-a7.out running
> 
> - temperature: 79213, online: 0-3, freq: 1200000
> - temperature: 79213, online: 0-3, freq: 1200000
> - temperature: 80230, online: 0-3, freq: 1104000
> - temperature: 78874, online: 0-3, freq: 1200000
> - temperature: 80004, online: 0-3, freq: 1104000
> - temperature: 79213, online: 0-3, freq: 1200000
> - temperature: 78196, online: 0-3, freq: 1200000
> - temperature: 79891, online: 0-3, freq: 1200000
> - temperature: 78422, online: 0-3, freq: 1200000
> - temperature: 80343, online: 0-3, freq: 1104000
> - temperature: 80343, online: 0-3, freq: 1104000
> 
> 
> qianfan Zhao (3):
>   ARM: dts: sun8i-r40: Add "cpu-supply" node for sun8i-r40 based board
>   ARM: dts: sun8i-r40: add opp table for cpu
>   ARM: dts: sun8i-r40: Add thermal trip points/cooling maps

Fixed opp table name and applied. Thanks!

Best regards,
Jernej

> 
>  .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  |  5 ++
>  arch/arm/boot/dts/sun8i-r40-cpu-opp.dtsi      | 52 +++++++++++++++++++
>  arch/arm/boot/dts/sun8i-r40-feta40i.dtsi      |  5 ++
>  arch/arm/boot/dts/sun8i-r40.dtsi              | 36 +++++++++++++
>  arch/arm/boot/dts/sun8i-t3-cqa3t-bv3.dts      |  5 ++
>  .../boot/dts/sun8i-v40-bananapi-m2-berry.dts  |  5 ++
>  6 files changed, 108 insertions(+)
>  create mode 100644 arch/arm/boot/dts/sun8i-r40-cpu-opp.dtsi
> 
> --
> 2.25.1


