Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C595E20F5
	for <linux-sunxi@lists.linux.dev>; Sun,  2 Apr 2023 06:13:20 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b20so105390445edd.1
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Apr 2023 23:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680415999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zav6H2f6j8aOZ1vAy2MUTnnZzBeuhe5sWiReBikCE2k=;
        b=ITFteqwb+6ae6wcg8s0Cp/KRS0iU/aJKNqaXCySNW1RIBOlkKa8xFotIfeQm67BeDw
         hZheGqffT2nD/TD1mq2M8G5HYOb4ofS0qp64cSWz0OrpMHSRMY4ux0KCEYbJsaSD18o0
         7LIX562dW7caUyYafZUmlCjtoNqQYozw8h+ub40eOeKQy6GzozK7+mz9NZ7Cpw3wDHm8
         cxBwYtP4MnHV2FH070XzVlA6UnEos1RRieOQAXVg3Z7IY+Mcvo8eOYVstKqajvhp5p1z
         KXQcr/k/gtrb0/rN/xxKZcL8ZL0vEm1jZxd3KgYMe9nRJRTDWMX8BQbDnwOPnJEJi+Hc
         WpKQ==
X-Gm-Message-State: AAQBX9d3OIMIj6o26UXmFlqNM4af1ivQ0ozb4Pp5vzzvuZ80QSAInuXG
	RnWBqvszyeUaIKyNB5uEqNf9EIl2RccxQw==
X-Google-Smtp-Source: AKy350acXiM/xmJkqDlUb9hI/a+iuG4vTVL6BH0Gml18bhF2PyQDtsuvPmMSbcADRqfT3674Qb0OEQ==
X-Received: by 2002:a17:906:6dd7:b0:931:c99c:480 with SMTP id j23-20020a1709066dd700b00931c99c0480mr33020203ejt.69.1680415998716;
        Sat, 01 Apr 2023 23:13:18 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id gf19-20020a170906e21300b009351546fb54sm2862091ejb.28.2023.04.01.23.13.18
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 23:13:18 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id i9so26213115wrp.3
        for <linux-sunxi@lists.linux.dev>; Sat, 01 Apr 2023 23:13:18 -0700 (PDT)
X-Received: by 2002:a5d:591c:0:b0:2ca:4533:5d6a with SMTP id
 v28-20020a5d591c000000b002ca45335d6amr6560075wrd.7.1680415998031; Sat, 01 Apr
 2023 23:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230401001850.4988-1-andre.przywara@arm.com> <20230401001850.4988-4-andre.przywara@arm.com>
In-Reply-To: <20230401001850.4988-4-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 2 Apr 2023 14:13:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v64nm8pNK2bQ3fv=ZRFjc2sOGs7bRgekSZk=Gb5zcT=bPQ@mail.gmail.com>
Message-ID: <CAGb2v64nm8pNK2bQ3fv=ZRFjc2sOGs7bRgekSZk=Gb5zcT=bPQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] regulator: axp20x: Add support for AXP313a variant
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, martin.botka1@gmail.com, 
	Shengyu Qu <wiagn233@outlook.com>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 1, 2023 at 8:19=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> From: Martin Botka <martin.botka@somainline.org>
>
> The AXP313a is your typical I2C controlled PMIC, although in a lighter
> fashion compared to the other X-Powers PMICs: it has only three DCDC
> rails, three LDOs, and no battery charging support.
>
> The AXP313a datasheet does not describe a register to change the DCDC
> switching frequency, and talks of it being fixed at 3 MHz. Check that
> the property allowing to change that frequency is absent from the DT,
> and bail out otherwise.
>
> The third LDO, RTCLDO, is fixed, and cannot even be turned on or off,
> programmatically. On top of that, its voltage is customisable (either
> 1.8V or 3.3V), which we cannot describe easily using the existing
> regulator wrapper functions. This should be fixed properly, using
> regulator-{min,max}-microvolt in the DT, but this requires more changes
> to the code. As some other PMICs (AXP2xx, AXP803) seem to paper over the
> same problem as well, we follow suit here and pretend it's a fixed 1.8V
> regulator. A proper fix can follow later. The BSP code seems to ignore
> this regulator altogether.
>
> Describe the AXP313A's voltage settings and switch registers, how the
> voltages are encoded, and connect this to the MFD device via its
> regulator ID.
>
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
