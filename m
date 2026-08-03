Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E165838333F
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785775016; cv=pass; b=OeRAg02lhMQcUO6HizIVSnROjh6xjKcrmjHxRSkXI4C1KYcBvmwHLE73cA6CY4THHfHKRCB9rwh3n0YpZ3FfqeHhLDtfVaQUwHkyeIEeQ6PKXMXA3b0NyQcEqb26LIqFZk5Ir+ob3MexfWV3cu+2wqfrzLsldLAyK0cJPet9f2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785775016; c=relaxed/simple;
	bh=K7WSdWoRnNatXjyT6a0V545KuC7+pJeUxQF1yR9byhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3/Sy785jTV+V5JHN5vbtindkc5YE4QQXxNdKGGY8OFix4n1+mWL98Udff/HVBlBhQCbj3EZb028lm6Bw6bO5VXOjhLD/wtZ0f/6p8aOzmPAaZ6tETq6DBxnJIClmkEQq25EprusyBLjLiC2XXbb5fzdpypb1aF9SY6l4s8FzPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haDJU66C; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haDJU66C"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9693bbb962eso2172187241.2
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 09:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785775014; cv=none;
        d=google.com; s=arc-20260327;
        b=KPaPrLm9Tbzoy0cvGBdJM5XsYuVQBpUmXVjsJoaiyF9ZLZcW2uUJj/jnh7OElU4/v3
         AMe/bv9bGScL0YxEVDVwW4rb2JnCJYZQq6fta2i0kvWR9z5wcIkZHJmn6veH0I981ydq
         UYtMO+zXJ71XqYleDpX0bnz+qC/ZQ3Zz+hqQyrnrgeXL+CO8sS520Vm4Imz12+NPbgJZ
         0hTHEUN7q7kf3oJQJw9kl5ByqFFmd7OWGp917H9ZpJ762rl5Wu9ThG5YG/8+CJskNjFB
         v4KmdzW8AvrnkAph9DpWV2LpFXYpyHrxo462o2yqeVo7YZI7cMQd+jLymoRekbZOnQMh
         TuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        fh=Toqzw0OJiiyNPlhqOmooO9bOaDcWqXW6qcjED31xjzA=;
        b=KPyA2HbX/mGX/MezGzgXdHud4th+mfNXHQhY+Vi1T7hMRNHf3vTur480x25BSgmYIh
         CbmPXrsZKvpq4qC5z8sRmfAaU7rtuEpnYFanZOuutMYGGUd6KqcJZNA4GWCads/zjSho
         9QmAsY/Y0ENwFVnuk9p4fPXV72l5SEnWtI8dPs5JtoBM+Kgy/5odS4SLml07oa6ziYly
         BHaQTJLcqNjMgAjh8mQO23cz9DJou1s3DdoQybwtsw+Ww1B63N57beOzYOTmX2vDMCEj
         yGw6woggulUW37skaGhQEWsJswJ2ZLQfngtufEQWeH4qladVWkWkYy/6cRuntS1EdmrM
         FJ2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785775014; x=1786379814; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        b=haDJU66CT5tfqbYkvyIWJ9jmGA7MeUsLOCB6nDSRPSLFEg+CCzTXvbjnpeGCUZvaQg
         jz0SbBHbQu8y7MFSVdnLGyJPvKcYxRX6RwORy5TVf1G1/+u+5hGP5N4xlUvDD/u2Phfz
         lrqjLivI8/pv1XMzXR/M/d61sZvQalPRk4s8VlcWOZ4HmRTdtmnRBuZFlxKvuqSYNTA1
         QMxG/GRlRcsQnBwArduagDP+3T46Xv6LVg2RC4tnm6oUVIU4j72V/9RzzZCtNpmYK1SI
         wMJoFJZGoTN0Ds9SZVxaeIzA/KFXnfIH16xTA3gwQiqijviKcf9juCJgXAMsJ3fiNVgr
         5qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785775014; x=1786379814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2mO7QnlyPovrqJ9WwdH4iPAu4v/YWoM0OB9E5eGsqI=;
        b=P8JuOksEiCEkFifkWOgg7LU7CmlluT4U2eP/xJSSHO2I43+jI99E56+uHiBi33bDYV
         qcny/bqEjXCbwApVXGp+FXL8VR/o8iIHb61gZPRHEuV4Kqqu07b3L869debFvG45ul2+
         NW5zYzMSfrjvVyiAsorPFfw0J5n0LGsrJsoRvOTsDV7RRQ49OIuqirxDTTqyGz1nBj0V
         TW6qJIagX7BA+j8C2mB5wwczBO5wtqwT2PYWDjd1UCu4bz2TIr1qANfQloPZhvyi1Nbg
         vTgT0tnpG5y2l9O79msuF6JUqWOqFRvK5hAXHy2wYo0bzxELPMMJqqdO2bQ+C8wWlBjr
         Y82w==
