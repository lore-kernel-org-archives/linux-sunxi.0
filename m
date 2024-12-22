Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBDE7DA8C
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 17:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887922; cv=none; b=tnb3p+/BJI9+wRZ0qc3M7GYxfDyequD1JezwrkbhXQITHk4VU7D23cAttuqD5DwTuOfDLtmAw7Cig59cHUk+VU35dvFyt6F/tZjVz83tJ97AeO5eSCPprH3qWU6oMJESOhWxIBwGSM1tYXevb4PsHcRw34CyY1hdlJJfAslFCJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887922; c=relaxed/simple;
	bh=QU43gHRimxwME7EdXJm0fUV670zAnP3j+xjD5MezmQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRFenEjRVZMaZjLiiRI3/tk9EGV5452EbFolBhDc/bzlOSPY4qvT+rdTOfqA35AAZjAaBg1OXQ8ER1gUt5nDwwCCiVoKj41mxcMowyiFym0ugx6d+gQtMX3/EkaIYGXojj96jkBO0BMhcwkIibuRd2WjE45pMUqJmuSt4SSYaqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-844d7f81dd1so144786139f.2
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 09:18:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887915; x=1735492715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhKfBgVLzd53/xf8WYhlbf471gUVHM73ZZMecnUo5fI=;
        b=wQLa86gxd4Y+7r7ZFaMhm+0Eb7BliepR/kd9HcNo9ud+lRBu8ZnvJJy/P3gk3YmKdr
         udSICWU6gjPDDFpLT8gH2mIojrRiRUZr7PNKnPCueBeC8Lj+G0wHKRd+XJ86RgSPthBf
         Ar+riJDZ333MWXJHUZBTvlSWyy508i+ygkgtU0Qo40Ai8L20nk2XRCk7wg509WV/ZyIx
         9soeHYYFbuA9tN6QBb6i7ULNh+h77o769k4Gx2usTALnhPFqRVTYH+pvXaYc5T+nFMsZ
         JasnIVdV/IVDRaCVmNjAgUrKQmBlI94av0gNQTxvsjyBhjap5nGRU/Np8LyVAPoRafXq
         y0dw==
X-Forwarded-Encrypted: i=1; AJvYcCUZpsZCRTz6pSKRgP3cn2mLI+GmcZgsxxfCnFsmVJeDZyV0LPeccNIov4e5EUQ5E9DS+r62lueqZZdKcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBw7LOoie8txuo8NKNQvMqdc/Qxbs+gnDe9ntk7rz/uMJNWlDa
	MfK+Op8Cudc8DNG5OOYS+iKsOLpb61sRtOgZdTKYY+Fy20OktSyC7nH2N8vjvrg=
X-Gm-Gg: ASbGnctmlu/qQhxYIvJoYLF4Z/KkezniiA8K1b4oQ6H9a3+lcXohwS3w6tSgf0UGae5
	/lh2mkLYKQOQZo0D0tthA9S3pa7Yj58ar1WwykOxbj5rPxyaSgjR4665mCTFa3JjTZtd1xHTmNw
	qfVy0bs5MlP1tYn1n+FzTy56fNUL0qtl/X/U919jx7C2XSSWixKeaI74ecUszeJbAGPAtamJ1Bz
	d7ZTwSiBLwVvoSgQGJefPJNEQXMMwWBGSSfIpEYMtHbB5kPkwPxilveth6vtKPR0+Z1BhpmArFS
	YzlXpmibYXVlvQ==
X-Google-Smtp-Source: AGHT+IGMOnsbrBsY9YEuuLvz8JsE5NbEcUmQLBAUiTqSnWjyqf+KXjp/4AoMXnCiczzoypdOAfMCtw==
X-Received: by 2002:a05:6e02:3b84:b0:3a7:bcbf:ba99 with SMTP id e9e14a558f8ab-3c2d2272e92mr101711725ab.6.1734887915353;
        Sun, 22 Dec 2024 09:18:35 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0dfb3264asm20387895ab.41.2024.12.22.09.18.34
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 09:18:34 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3a7deec316aso12347645ab.1
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Dec 2024 09:18:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEDZVDNkWrk1vFg0Wvl2PTb6vLSsaSEBmTM2zpvi9o4YkAgzoaB6DTtOJz1m2ib5p7Vzk38KXM+gvtKQ==@lists.linux.dev
X-Received: by 2002:a92:c56e:0:b0:3a7:1dcb:d44b with SMTP id
 e9e14a558f8ab-3c2d2975b28mr69446075ab.11.1734887914006; Sun, 22 Dec 2024
 09:18:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241213195433.GA1568@lemon.iwr.uni-heidelberg.de>
 <20241214011612.4fd9e4bf@minigeek.lan> <e61c927a4dfe909f4ede4a07dffd9dcd762875be.camel@icenowy.me>
 <20241220172134.GA9899@lemon.iwr.uni-heidelberg.de>
In-Reply-To: <20241220172134.GA9899@lemon.iwr.uni-heidelberg.de>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 23 Dec 2024 01:18:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ovacuS+G+k3zBvQR+rW2_TSYh4p5frj7fLxz81K9Kmg@mail.gmail.com>
Message-ID: <CAGb2v64ovacuS+G+k3zBvQR+rW2_TSYh4p5frj7fLxz81K9Kmg@mail.gmail.com>
Subject: Re: Re: [PATCH v2] ARM: dts: sun8i-r40: remove unused GPIO regulator
To: Hermann Lauer <Hermann.Lauer@iwr.uni-heidelberg.de>
Cc: Icenowy Zheng <uwu@icenowy.me>, Andre Przywara <andre.przywara@arm.com>, 
	Hermann.Lauer@uni-heidelberg.de, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 21, 2024 at 1:21=E2=80=AFAM Hermann Lauer
<Hermann.Lauer@iwr.uni-heidelberg.de> wrote:
>
> Hi,
>
> On Sat, Dec 14, 2024 at 03:13:23PM +0800, Icenowy Zheng wrote:
> > > CC:ing Icenowy, who added the regulator originally, with commit
> > > 0ca12c1ee43c ("ARM: sun8i: r40: add 5V regulator for Banana Pi M2
> > > Ultra").
> ...
> > > Icenowy: can you clarify what "newer" version this was referring to
> > > in
> > > that commit message? That commit in itself doesn't seem to do
> > > anything,
> > > as the regulator isn't referenced, and it's not always-on. It's only
> > > later when the USB nodes were added that it got used?
> > > So was PH23 really necessary? As Hermann reports, setting PH23 on a
> > > v1.1
> > > makes it reboot.
>
> diagnosed that futher now: PH23 is indeed powering the USB-Ports. Whats
> happens ist that I powered the board through the micro USB port which tur=
ned
> out to be limited to 900mA in axp221s. So the setting of reg 0x30 is
> the real culprit: Setting the two lowest bits in this register allows
> unlimited power over micro usb.
>
> In U-Boot:
>  i2c dev 0
>  i2c mw 34 30 63
>
> Or power the board through the barrel connector.
>
> In all cases the kernel turns on USB-A power and boots.
>
> > I am not sure, the schematics I have here (which says V1.0) have PH23
> > as NC... Well, the M2 Berry schematics have PH23 as 5V EN, maybe I
> > messed up M2U and M2B when developing?
>
> While V1.0 didn't need the PH23 setup due to nc, V1.1 needs it. Maybe V1.=
1
> was already on the horizon...

It seems this patch isn't needed then?


ChenYu

> Thanks for the insights and your support, guys.
>
> With seasons greetings
>   Hermann
