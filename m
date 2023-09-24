Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8F1DDD8
	for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 19:57:46 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so5884086a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 24 Sep 2023 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695585464; x=1696190264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owBEiPjo8kmSbGl4IiHWAo4a1hvNNIGG1E0LxgF/aws=;
        b=QYEPyA/77QCgAl4gq2rRxa0l2sP9ea64kylsp7/EeANcRPm3rprEK4u/TanYl3wZnC
         Ao58AtplVFiqKd33M5/ILmRnjjuQlVnF/NyTBaVmIw5sCtCpt6G4qTkfXe5Zxr+C6Ykq
         A+dhcmwitkSWgzyAIVO3VFZIw3IZFMrw4pzxLb21uDyiP/bMQi/cGMdA+4p4NNdgKGi4
         dnNTNx+AHI1MAC1lZhewiScsbZBYPeH5/TJLHs3TBGWBHib8zGWThEbkLG22dOQvXrZR
         4zOfsvLGvfMTt/sUNSove6+ftRcbrYXpL2aZCRE7ZkDrHy5A9dgDlZkhWRGF9i5/xAqM
         DIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695585464; x=1696190264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owBEiPjo8kmSbGl4IiHWAo4a1hvNNIGG1E0LxgF/aws=;
        b=IoTtWSreGZGOrHE80ZzpOWkXkiaMLgQbuP7RX9bzcM9oqOhTAzZG6gRKgVjNtq+uwq
         0qX35TZ6BLrdXkU/NxBJyWUSDCGJS1xSCg9DDa5nDUJ85eLiauZNF5RjuM2pjyZsqro9
         1At0PEi2jK6pmEXVyaQIoQOqXBlipIp8ePRY6mkIWGkAZWJiSMVAaC1gmx5IHJAo5xjO
         Alj+uIWkMdKCupca3JwaVmK/SR0wTOS2+WEaLJDrdGTUDUlSu6g4QEY4nmsbTWHdoZD+
         x4VXswG5JoDhXygsga3m6gokFvKDVpdrNiJFiZQATHUK0LaASdTR5lRsdwipAIU1CYNP
         49dA==
X-Gm-Message-State: AOJu0YxzoZtS/e0Tmr/qpe0RZuPsaMaT6xvK81BhlpmTeW3qGYeEE/Eo
	NKTd6xzSVqvXxjkhpVDlvjo=
X-Google-Smtp-Source: AGHT+IHgRbH+oZxXnW7DSFcjW0FdkC++jBJp1GLixNan10k/I9XRdW5IA9Qmek9gs6wKNMStmzBCgg==
X-Received: by 2002:a17:907:b1c:b0:9ad:be8a:a582 with SMTP id h28-20020a1709070b1c00b009adbe8aa582mr3926830ejl.21.1695585464270;
        Sun, 24 Sep 2023 12:57:44 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id t2-20020a17090616c200b0099d45ed589csm5284209ejd.125.2023.09.24.12.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 12:57:43 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Martin Botka <martin.botka@somainline.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, Alan Ma <tech@biqu3d.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v3 0/2] Enable Security ID for H616
Date: Sun, 24 Sep 2023 21:57:42 +0200
Message-ID: <1942306.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20230912-sid-h616-v3-0-ee18e1c5bbb5@somainline.org>
References: <20230912-sid-h616-v3-0-ee18e1c5bbb5@somainline.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 12. september 2023 ob 14:25:11 CEST je Martin Botka napisal(a):
> Hello,
> 
> This patch series enables Security ID (SID) support for AllWinner H616.
> 
> SID support is an requirement for few things:
>     - Thermal sensors
>     - CPU Binning ID (cpufreq will use this)
>     - EPhy
> 
> This patch series doesn't add support for the consumers.
> Those will come in the future via their own series.

Applied, thanks!

Best regards,
Jernej

> 
> Cheers,
> Martin
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in v3:
> - bindings: Make H616 compatible fallback for a64 using items and enum
> - Link to v2: https://lore.kernel.org/r/20230814-sid-h616-v2-0-0267749b4471@somainline.org
> 
> Changes in v2:
> - Drop driver changes
> - Use fallback compatible in DT
> - Link to v1: https://lore.kernel.org/r/20230811-sid-h616-v1-0-d1dfc9f47b19@somainline.org
> 
> ---
> Martin Botka (2):
>       dt-bindings: nvmem: SID: Add binding for H616 SID controller
>       arm64: dts: allwinner: h616: Add SID controller node
> 
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml         | 4 +++-
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi                     | 7 +++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20230811-sid-h616-37b773e59571
> 
> Best regards,
> 