X-Forwarded-Encrypted: i=1; AHgh+Rr8xYSOhT1aK1DEBnvPGAGiev3p9LSV8jfLGLAonQApx+oZvLh5p2kEt+eM3NMNKpY8+RjhG+BXfksyBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YweKewD5goe+HygB7PsbB27LpxJRNoTmModwKrK+M1GPTBuOEFq
	pNK7ovC+btvbpTlXebTzFGaE6SuNbm16WOijY1Ij/+vMqTxuWLb+HSTEfVYDyigrElXRxKzGzbc
	JBA0ml0RMKr7gaYUb1E32ywx0nCX1oNo=
X-Gm-Gg: AR+sD13zOo9OwXST1hFSk1e3KtDjqXriCRSEtAHJiJMhPtdrLTcnH2pbGGqHkZDbi0O
	1INHuYBNJ6Dy8LnPzMKcKbmPB73Pavcf/HhlS4Hie9AQK5L4P301WCHm4vHZpZsfB1HIlFZ1/Gf
	xxq470K9g/wZIAVMjQKRUK87lKeSbA0tv2GWkDWgu7UeJgNQkjrSdG8l6W8IJHmn3xSTxNBO9gE
	by7ZOLm6VRr2qP/WCCeX8IHPks02MSF5AH+pzmzffPr6thOjgepw6yUSK9hDXmonz428qhiY8xk
	U7cEYSAc32KWbMYUflG3lvFINF6bkcDiyK4QrxgsgkkzEtf08gOPQrsy+YT3ohmTxLsqmPUqVRh
	lsKLuHUflElbl7Uu9nojM0VtF0LQr4xb4uAsAj3rT10eFtJSfVddjXNfNu0vydBQcf/6mJGvafF
	WDGC9uJSFWiBPj8KoYYu4/B9GytSUvx4ajhEoRrk89JjwAHY4=
X-Received: by 2002:a05:6102:41a9:b0:740:2bcd:24d2 with SMTP id
 ada2fe7eead31-75b2245a880mr8777953137.5.1785775013743; Mon, 03 Aug 2026
 09:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com>
 <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org> <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
 <e198e8fa-6c5e-4c8d-a4de-d8bb25aab0bd@kernel.org> <cd177647-827c-481a-9ac6-5f5a1882f14e@kernel.org>
In-Reply-To: <cd177647-827c-481a-9ac6-5f5a1882f14e@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 10:36:39 -0600
X-Gm-Features: AUfX_mxf143l7ltuwFHdM8jtybu0jFAqTogB47kH9lIVgz-FaKgqQGV-oPrZGYA
Message-ID: <CADvTj4qby5jow6BkvumZFK6cF8aLCTeQZz39VKEdm59jEtRp8w@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 2:21=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 10:20, Krzysztof Kozlowski wrote:
> >>>> --- /dev/null
> >>>> +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> >>>> @@ -0,0 +1,13 @@
> >>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>>> +/*
> >>>> + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> >>>> + */
> >>>> +
> >>>> +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> >>>> +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> >>>> +
> >>>> +#define AC200_IRQ_TVE                        0
> >>>> +#define AC200_IRQ_EPHY                       1
> >>>> +#define AC200_IRQ_RTC                        2
> >>>
> >>> Hardware constants are not really bindings, even though you use them =
in
> >>> the driver.
> >>
> >> Should I do something different for this?
> >
> > I would just drop the defines and the header, because these are fixed
> > hardware numbers.
> >
>
> Hm, unless they are not and you added abstract ID numbers for both DTS
> and drivers? Then this would be fine.

Yeah, these are more abstract ID numbers, they aren't really hardware
constants as the driver translates them.

>
> Best regards,
> Krzysztof
