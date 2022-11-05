Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2AE7C
	for <linux-sunxi@lists.linux.dev>; Sat,  5 Nov 2022 21:14:06 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id a13so12319394edj.0
        for <linux-sunxi@lists.linux.dev>; Sat, 05 Nov 2022 14:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4NP9yupkpzBRyQpmDT8lYy2UWrONdv5iBY3bNlIxTE=;
        b=fCiW8BnrNQDhBG/jBne3EdTh6WbpaMBZr0F+ItEpV+9o7LtESAX2aCcb+qyicB3bn8
         +FaoQd4zmCu+TlYQHJ2H2xdkCtVzvPtpvOwBhjdjzhKVgExK6JdmAKdkznuvKbepHrno
         2NdOKVdyCHeyq2DxSa4fgVDTENLg3+BkhY7FPazBwTUhDuCppyy8GUzuW3HIFsMs9b5p
         MN98D0CttT2kxUXk5byk6dAiowgXhoKFFIs6HE6Xe6YSWfZLL6b/+7BoaKt0VQ1JXVq+
         8gli8a/2wpo9zaqpgDilmHe91hlF/v1Hsr3wi2qfUMkTV4HpQ9a/bNr+5TNpb5kVJA7M
         7EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4NP9yupkpzBRyQpmDT8lYy2UWrONdv5iBY3bNlIxTE=;
        b=jWmf6sbryGnl6zJq14jvXXuLbQyJ9zHZT0xmsGg+y3mJYVcCWTceSzBVq8CShSCp/j
         BTgjs0hQI3UljGfVyPa/8Lc+Y7rQRPjY9zEmQ2kFd0P1NoNQqNOTbi3rCuHma9Kcv8Xb
         YUt3gmCncdT9NMz4CJVdWP2JrynQfstge2QoR52Qfi9CBQzyfWI6KAYDKyrtmRxjdJbh
         bSMqAa6u0fpIGb5tJW+Tu4WEsjhqbdhQswms/LsXeVdoFRDXDMVaSi8fGGv24t9HwtGM
         macarK2u2SuhUx03Fqx4n2u1BPuSKPjlL8J9JngRLRmSDyZtUS0uZPdVb9eMcmvWVm05
         KW9Q==
X-Gm-Message-State: ACrzQf1vBBSaWpun2Qgmb95P+64e0bB/dag0RQtt/EwnRTLbylQtYBSB
	8kkKGtEmuHYgUr2zGe9v6P0=
X-Google-Smtp-Source: AMsMyM58qlmgkIdlBAoBbOk1+UZVOpUM/uCQW/HCKTww4S/Feij3fS3NWbeHWkIPIyrAr2a613tvFg==
X-Received: by 2002:a05:6402:90b:b0:45c:16a0:ec1e with SMTP id g11-20020a056402090b00b0045c16a0ec1emr43671146edz.427.1667682844639;
        Sat, 05 Nov 2022 14:14:04 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b00731803d4d04sm1330633ejx.82.2022.11.05.14.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:14:04 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>, Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: h616: X96 Mate: Add USB nodes
Date: Sat, 05 Nov 2022 22:14:03 +0100
Message-ID: <8136023.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <20221031111358.3387297-8-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com> <20221031111358.3387297-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 31. oktober 2022 ob 12:13:58 CET je Andre Przywara napisal(a):
> The X96 Mate TV box has two USB-A ports, VBUS is always on and connected
> to the DC input.
> Since USB port 0 is connected to an USB-A receptable, we configure it
> as a host port. Using it as a peripheral is dangerous, because VBUS is
> always on.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


