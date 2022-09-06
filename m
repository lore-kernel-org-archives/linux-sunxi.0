Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB7386EF
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 21:09:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id l14so2577381eja.7
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 14:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZBP4bmIFnYpngNMLg2L1ipMV8YyqMIleAqmu8eQYWw4=;
        b=DzgzH2va0cK2otK4WNYDZVFLwHqrp+PZ1r2ObWBSJTr7jeqsr1PtI3DwxXjtyuyR2f
         N4/eOo5eXahYwb7srnc5uKO/uSFmo0mQ9QD6acjeJxYfLDvGshmgXMCM0cN4oWq4Z3ab
         W5PofaekUp60p8SFTMRDzjzI4Wv6cqS8CWwnwwap7f0Q1GZ0y0mMIRnLhjZvkTmXuRRh
         1bJASPVrnlGqBCvub48s1LB8nqGNJ3BwUoVEcBUJQ+sdJqLyoaGUWtjK3xg87pjxHi7y
         2ZNlGlF9UgCkAv18M1te4ZeJhP+qv3MBuEXdh5EMMZT8klkEACx/n1G68T7eULfdaIba
         40RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZBP4bmIFnYpngNMLg2L1ipMV8YyqMIleAqmu8eQYWw4=;
        b=UoQMY9MgncM7czZMf6cCHRAOQOrjvlO7eDhLimQtLmp0chbV4vpeYwJK2kSLjnkr71
         6Ge9REJyXPFV6WKEfQpUhkJMKAJ187Pxs9k519GwuQLV32lKhVwVgkUut30T85klxJUg
         9lAnxZbSfveCk46LFaxhL2u/3K0hxAJRSoUBqwC1goWS+9MNDUz9y0CxOEUjRpvPkAzV
         GQuvnFgfqN1VpfMSL/pJj2pvJww2Orog7BtOt0YnZ3v/5Ah1NKdwvn8ym9/wkk8zKu38
         qEsTTvbERicj7iyxvGLnEqGmX/gqBVA8U6tVZIUoefeK5+LU++O8L3q20q9wWkLrvjDh
         Go9g==
X-Gm-Message-State: ACgBeo32zfq9qBAyCLe48jqYy0WVEZrzhh4zvABuKeE8uUtVkJLJKFVB
	4pho73uA+4VDrgEJivncE/o=
X-Google-Smtp-Source: AA6agR75SfCyueGmatO84arDycsqszdMuCI+XT0KLj8q/qJ+0J8DenlxZPwwowLCMloRJu2+1Ppwyw==
X-Received: by 2002:a17:907:3e85:b0:73d:60cc:5d06 with SMTP id hs5-20020a1709073e8500b0073d60cc5d06mr260697ejc.722.1662498580422;
        Tue, 06 Sep 2022 14:09:40 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id d2-20020a056402000200b0044e9601e53fsm4047743edu.19.2022.09.06.14.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 14:09:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Yangtao Li <frank@allwinnertech.com>
Subject: Re: [PATCH 2/3] arm64: dts: allwinner: a100: Add device node for DMA controller
Date: Tue, 06 Sep 2022 23:09:38 +0200
Message-ID: <3373468.QJadu78ljV@kista>
In-Reply-To: <20220830020824.62288-3-samuel@sholland.org>
References: <20220830020824.62288-1-samuel@sholland.org> <20220830020824.62288-3-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 30. avgust 2022 ob 04:08:23 CEST je Samuel Holland napisal(a):
> From: Yangtao Li <frank@allwinnertech.com>
> 
> The A100 SoC has a DMA controller that supports 8 DMA channels
> to and from various peripherals.
> 
> Add a device node for it.
> 
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


