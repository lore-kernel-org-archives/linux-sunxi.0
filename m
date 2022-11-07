Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E907F
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 17:19:31 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id y14so31977268ejd.9
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 09:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qu2FEOZRSY9IYT6eXjzTtKMMNTggAYYqVs1ygedKPq8=;
        b=eP5ltGXdVJCTEnfFtucRNeoiDO5ISElM4ZgzkK3SF43MMp6aAHv4/ErdPHVGtlA/k+
         fVY5bwSwb2xnDbU7WgI0MzBFD2e0CfvwXjQvJ8PF0YAxl3187R+6KDI6cfhDgP0ORfVY
         3R6PFcO2XHWhAXPMASTCWpAKIcOHU885WW0tkCW5Ru9//iZw1EohBjJJlCeb2X0Bk+OI
         eKJkTRWaQd9GPAybx3k9MUln2IJG9A63ws42uE3087CsVN4nu+MzvbQcnN/TSLVMIQjy
         rDzJIgswPG4pItlOEbw6HXDD6jeBUrK4WWx+T+1Qdozru/hxX769+VXqQ4nWwlqWWN/h
         /kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qu2FEOZRSY9IYT6eXjzTtKMMNTggAYYqVs1ygedKPq8=;
        b=XF9tvnXot9/TRN6VoghCgFKL+Z587DaHpypyb6PTPd4gaa2LLb4fIE/mMnC2j4cn/G
         rubUBjhkYZ+yyOAqb64UuK0pl5OORCgNRdEtPrLNtuYBjdcGB0D1YCMYkn5YRZXtpyuI
         E1FgGk45i/R4QbueX2btRYEK6T+tc+yyAY8ZbLlaAYTNBY3ErmQ7eW09dJ4KnuQqo9p9
         OlsrGsRSQb1VjMOcft8Qlpje0FXCAgw8YzYM0Ri8dpF3NIQ9HeQgBkpKvpwLChxMaQrP
         QMepO233OTzuBcgaWeVuz5fRxmXZWPZYA6CoxJZZA8wqkRRcW9Kla3Ur73ngEQYv9eo0
         0rmg==
X-Gm-Message-State: ACrzQf2+9dYcwx9pxlu3lDOHbt01PG+7LHQc5rDc5oKdROSA3DVz9Zsl
	UmMV74SyGRuQMrYte34N1zXBep9OJ/s=
X-Google-Smtp-Source: AMsMyM6LCBPpdH5Hhccy3tvFaUxUzv+rtYf8WatcRANMUVqlYQrqC2RObFbO+iRqfgVOlcqQlUZMnQ==
X-Received: by 2002:a17:907:1c01:b0:79d:637c:7848 with SMTP id nc1-20020a1709071c0100b0079d637c7848mr49606542ejc.513.1667841569716;
        Mon, 07 Nov 2022 09:19:29 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r24-20020aa7da18000000b004643f1524f3sm4485651eds.44.2022.11.07.09.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:19:29 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>
Cc: soc@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 06/11] ARM: dts: suniv: licheepi-nano: enable USB
Date: Mon, 07 Nov 2022 18:19:27 +0100
Message-ID: <4780198.31r3eYUQgx@kista>
In-Reply-To: <20221106154826.6687-7-andre.przywara@arm.com>
References: <20221106154826.6687-1-andre.przywara@arm.com> <20221106154826.6687-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 06. november 2022 ob 16:48:21 CET je Andre Przywara napisal(a):
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> Lichee Pi Nano has a Micro-USB connector, with its D+, D- pins connected
> to the USB pins of the SoC and ID pin connected to PE2 GPIO.
> 
> Enable the USB functionality.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


