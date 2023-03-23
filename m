Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFBDD2E2
	for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 21:21:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id p34so31244wms.3
        for <linux-sunxi@lists.linux.dev>; Thu, 23 Mar 2023 14:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679606470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVc7Of+Ix0ryK/+RAH7Z4FzYtXWWON2rs5eqRA4tiWA=;
        b=XEapRCAfRjQ3Vvhm/kfmQ20knSNfS4nyJ/DeNjhfKvWH2mP0mTbIUKHMGqzD4Cny7L
         pnHGYrLZhiQ3qpg0UnAKWYhtQZymabZ89gHgA1UyPiUr4X7/ZucB76UM7P0gfnMvc6+w
         N5ju5ShkPJ2UoqBR347f7Sp37dTkbdMKiUc9AA7vOWH0vKbb1W/v4qj5vn/YMqyPRi1U
         lXEjFYiMa/v/g6AvU66r1/KY0L+P0QKdJTvenLQcUmsEoGVjxZlcqUlAN8BPK9i3oDcF
         Xpqr43xWIu9Ae7F5+NEs5ALgrRlDuC7Rws/EFSWvlJeAFI8XZV9HC8BQB7pdZxSqO4ew
         JX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679606470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVc7Of+Ix0ryK/+RAH7Z4FzYtXWWON2rs5eqRA4tiWA=;
        b=PXgNQZfnrcvyZGAqxMlEJHzTTYr2rJvUNXzYoBy8wpjfExEA9xT+wahH88+3brZF6h
         Us4/UvOlcwjpRNmfH/GynskfqRAUQHcS/zIvWEqDDQeMT4EnjIU5GlDXNjT77svLRf8f
         /sVHm0D5lNzUOC5da3CbECRcUkrN57+Q6boyDyQ0TK8+o7l1Qv7FNIjHDvIEW4+mW2CT
         jxQ5ATH324sHLkcCL6Suzf8Xdk7280oyxMfZCNws63MLtQ2IUl0aaQbqCj8upmpqANvb
         O6SSsF8EqNdA/YiC7TUSloXc27AHyXHk3bczQimgc0pDHsyjLb8/KfmEscOy3QVNZWkD
         lR/A==
X-Gm-Message-State: AO0yUKW9yQ9ue71ftPms88nQg6Xq6CIFTUq/QFyWwrRAx4QMSaIdkznj
	WE04C3uPOikXpemfmQCiaMA=
X-Google-Smtp-Source: AK7set+7XkMQw//QRP6U0zw01ONMG6SisHKvyle8hz7Ra/I8s94s0O0zFWuYYD6E3TY5EKsJLVrbaA==
X-Received: by 2002:a7b:cd10:0:b0:3ee:672d:caa4 with SMTP id f16-20020a7bcd10000000b003ee672dcaa4mr686528wmj.17.1679606470461;
        Thu, 23 Mar 2023 14:21:10 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c450700b003edddae1068sm3135457wmo.9.2023.03.23.14.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:21:10 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?ISO-8859-1?Q?Andr=E1s_Szemz=F6?= <szemzo.andras@gmail.com>,
 Icenowy Zheng <uwu@icenowy.me>, Fabien Poussin <fabien.poussin@gmail.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Belisko Marek <marek.belisko@gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: sunxi: add MangoPi MQ-R-T113 board
Date: Thu, 23 Mar 2023 22:21:08 +0100
Message-ID: <3225657.44csPzL39Z@jernej-laptop>
In-Reply-To: <20230320005249.13403-5-andre.przywara@arm.com>
References:
 <20230320005249.13403-1-andre.przywara@arm.com>
 <20230320005249.13403-5-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 20. marec 2023 ob 01:52:49 CET je Andre Przywara napisal(a):
> The MangoPi MQ-R-T113 is a small SBC with the Allwinner T113-s3 SoC.
> The SoC features two Arm Cortex-A7 cores and 128 MB of co-packaged DDR3
> DRAM. The board adds mostly connectors and the required regulators, plus
> a Realtek RTL8189FTV WiFi chip.
> Power comes in via a USB-C connector wired as a peripheral, and there is
> a second USB-C connector usable as a host port.
> 
> Add a .dtsi file describing most of the board's peripherals, and include
> that from the actual board .dts file. This allows to re-use the .dtsi
> for the MQ-R-F113 RISC-V variant of that board.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


