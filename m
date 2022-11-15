Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6358AD0
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 21:40:45 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ft34so39388844ejc.12
        for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 13:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FN9fNzRPynZshOvz1sD/ekra6/Y60pLuVwbdRfSMmpY=;
        b=AoTcG+nryjYFo/HbwfQFUiJOx+15cUyilJQXqytwKEHJWeBZxJwrM5AZPu0Baq6IpV
         2ognOIa39AcdG8uRG8kyzv4XuFgsqa/ODt5i4O3FgjjrmqNguDDWu/tssEVMIU0mzGGG
         l4VK3XWP1clx6o8B7yuHxkfa4aNgXaFBUx/ekapGUGzmu65Vj9tmLqVZ9uE5/50ygavn
         BivPC7YkH/NNV805A3bf72LSZdqN4iIzB83iJtSBoREHhtjMzieQ5Uwcf25+ZYIpmpDN
         kPCwcbw8Y0bnT9xrEiPUoRjG/d8cSGSSqiJMvV+nmdx/LlEDofbSfzOsZHTDRcAB0eYg
         N9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FN9fNzRPynZshOvz1sD/ekra6/Y60pLuVwbdRfSMmpY=;
        b=hdNV1OLTSYGK+kl9RCykX1RrE217llyxEqt2QeJZYPPaZSwX/kZEPjEzKuv4qPnfmP
         PQqcuFs8ITja1Mzkxt0YMqB0etcLJnkMvXoGqpS80+B50+kHc7LuxDVoE90ebx/Wrgwp
         dGx5QkFSRH7hb/Rgec9s4HYTeArbZ5Fkg4j9GpvN+1U23M2v3KC1hj6aeuDad6esDAxQ
         HHuDTk6mXq2J9HZQC2eQOeHa/an4YQuxH8hPg1Rpd2ZYf9OhiaTeJmFtViOOu4MNUSNS
         Sg6GjvSh0BP0F2OAW24utSFpTojwzZUi+jNmwCPewGds6mUthwM6vqUSU8P8x+k34Gi5
         64YA==
X-Gm-Message-State: ANoB5pmvpvSgMkZoGOqXXXJ6l1i/ajZ30BavE/AVERftxiR4pZXaEvcE
	Xjywt0wABd06VhGwrO34pSE=
X-Google-Smtp-Source: AA0mqf5OJQW6ihS4SMk+yXRV3FrfzvFIX29Ff9k1lefBMoiTwIoglHQEOV9MXsYoGW0Vf5MAwvwakA==
X-Received: by 2002:a17:906:a1d9:b0:78d:b371:16e5 with SMTP id bx25-20020a170906a1d900b0078db37116e5mr14993448ejb.456.1668548443979;
        Tue, 15 Nov 2022 13:40:43 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id kx7-20020a170907774700b00787f91a6b16sm6025823ejc.26.2022.11.15.13.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 13:40:43 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 02/10] ARM: dts: suniv: f1c100s: add PWM node
Date: Tue, 15 Nov 2022 22:40:42 +0100
Message-ID: <7449883.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <Y3NpCKONx/0/COAv@orome>
References: <20221107005433.11079-1-andre.przywara@arm.com> <20221115101926.dldj6ralahdzhj7k@pengutronix.de> <Y3NpCKONx/0/COAv@orome>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne torek, 15. november 2022 ob 11:25:12 CET je Thierry Reding napisal(a):
> On Tue, Nov 15, 2022 at 11:19:26AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Mon, Nov 07, 2022 at 12:54:25AM +0000, Andre Przywara wrote:
> > > The Allwinner F1C100s family of SoCs contain a PWM controller compati=
ble
> > > to the one used in the A20 chip.
> > > Add the DT node so that any users can simply enable it in their board
> > > DT.
> > >=20
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >=20
> > I checked "by hand" that this matches the modified binding in patch
> > 01/10.
> >=20
> > Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > I assume the whole series will go in via a tree different from the PWM
> > tree? While this is Thierry's area of maintenance, I'd be surprised if
> > he had concerns about that.
>=20
> Yeah, it's probably best for the Allwinner maintainers to pick this up
> into their tree so that the bindings changes go along with the DT
> changes.

Yeah, that's the plan. I'll merge it in following days.

Best regards,
Jernej

>=20
> Acked-by: Thierry Reding <thierry.reding@gmail.com>




