Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53083859FB
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 17:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783358285; cv=none; b=jShcBlJVexuC67nTVrCB/LFQFzc2sd3cuVzRisBATEP2jRJhUagsKMEu99dRNQjt+UNJ3Zqq1L6srqHXkdhBVe8KWQf4pephJS3C3EMNslhM5ud5i/zF8n6lL08D7DP1q7nFVBQWdyuNYxgKhTA7BIjeqwvcfWBsyOZH4aM5V/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783358285; c=relaxed/simple;
	bh=xJHh4kII0FuIdbBEV27sTUUFaEn9y3aDIzBlueKyMYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+Z9uXzmN/GcMx/Y+JM61t19MHun7tQHmvhzE4PhJUFD87Z+JT2MiE3TIkLCANn5OUaQk/3fP3r9R15yhjegrVLyFD85hXvQ2jqc+zsRzv2TEnjeMiBkZH/+cXa/wZJe0mZ+TjBvPSqeu3lnYPJQ9zBL50taN1WWZmt5hzG5y5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwY1eDXK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwY1eDXK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DAC1F00ADB
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Jul 2026 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783358282;
	bh=6SzTceFp/6u/0U2ZsHukaDCb4DvB8gNfQxW2S2HmJSM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=BwY1eDXK2casDflWj7FpxvSTaOUpF6I6RaUtfHX7uDXoOmvURB5vkHOFZ3pHN4mYY
	 YSGGZqwOvbbnTMbL4JbqmeosKm3zElo1oh74xaK2cuIPRsJrRkelv0KgiuijDYQDgk
	 jgkYTEOpsGsJKokmMJTN1q62s5tlSsBGpk+W8KAwQb+UN/LjcAfyhblYIeGfZWFvTR
	 sbwG67ET6OUBfimy9x3NQAU/oXqkl5hFQGoxEbLS3JhRqqidEAQlkCbmy/TtOZqqjw
	 mkqCCDLRDVkIqJHK62uiDjZ+hSojZjY67Rp5rHGYmscPI7iUW7H3YtnulR/weGeQvB
	 rh6bbe2+N/ipg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b293079d1so28058871fa.3
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Jul 2026 10:18:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqfK/OlDGOk0ifcnJeTsMnFMDymdgl/jnurlVZnvbF13HqJ8NQonEZMWcQaL+lHq18PvcxPgg/ATtMsiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYymdw7pdnFqTrAd9l2xwq2z4D4ZVnn5vfq1LfujIQObt9WA46
	DB0HbH4FeCFwHtwBLVbxbvYWtEyeT5I+EgRPgflFGa9Dp5moKeaW2tkKn6RDyDZdkuB3h1xG1gf
	SWUKDvQ2dItNCezCi15yFD8vY2kf2i78=
X-Received: by 2002:a2e:a99d:0:b0:39a:fec6:efd0 with SMTP id
 38308e7fff4ca-39c5ffae1cfmr4021431fa.23.1783358280803; Mon, 06 Jul 2026
 10:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606205452.2386930-1-lukas.schmid@netcube.li> <178335762241.4010120.15331558144606875972.b4-ty@kernel.org>
In-Reply-To: <178335762241.4010120.15331558144606875972.b4-ty@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 7 Jul 2026 01:17:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v66nsmz63tMUpkb_p6nXGCtvVSX4z8tJ0Ojg_6md0sY=KA@mail.gmail.com>
X-Gm-Features: AVVi8Cfs5u3u3Le8rfmIs2akFxo6f5Cg5zKm8U8X3Ch8xkPrjuDD5gQk7w4gesM
Message-ID: <CAGb2v66nsmz63tMUpkb_p6nXGCtvVSX4z8tJ0Ojg_6md0sY=KA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add support for NetCube Systems OpenNMC (dobermann)
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>, 
	Lukas Schmid <lukas.schmid@netcube.li>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 1:07=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrote=
:
>
> On Sat, 06 Jun 2026 22:54:40 +0200, Lukas Schmid wrote:
> > This series adds support for the NetCube Systems OpenNMC.
> >
> > Sorry for the quick resend. This v4 includes the corrected Makefile
> > target name.
> >
> > Changes in v4:
> >  - fix the ARM Makefile target name for the new board
> >
> > [...]
>
> Applied to sunxi/dt-for-7.3 in sunxi, thanks!
>
> [1/3] dt-bindings: arm: sunxi: Add NetCube Systems OpenNMC (dobermann)
>       https://git.kernel.org/sunxi/linux/c/9995c8146bb9
> [2/3] riscv: dts: allwinner: d1s-t113: Add uart4 pinctrl required by NetC=
ube Systems OpenNMC
>       https://git.kernel.org/sunxi/linux/c/5b0fd777eb34
> [3/3] ARM: dts: sunxi: add support for NetCube Systems OpenNMC (dobermann=
)
>       https://git.kernel.org/sunxi/linux/c/9dc45b17fb85

Force pushed this one to change "sunxi" to "allwinner".

>
> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>
>
