Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84351292DF
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708706208; cv=none; b=VhO+u+ngwx0f8HGUAt5sVm3ZjWwuKKVrRrmrHHOISMkkuwnt28mN45IPqlYInVwykmC4ylJ1GmXFqS+Za1NbVkORdaR7VFJ8k/sqn+54ZDfJ9ezouyz4xfqGKGgaXYb4kt1VEJNeTq0n2+N4xYUSj6v0StOClMF5KDvdRz/LIXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708706208; c=relaxed/simple;
	bh=fI/IAdkB29JdV6KJtBT8ElzaQ0cLMc44qidIJ5rd/I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOD+sIZxdybL/oHena+0G1WaQwNqTsWtmZ9dfHIxtAWYW817Ttex9/AQ35prFwNTsaA/e5k/dlJDuXmIZlq0yiEm92vH+qgeGn3wfUtHO4Iz6id4V6deTnIVmJOQ7DLqEs7rJFjxnoHHdYFIg0FTvWp9ni14i4VIdMCd3D0j9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ellnmkQJ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ellnmkQJ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so1376766a12.0
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Feb 2024 08:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708706205; x=1709311005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKe39YFDJ/aeVcKQ4XcWYXwsRT9ZbN8/BAXxQxEi0rU=;
        b=ellnmkQJEAH8k/0YNRbQdd5HAPIaIhC9wlzy7z9R79ufM9aQUDlUysFYeAoAONIxmR
         ylYKKTHLdkxvTcVGsBbBJHKtYu+VwEyfwf6Ea4G7raRfKFz+hkf6siN5X25BqVmY2DE7
         L4Ux4wwoWMnmCK70FfI+dAprmeS++YWzi6ARMqQSLKrwBr9wfK0W2UdpCGmJJvPkwxbM
         wycT2EN8HIA97bzQywaOF07+zMB+qdYQgbwrV856KIyYIo//zwKUUMy5XGNyIp7qvKCs
         cJjQQn77LKPoZhwEKzWDArEgT8gtrJLgViukMXihbGYCfTukhBLA8n+G355+S8lMn5Fq
         R3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708706205; x=1709311005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKe39YFDJ/aeVcKQ4XcWYXwsRT9ZbN8/BAXxQxEi0rU=;
        b=OgovmO2s/GlYD5zKGT3ga8TVSJpvjwcR0NGkE5lH0dMRBPaJZdWUliDEpEJOFJnHYt
         mGHxQw2oCsEyQ0Tod1YkgxxhsUcrmjHoep5yRFfQqZtGrt0RilMqZ0C5cQOriAZmOOy6
         KFXgZalo8iGvb4mxseIg1uAFTNdl0brEezF8bXwYuv/MewX26ejLAoL5d9sp2SK6RWku
         8XwIkaIaPfh7c2coYLN+78ZF3vYqWfFWweD3LNprAOTUk5RDdEr3Of4XGPQ5QfQlE3gl
         thZGI1zaDTLG/kFctImBqmW1IUA+WBaofTHFcJn2uBdi2vhRVbAZtuBwfrbFoe2rZKQr
         uNww==
X-Forwarded-Encrypted: i=1; AJvYcCV4zJ27cKSuLwRSu+hwms+THmmtwZHO/V29/dLXEC3KwOplvnhb7814zU4r86l5fazWB3Ly/8e3nbfxxaKc3sJ/V8ZIM5rzx6rY9MM=
X-Gm-Message-State: AOJu0YxeVBCI2ZIXcQOfRm7YCmhFeB+fdT+J2KC37+dXOltAffiHQJh2
	Yr4Uo3UedvnRHBqO1CPd06dSlNNAXD2D0KG5pIhiqnpN6RsURO9A
