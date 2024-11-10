Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D31482ED
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 11:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731237404; cv=none; b=n6DxTjpe+gSWbxVDwBdgSB2OxBGrhuZC+m/PYQwgY85WzoK+jIKtCXBUp8LxwupPlkVJA7kF8AXKO43T1O/BcTmo0j4SXXFWm3ogeIyG+Ivh/L5y5Dca+n8Kux7bN+OwFchiUbvGkAf+hQVrAlhg+7t9m2vDANiRy55sm+m/E3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731237404; c=relaxed/simple;
	bh=OZq9vlY9kg8nMFQ9iEn/BhUcSlMehFtK5IV3YHw9HC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4xSEAntPQn/Ss2He0bHQ+V8IgDUtzzaNX+YY2yozVzpaXeEmCmJHTwvNBPrUKZvDr5Jj29R1oxsZYPrUu0xYZQMIRvBni9/fKWgPfMKRqX78E+sL+CEIK9NqAFEeXQZ/eAHDVpp3S7oHCjsr0j2rcYkfDrx1nBopmGiiEHnuQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSe5S/I5; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSe5S/I5"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-723f37dd76cso3709798b3a.0
        for <linux-sunxi@lists.linux.dev>; Sun, 10 Nov 2024 03:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731237402; x=1731842202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWLoy1wYXdVgZ3Zzo/mgTNAnxY3fZNEXmyBhaGh3Xds=;
        b=cSe5S/I5YJvI43UHaGasKvmAfGdCWqVugapnORtMd3+XOGyjYZEFnuxV/KDEyjHA0S
         nsEsgyy1OL94ZBtMQBmj9T7s4JUdBc5JjrubwA2pM1LzBrDo24+6g7vR0NKWhpRMT4uv
         jo4F9XT2iIsTHTw3ISV2VB+/fnn0R+D8lTDxWonlqkca9DA88myx+xETT18UGVuTCUmA
         UmQIR0XkRKyXSJBKlNqsJfwwZfYb2u1Ho/JdxDNo3tMMGQCMD9TYy8+sFlNYPGpCatRW
         1pb41M+eOz9y7lD1YzolQjxbRVveJRpyKQ7o9aHR+0T/oaWIsf7KgXiDXek4qCZFTs9/
         ne4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731237402; x=1731842202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWLoy1wYXdVgZ3Zzo/mgTNAnxY3fZNEXmyBhaGh3Xds=;
        b=joDET9EYsBXcpuWxR4unNxLEz/8MC/kmf0DevCvwdD21iCPF2JqQL+JPlhZ7apr6k3
         Cdv7jtSlhRM58p3x4QCHOoM02pZz3L7cal3XQUXHeutoiad+dCtZRAwZFS/HNX45h9AJ
         F9AF0OFqaxZH0vqwcsBdHNYrB8Nelc2F1ryHJW8pzoXc5w/x7OiJmNr3aqGoshOPt9U4
         oEWaZ8A3g7VlOm951uQcWYjzGf+ApbpWrV/czGOPgT8h3GV2HYm5BhH80Sycqw4mSyGI
         v9edqAUbSs/Sj9COZNxabhSrQTP1xdEjSWV8NVGYFUYXqNEScWCbTXKBk+KVw3enOzFt
         qoPg==
X-Forwarded-Encrypted: i=1; AJvYcCW+CApl1kiYRYbXBMb6h/L7yKj2jcC8hQi0o2iHW15OjsKwD+xjbx/HonNRJ4dn++8tS146RiNq8BjSsg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy37dwOfKbwZE1p7ey3Cv6SS/Y+SBwp1RNLpD/WBIezVFRC0am6
	lEP/BsiOcDcmyDAKydiNZ/gFHmz/sPs07VfSLkBRlkWkU08GDbYcYyn1n7i+fudgREuEB7H7oMy
	cdB9TqAzgSaOUKYOWdmvtlqU3oA==
X-Google-Smtp-Source: AGHT+IGasTpM/6LzeFT5yJG2TU6X3TKSkJ385a+2Pbzh0IgAuKC/AoNByQH4zEUJkFnY3DZ/d/AESg6jv7LXg1ObLTE=
X-Received: by 2002:a17:90b:4a91:b0:2e2:a3aa:6509 with SMTP id
 98e67ed59e1d1-2e9b1697bf5mr11996579a91.14.1731237402258; Sun, 10 Nov 2024
 03:16:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241011102751.153248-1-privatesub2@gmail.com>
 <20241011102751.153248-2-privatesub2@gmail.com> <4ioz6f6efs2uhf5mitb4xhebqeryyz5ukple4fkn54wpqep3c4@4ktefld35c3s>
In-Reply-To: <4ioz6f6efs2uhf5mitb4xhebqeryyz5ukple4fkn54wpqep3c4@4ktefld35c3s>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?= <privatesub2@gmail.com>
Date: Sun, 10 Nov 2024 14:16:31 +0300
Message-ID: <CAF4idNmDMQpFppUvCBbC1=SNMQBrTOqmFO60SMvKvaHvNJy=Bg@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] dt-bindings: pwm: Add binding for Allwinner
 D1/T113-S3/R329 PWM controller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Cheo Fusi <fusibrandon13@gmail.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Uwe,

I appreciate your suggestion to use a more standardized
property name like "pwm-number" instead of vendor-specific names.

Since the name "pwm-number" is present in two drivers,
we could consider using this name here as an option.
Or perhaps we should choose a new common name "npwms"
as you suggested?

Please let me know what you think about this.

Best regards,
Aleksandr.

=D0=B2=D1=82, 29 =D0=BE=D0=BA=D1=82. 2024=E2=80=AF=D0=B3. =D0=B2 11:56, Uwe=
 Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>:
>
> Hello,
>
> On Fri, Oct 11, 2024 at 01:27:32PM +0300, Aleksandr Shubin wrote:
> > +  allwinner,pwm-channels:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: The number of PWM channels configured for this instan=
ce
> > +    enum: [6, 9]
>
> I wonder if the number of channels is a property common enough that we
> can use "num-pwm-channels" here instead of a vendor specific property.
> Or would you suggest a different name? gpio-controller nodes have
> "ngpios", so maybe "npwms"?
>
> A quick grep suggests we already have:
>
>         fsl,pwm-number in mxs-pwm.yaml
>         st,pwm-num-chan in pwm-st.txt
>         snps,pwm-number in snps,dw-apb-timers-pwm2.yaml
>
> As a follow up this could then be used by pwmchip_alloc() to determine
> the number of channels if the passed npwm value is 0.
>
> Best regards
> Uwe
