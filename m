Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778911;
	b=qZ1IcT+bew7phIpPgMFwBRkMAJJxxfs70aGRWWMhIf84fve4HO/lNagL7ugkkWsVXmoH
	 f3VCUdbRsjcHwsnlt3Zog5YPCsuFA4hHqkBoUfCfTxrCnOnICBm/v72I70RSHd22Oy+//
	 j7UXHuxZfJSOa5hNfO/k8kOv0DsmycSxiW8H/qRFnyoLsh9baLEihrmcKEHHjwybe85Nf
	 TbEAMC4nwaDvumnRKCLrtahuBrRdeZ8v4e2yZCu2/HbsPyh9dvnaN4cKaDX2rsIkYniWq
	 Nj1zN81t3haIZ2BFg4YL5qPZRytkOjPBA6jPGPPqGRV5MCCKh9YnKz5MLg+VL+Cilew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
	b=fvHmmHWM6yV+MKZFldic5/p8zehrHRXzO1XRz3iCR5pzHMWMbiNAAFutM9n1cqJhNML5
	 ykyCKvDGKOqzjqhlTYYpF4k0/kdU32kCnj5pLK5v6C1+Se6vwQIFkM5sK/BlwT8dHtOuv
	 wDI2MaNx/+c6YhJB3EQ4va9o1WiBy8C/nhZeN3nfx1sGWzfVHEZwN2gUi1Cwk6TSPO8eI
	 C3HILUr6mP5xU+UogGwmi0X9C9b3fNjAzHM4qjNrDCNIDv2WDj9ZlIqY9Fhlz4cIKwXkO
	 JNtNAnzujyvjTTiouBrb6IB2y/fim6ujmnybrQydkN4tH1VHxOLUe8bvyux1IgzLdfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PITzJofI;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C69606A31F
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 11:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C69606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PITzJofI
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1440374766b.2
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Nov 2026 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795778909; x=1796383709; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
        b=PITzJofIGW13tOkRss8Lk3Qd0LeqyOaylshp6Fflag5FUKZsGIvQe3UoJAoP4D7yoN
         ZFAcByE7lAmqw8DzAGI9/YdLwOj60lvRGohng0Z4vTztSMkdEFwR1Id708O1ss+/x5DV
         9IcZM02gIlve8O/jV3qkCtIHYYn4s5WIIZ21cfich2fAgugYOQPqda0Bd2C4CxsXOdzM
         L4tpiMEWUhOjcwetVBbdEZ0Mk3Bofohpcj+j1DiGXCSOyaCJjZVdnLgGH+insvwNOmoT
         mOycNwoJI1caauxVJvXMEgX9bA8HOhYpfmBFVdVAhG6vC6G/Do/DVt3PD3JCxyQC/3hz
         LXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778909; x=1796383709;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fz3Wkzx8rOEKpt1iCTlZ8XB+/1jQEjWxVBqBZLbw99M=;
        b=rjHxNef6Sk98vuj05SDpXcWRQfvJJ2O1tBWUDxZVFzZmnB56x4KGlV54AG8NCkeCNG
         lPH3egbuHpYc6XbTUFDn1MSFjAyPrEN+jM+JUHAL9Lb4a2oJh7qqPpIK3d37sk2tcb0r
         YgfTEloNUadXWH94kNY4UcybvUuTHcIklq66ZXwqnY/+p7H+mnncR+uhGDgdXxTYHXdy
         eD4qazk3KS/g5M+ILKZF++elxa9wIj+cvef0rLFaSi+SCo3a8Rnd9s9PuXpQY+ssx87x
         f+Hc9fU5JV4njrmzexZnsvI54M1TgDVZmDoxHp9Bid39vzbIUbNx64yByxt1MBakuJId
         nOQQ==
X-Forwarded-Encrypted: i=1; AL+hErHc+xanP7tigteil+tOFtyKYzjKsrx/Rtd3Vpwb+kKq71GwdEsdhXklw7biqzOXLZMZAyovL6VlKn2NDw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/lwyl8KJtPT4mlhNmBBUFumNXkkg87y39telG17kKM1q6bFQOR
	D7WekgfxwJoOeGYGgerZQUCH9iYnxUt2ox/Y++QowTt9MkNotPmGQlKuIYrYehXCRfg=
X-Gm-Gg: AZFdTZdj35sry1bLJh9KMBv0dKczvws9dFNuCWbqS799Td5w9q4dzfBXIQqdOQowuur
	BTWXvB0/X0H1Ml/HsM5TQpcbbWAttXDP/3/QCxYQgLkcGq3V5yrh5coDPc9cdFN41ORshlmPe5p
	rQrWu0vGmLg6aA9XDsAGlD31Ji27YME/pdOAxZtJL7BfeR0HrE/VNwNjbxnqoMWeNy2hNUprH2b
	54eAV/BuyOuogQqPWIh5qpLjZl1yt4bSktQPz+WwObiogPc0yYkYyqx7KO3DIidxpden3ZSODfJ
	xny5kLYTojyV4qe3nXD+myumbnq+PdsERgLkViVh0sjRLFc8ha/zYqKTgU5Zez9KxO8RqHHf+rU
	33AqLgKhT/FNhp9lCDSn5u/lq8U7LD07ySZUrX8YNweT6bT2qcfyjvZ9eAHztBUbVmPso+PgtSr
	vxSVR8G/ShbRIGbCIg+MKLvL+YpjGC7Zpr+asEhHtS46Dm+nYPrGXYOJ7WcLdE0KaSKEYjkly2R
	ODB+zxYkVpVisIW8eky/IiWewMRBEFJQppNIhMTWQQs2AqGbXPIBCPuvtzkRjwOLfSwx0aNfRdi
	B3VTzQn5XXKRBNRJWxBec9qcmgT4etijP5B27PI/B5Soq0OI
X-Received: by 2002:a17:907:3cc5:b0:c2e:40a0:7978 with SMTP id a640c23a62f3a-c513aace8bbmr1830615466b.9.1795778909013;
        Fri, 27 Nov 2026 03:28:29 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm851858666b.45.2026.11.27.03.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:28:28 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 andre.przywara@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Pablo
 Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa
 <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin
 <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid
 <lukas.schmid@netcube.li>, Cristian Filipescu
 <filipescu.cristian@gmail.com>, Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 2/5] arm64: dts: allwinner: add A733 SoC description
In-Reply-To: <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com>
 <20261126-a733-cubie-a7s-dt-v6-2@gmail.com>
 <p3YaXlLJTguQBGnWyMpb1w@gmail.com>
Date: Fri, 27 Nov 2026 12:28:27 +0100
Message-ID: <1jld6eldic.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ven. 27 nov. 2026 at 05:29, Jernej =C5=A0krabec <jernej.skrabec@gmail.co=
m> wrote:

>> +
>> +		mmc0: mmc@4020000 {
>> +			compatible =3D "allwinner,sun60i-a733-mmc",
>> +				     "allwinner,sun20i-d1-mmc";
>
> That's not really the case, is it? A733 emmc has support for voltage swit=
ching,
> so regulator should be added here for voltage switching.
>
> I suggest that you drop this node until proper adjustment is made.

I'm not sure what you mean here. AFAICT in the documentations, the D1
and A733 provide the same registers and should be compatible. They are
so far.

The driver does not implement CMD11 but this equally applicatble to D1,
isn't it ?

What we might be lacking right now is properly voltage selector on PORT F.

>
> Best regards,
> Jernej
>

--=20
Jerome
