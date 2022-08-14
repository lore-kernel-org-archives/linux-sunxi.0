Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA58EB8
	for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 10:27:02 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id e13so6348628edj.12
        for <linux-sunxi@lists.linux.dev>; Sun, 14 Aug 2022 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=F0QRLiWNSzIQtXswU6jXQI0utW/YNhjytPAn4syeAYo=;
        b=ZJSfm9kFCx/eZhg89Rs0t3m6Fy6adkXoTliit5PQQBdOtlMcNIvsEyy8+F8a0jpwPV
         o/dWuLgA8XDB66FvEGPw8jwbfxawdxjs+PMY0VwWWT2n9OVTGgFA7C36sytkEtHURtQm
         GDsVciUaHteupndYBIofcffxzFAgoTKS9u/78I6SYN4NYUHD5z64TJvD7nLnTSvRPQgO
         +y6PhiP7eSdk7TihwV9QG72AQP6H/UeOZ26QXxVUN9iGaspbV+50bNBxdjW65Gh6AeA0
         QK5hzBSvcQ+tA6CCRDuJ9rRVNwVL9TK9aF97e1/DJci/A0DnA0TOKHmrgLLbzdhyX1+2
         8P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=F0QRLiWNSzIQtXswU6jXQI0utW/YNhjytPAn4syeAYo=;
        b=CZHYJNEUKmbI2ZUyP54yDSUA1yI8A73VjbwbKp1BuD71GS24htFZX/AIElTQSBQCz9
         JksZxnzQ211L96wtA3VjwgrzDh0YsZZtdBqidFCx2CcEe59Y2xxxgYDfsyz/1J7r3cHu
         5TTyW7sW/4e9+XB6YvMlt0MnQocIvbPI0/ivTP+/i8o9Q4CEha4Sp46aQOpO4VyLedzd
         jFa/uZ+sSlAHnFjrxpKYW9klDHpKErtVmlPxhZcO6UdhVyOtfYmofakasJdQ9yxTDOZi
         gmhHwRVbBjHjsX0FzSi0+whanXPGpXPwiMibXjiQrdFcwAYmXhFLzyloycqXk3X3GA1I
         Xejg==
X-Gm-Message-State: ACgBeo0Ej2AgAgKBSDZHP/g/+5iNiYrL0Ig6iAYKPPcb8qoWN1szV/uO
	S2DgC1Lyhb3PPo6MQig++5A=
X-Google-Smtp-Source: AA6agR4i+V31/LTEjlSFFV72AWe8uaurlX4Rluvgz+I9IqK+DcOgFvetksqi/8H1PWhsoFDmBT5uDA==
X-Received: by 2002:aa7:de18:0:b0:43d:30e2:d22b with SMTP id h24-20020aa7de18000000b0043d30e2d22bmr10478796edv.224.1660472820604;
        Sun, 14 Aug 2022 03:27:00 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id v17-20020a17090690d100b0072aac7446easm2810028ejw.47.2022.08.14.03.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 03:27:00 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Icenowy Zheng <icenowy@aosc.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/9] soc: sunxi: sram: Prevent the driver from being unbound
Date: Sun, 14 Aug 2022 12:26:59 +0200
Message-ID: <22747013.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20220801030509.21966-4-samuel@sholland.org>
References: <20220801030509.21966-1-samuel@sholland.org> <20220801030509.21966-4-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 01. avgust 2022 ob 05:05:03 CEST je Samuel Holland napisal(a):
> This driver exports a regmap tied to the platform device (as opposed to
> a syscon, which exports a regmap tied to the OF node). Because of this,
> the driver can never be unbound, as that would destroy the regmap. Use
> builtin_platform_driver_probe() to enforce this limitation.
> 
> Fixes: 5828729bebbb ("soc: sunxi: export a regmap for EMAC clock reg on
> A64") Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



