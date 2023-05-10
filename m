Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F13D7F
	for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 20:37:36 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-94f4b911570so1210324966b.0
        for <linux-sunxi@lists.linux.dev>; Wed, 10 May 2023 13:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683751054; x=1686343054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKLe9GckdTdkHZtguF0iXQBcbGXhHOajSjz8g7ZeM5M=;
        b=QQtE9RRCn/jkT69Hp2nltequONP9L6uyHnHEb4BbIfTZ89GoUPebECrUkGQyXfG2HC
         Zl0OSskrONHPqwhZ/+PGqWLCFX3eyunxhUPhs3pfuvnXmjDLXkPmxZRbkUqp0bdo7jOq
         qxnsQzjSirvkbiMLe3ND+RY/z13EuaPkJb8Q3H9OrWerC6L/kdwfZKp4dc22IxUOxoCr
         0ahmPx0F1BIBU7bQYunSEVFUfJV3f8AlhLi/Y7uMB7Yq4jUQZ1OItltgWrm+3/23Vpkf
         XzRKFO6AvNbc8pLTdRPwhMdY3tPr/VucXF1Q5XxrgAhvGXU0SEnAAKUBCP2YTaqhD83j
         Sebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683751054; x=1686343054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKLe9GckdTdkHZtguF0iXQBcbGXhHOajSjz8g7ZeM5M=;
        b=j8PZ/sSU8axW7bC1cHx+b6yeOLHHnDHplM1WDPi1XgdR2W8/HtXKewgEU3C/ykDZE3
         FJzoN+dOTriX/DUqxFJ0vgI9cqUg9jzu7pbViOiaPa9UqNea8m5KPoiSkJonwsUrYKmr
         DrVFmmcl6tBd+yfoz4VFRNdZskh1FQEidty7cT2rpEt29YcUsJowCp1wZs6gL842u4is
         JAuRjti2Wy5sOokWfBUwOVurklK1K7QHNbOKewJejQ2QN/zzWPg1ptnK4Sz6dccXYVUj
         0YF9GjqPUgfQsHFWh6dxnbl6e3SRA00aQbW/jJ/7nNbUn4IVswrJ4T8ERjzehG4QGy0i
         de5g==
X-Gm-Message-State: AC+VfDyqhnCvXxqcDPH0Hcn75nn9WBoeTwEeTHioyxGOK0NYTNu0PSgu
	4s5BFpODwO0jOluKbATnYwk=
X-Google-Smtp-Source: ACHHUZ6EWi21RhWVFtn1nPxL+PWBZG0fvKPOx6+ELIllnIghvcwehy9Wf1jiMQ0PAowgDcnZAE0Chw==
X-Received: by 2002:a17:907:97d2:b0:968:1102:1fb7 with SMTP id js18-20020a17090797d200b0096811021fb7mr10543863ejc.6.1683751054155;
        Wed, 10 May 2023 13:37:34 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7db8f000000b0050bc863d32asm2215712edt.27.2023.05.10.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 13:37:33 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: samuel@sholland.org, wens@csie.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andre.przywara@arm.com,
 Ludwig Kormann <ludwig.kormann@ict42.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm: dts: sunxi: Add ICnova A20 ADB4006 board
Date: Wed, 10 May 2023 22:37:32 +0200
Message-ID: <3231392.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20230510111528.2155582-3-ludwig.kormann@ict42.de>
References:
 <20230510111528.2155582-1-ludwig.kormann@ict42.de>
 <20230510111528.2155582-3-ludwig.kormann@ict42.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne sreda, 10. maj 2023 ob 13:15:28 CEST je Ludwig Kormann napisal(a):
> Add board support for ICnova A20 SomPi compute module on
> ICnova ADB4006 development board.
>=20
> Specification:
> SoM
> - Processor: Allwinner A20 Cortex-A7 Dual Core at 1GHz
> - 512MB DDR3 RAM
> - Fast Ethernet (Phy: Realtek RTL8201CP)
> ADB4006
> - I2C
> - 2x USB 2.0
> - 1x Fast Ethernet port
> - 1x SATA
> - 2x buttons (PWRON, Boot)
> - 2x LEDS
> - serial console
> - HDMI
> - =B5SD-Card slot
> - Audio Line-In / Line-Out
> - GPIO pinheaders
>=20
> https://wiki.in-circuit.de/index.php5?title=3DICnova_ADB4006
> https://wiki.in-circuit.de/index.php5?title=3DICnova_A20_SODIMM
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Ludwig Kormann <ludwig.kormann@ict42.de>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