X-Google-Smtp-Source: AGHT+IHVdyrN3kBkUrfWyiP7YQLML5RAlwreabe5AGh4wWZSEssVDk9CCs13QdkcRc8MkQf4ECAYfA==
X-Received: by 2002:aa7:d0ca:0:b0:564:54c6:6903 with SMTP id u10-20020aa7d0ca000000b0056454c66903mr295366edo.7.1708706204889;
        Fri, 23 Feb 2024 08:36:44 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id e10-20020a50ec8a000000b00564d6840976sm3194261edr.80.2024.02.23.08.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 08:36:44 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Aren <aren@peacevolution.org>
Cc: linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, Chen-Yu Tsai <wens@csie.org>,
 Ondrej Jirman <megi@xff.cz>, linux-sunxi@lists.linux.dev,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Miles Alan <m@milesalan.com>,
 Samuel Holland <samuel@sholland.org>
Subject:
 Re: [PATCH v2 4/4] arm64: dts: sun50i-a64-pinephone: change led type to
 status
Date: Fri, 23 Feb 2024 17:36:42 +0100
Message-ID: <4545459.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <n5rmhx7ez7xoqainjqxpdk47e3bw2pvtsgswofnhjdxtrk72j2@debhbdxsxz4m>
References:
 <20240206185400.596979-1-aren@peacevolution.org>
 <2792937.BEx9A2HvPv@jernej-laptop>
 <n5rmhx7ez7xoqainjqxpdk47e3bw2pvtsgswofnhjdxtrk72j2@debhbdxsxz4m>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dne petek, 23. februar 2024 ob 17:30:00 CET je Aren napisal(a):
> On Thu, Feb 22, 2024 at 09:57:00PM +0100, Jernej =C5=A0krabec wrote:
> > Dne torek, 06. februar 2024 ob 19:13:20 CET je Aren Moynihan napisal(a):
> > > The status function is described in the documentation as being a rgb =
led
> > > used for system notifications on phones[1][2]. This is exactly what t=
his
> > > led is used for on the PinePhone, so using status is probably more
> > > accurate than indicator.
> > >=20
> > > 1: Documentation/leds/well-known-leds.txt
> > > 2: include/dt-bindings/leds/common.h
> > >=20
> > > Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> >=20
> > Sorry for late review.
> >=20
> > Please update subject in patches 2-3. Instead of "sun50i-a64-pinephone:"
> > use "allwinner: pinephone:" (check commit history of sun50i-a64-pinepho=
ne.dtsi).
> > Also rgb -> RGB, led -> LED. Last, please reword commit message to excl=
ude
> > links and just say DT bindings documentation.
> >=20
> > Note that I'll merge patches 2-3 once patch 1 is merged.
>=20
> Would you like me to reword and resend the patches, or is it quicker
> for you to just do it when you apply them?

Since Ond=C5=99ej raised concerns, let's finish that discussion first. It's=
 possible
that this patch will be rejected. That would also mean new revision of patc=
hes.

Sadly, this means DT patches will miss v6.9 window.

Best regards,
Jernej

>=20
> Thanks for taking a look at this,
>  - Aren
>=20
> > Best regards,
> > Jernej
> >=20
> > > ---
> > > I can't find any documentation describing the indicator function, so
> > > it's definitely less specific than status, but besides that I'm not s=
ure
> > > how it compares. Please ignore this patch if it's not useful.
> > >=20
> > > (no changes since v1)
> > >=20
> > >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi =
b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > index e53e0d4579a7..6d327266e6cc 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > > @@ -61,7 +61,7 @@ led2: led-2 {
> > >  	multi-led {
> > >  		compatible =3D "leds-group-multicolor";
> > >  		color =3D <LED_COLOR_ID_RGB>;
> > > -		function =3D LED_FUNCTION_INDICATOR;
> > > +		function =3D LED_FUNCTION_STATUS;
> > >  		leds =3D <&led0>, <&led1>, <&led2>;
> > >  	};
> > > =20
> > >=20
> >=20
> >=20
> >=20
> >=20
>=20




