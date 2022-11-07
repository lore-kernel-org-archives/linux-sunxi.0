Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BCF12294
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Nov 2022 17:57:46 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id 13so32336103ejn.3
        for <linux-sunxi@lists.linux.dev>; Mon, 07 Nov 2022 09:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxMGJzI9yczq35UtPAYAALllIJzZbRyIRY5qsOAYDYM=;
        b=cp8fQ/lr2pACh25o4SFAe29CEOBwkgD5CiYwkbnVPImCgnC7svPfyzyrbNN7CI4c5y
         Sq+x/D7OV1wgNJprVeXLtksMAe8//y1t78qEMuuE+duZgYjKtw2yU9PAHKoz2LvisRXn
         o5YKvxaG0kG6POCXMM38s0UKyCxA1TAV9mkqAkp8xjmLsSe6wIdDlwhZyww57aPKaDW3
         d3TpSAGZtMgJVO3WNJIA1GsUzC+O2s5F7FzlFF7EmH0k77NAFzRuEi19WXMJ7Dfo1zzN
         42URxYQCjhED0S8sErvQfqQsLZsPmtoieNSiZt/1JkOMA4QMQo/IpX2vaBtIBNdn/BOH
         NSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxMGJzI9yczq35UtPAYAALllIJzZbRyIRY5qsOAYDYM=;
        b=a8Koobpl+1cJAPlMDjAjZe5D6709Tfdkc098nu/qXzbGH3k2hFUMNGQYrRi0txkxMA
         Drsad9qyXiEzJUb/Y5MakGB94DyDh4lYmasbhUHsjDXsE2RaGgv1Y8gTZ/4r6Ku+aAl/
         8CMmdwTSZAdJHbgWQr8xfI6bMVBKXW8zawqUtNmr4I9TVdFNh8V584RrjBAHdBaY9Pcj
         t4V1yZQl3kpBxCq87QzKeAty3ANZWx2LD6DhTMs2iE/r2YjDup/dShUYsoRvKz4Nv+2n
         e9o//6yPogVljV9qDeBuf6ROolrhrcT/Vs4nuF2Zj82N+6W9w09N6Mcg1Wli5LrFZpkt
         5gmA==
X-Gm-Message-State: ACrzQf0zdlc5wgrVZT7VDg9+QnJoBxsFxxrC79L/3TLntgCu2JNz1x+6
	u8xBvAghxaSuLpFnySYuCKs=
X-Google-Smtp-Source: AMsMyM60zRpbHPqPHVqmb2QTP+YCYUc0O09jY92wMfgdidMGGiCojPWPfJezpn4zPnFACI1XXhcE7Q==
X-Received: by 2002:a17:906:cc0f:b0:7ad:2da5:4711 with SMTP id ml15-20020a170906cc0f00b007ad2da54711mr48408500ejb.628.1667843864825;
        Mon, 07 Nov 2022 09:57:44 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r18-20020aa7cb92000000b00458947539desm4563899edt.78.2022.11.07.09.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 09:57:44 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andre Przywara <andre.przywara@arm.com>
Cc: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>, Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 02/10] ARM: dts: suniv: f1c100s: add PWM node
Date: Mon, 07 Nov 2022 18:57:43 +0100
Message-ID: <2201604.iZASKD2KPV@kista>
In-Reply-To: <20221107005433.11079-3-andre.przywara@arm.com>
References: <20221107005433.11079-1-andre.przywara@arm.com> <20221107005433.11079-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 07. november 2022 ob 01:54:25 CET je Andre Przywara 
napisal(a):
> The Allwinner F1C100s family of SoCs contain a PWM controller compatible
> to the one used in the A20 chip.
> Add the DT node so that any users can simply enable it in their board
> DT.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


