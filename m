Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653D0173
	for <linux-sunxi@lists.linux.dev>; Sun, 25 Jul 2021 06:19:32 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id jg2so5351903ejc.0
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Jul 2021 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SIck5SP4jVyfyWHtCecWh4zwWfVoUNkaheu5z8koPZc=;
        b=pbmdZNVOUXjTfsjVf7qh9TY96niljMTq8JtgWGdK1iU9EefgYORGr0cXPQnqU6+CdZ
         NmKki72S8t3AJqXnDCk0kVRNq+BMXQjQo/B7oRLd6q+fszBQBYlfrlSLcFYaIZLz4qSF
         pF+F60DHdwebN3hHmCD0BTnctZb39MVIzxTHuV10HfH2B/oovZU+j5B2dz5l94GyeL5Y
         WEKeTE2YpkU6qOWhPRfK0vvlHpxxC/dXszFW54zTAEMivZ1jQumOSXIMzr2kdVM2BlJw
         kgLNDtiqBHr1u2voncGVFngewh8uN5KZYhndfX3Pix828/gwAMMPvuf76noaTuJq1WgE
         FiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SIck5SP4jVyfyWHtCecWh4zwWfVoUNkaheu5z8koPZc=;
        b=Jb8QK64oOXvbZEfEY/jWUpK6UU7gXvj3Cve6ihQIiz+N+2WU8G52tmF/zGKqEwp9Az
         Zq+DRbvi1kayb/uLP05h+W4Mh3fBbzYBTGBSUl2sOumLA9KQcptKpU0Ilpr3sGxAHi+W
         B+CyLwEhiArA+rwA/Yer8zYNtr5xBHXcykHxZqJ2zRUA3UND9jR6aX92XJGSQz5qpyxp
         3s+PcQPEesoDh2m5vqTiuyZwipi+xWXCuKKTFSzzEICWCtGaOHSuDpm9SI46dL0gFD0j
         Iajqrl9XX7f0Ao9oy7rv6Mb29Dv7ETbbZhCmqSq3pW7zOk6TPt0bPv6qf9EvJIEYbNVh
         XheQ==
X-Gm-Message-State: AOAM531C4Y0YzGQZ/R9MZn8A3rS1H0jalicYoWa8McoQ+juwK4dhWJAM
	PBZZL/35RhhCwDFjP7Qt/hc=
X-Google-Smtp-Source: ABdhPJwvaKADTZe2NCTPumx3xxOdd0DnpUqQmexiZg//uPwwcIGHPmJOE5GWDAHKXF2CZbAxRNEAmQ==
X-Received: by 2002:a17:907:1ddb:: with SMTP id og27mr11612506ejc.540.1627193970835;
        Sat, 24 Jul 2021 23:19:30 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-46-198.static.triera.net. [86.58.46.198])
        by smtp.gmail.com with ESMTPSA id mf1sm2352365ejb.51.2021.07.24.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 23:19:30 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v8 07/11] rtc: sun6i: Add Allwinner H616 support
Date: Sun, 25 Jul 2021 08:19:29 +0200
Message-ID: <3759037.3KSXBDaA9l@kista>
In-Reply-To: <20210723153838.6785-8-andre.przywara@arm.com>
References: <20210723153838.6785-1-andre.przywara@arm.com> <20210723153838.6785-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andre!

Dne petek, 23. julij 2021 ob 17:38:34 CEST je Andre Przywara napisal(a):
> The H616 RTC changes its day storage to the newly introduced linear day
> scheme, so pair the new compatible string with this feature flag.
> The clock part is missing an external 32768 Hz oscillator input pin,
> for future expansion we must thus ignore any provided clock for now.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/rtc/rtc-sun6i.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


