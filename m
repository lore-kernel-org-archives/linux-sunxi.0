Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7F27E57C
	for <linux-sunxi@lists.linux.dev>; Sat, 13 Jul 2024 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720874260; cv=none; b=iDgiXEOSkmnUyUfENqKpTxVx2rJGc0EpltPyEx8wYL78Js8si5+g6WTtd8LM0MOTpedwVFUZRhepzLWFIkCcYnAT7zCe49sZ1tkKqkMDQgAvZdneHr6+L+chKajRfW7CfPu/rriiis4FMbZIXRx60ykWiSfrNEcALTYIBu7AWEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720874260; c=relaxed/simple;
	bh=ALEtotDXe1wTfhh/A0WxVHMSMACce8epsNr3CJUeDxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEunY86HoVWmr9rxCAqoJ06yrGD8D022JHpHS6HW0ic5G/HNXe/A7X52CzPQCZtyYS/wHRUC3G5Dh7k9F7h2XdFMSENr3lmZm/XYFJhPbZbtossHKasshMpgUo5w6znM0SS0RreK0H2HDmhUnEmG2hS+ly1YX1I/SQMGA8fbQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QSkJzazX; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QSkJzazX"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-595712c49ebso3501791a12.0
        for <linux-sunxi@lists.linux.dev>; Sat, 13 Jul 2024 05:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720874256; x=1721479056; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQLJcgSqmrEQyTwsPNpqaNNOR1im9T0KFBjj4JZBLIg=;
        b=QSkJzazXgjqJD3ctAbbMAp/n7oI1Uv54oaCf1+HKt8n+DpHneL52ZWV0FprS7lZiM6
         BuGbQDld0oMEc0UcHp9tzW14//cTAmi2GV3wZVYVvNuEW/YTboDENydm+Eyp3X30eqly
         oNrLXjAYf2HI8jMa2jcXpfd8Dt4tGbhkZ46yTOfh/DWzTKbOUp21ITpvugk8d9bYfDkv
         oacHIFNLdiYUDBvD9u1UFLGHgmGl2q+gl0FdjRrcrhIul/RAzMqdRblfNVXxrUCvgzoX
         SfzWotzQVDYoc6Wx6Gj1ii0j7//z0Imk/D1IUNT0eXo11AJbH6xszG5zlKi0tAIE+CbV
         IzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720874256; x=1721479056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQLJcgSqmrEQyTwsPNpqaNNOR1im9T0KFBjj4JZBLIg=;
        b=l+SEkcU2yfy68zQIIW1fyxygns3W4OWyRfjLv9nJJdAybvX+RSS8mXfJZTSHhVOqQs
         SceZpuKMJywuL6DhnW1Asgu15QHLfW95FyRmH+k+tY3mQzuDIaKZHtlPD2TgdsXDszFJ
         +z59386Fql2KzAJmG/zjB060qfIfU9P9DvGlSGCdyr90JQM27Ut7/78Nx0431DaejMYo
         gOp+LYMwveoj416AD48ZYXYKj4bNtPXYfzAVvLHmsVsfFj51leCobpwJKSKnCnsdoNnd
         8Y3/PRoL4ADYKZhVWJlSr3WQvgFNRWRnhKAzN9E1g+XToDILdXaO7c6QvFGl9quyxGVM
         tumA==
X-Forwarded-Encrypted: i=1; AJvYcCWRdURSTXuO9ubgyKavJLTg3YZ4fia6KsUt9Qs4v/Fi3ZInw0q9JtzXsrPNSVmUnVhMQA/TUYJ1s64OeSm8PtUVU/gfMJTsA8aGSjg=
X-Gm-Message-State: AOJu0YycVzCx8Vl6L4RuZfBpjnSDqKBYHf8OGn9KhoH+qUCrzRZU4ZTb
	ai+kbwi8Jm7ZAMgA6TeYuQSoAL6xeREUtpuGbrg9pX2nwLt+iffbIyEjgU7maYc=
X-Google-Smtp-Source: AGHT+IFoeMrCBWUO2pW01nr/SM+st8eNPSLq69gJBv83LXWhWaXsXistVx+E/nH5md9gax+j+IcniQ==
X-Received: by 2002:a50:d518:0:b0:585:437c:d7fc with SMTP id 4fb4d7f45d1cf-594bc7c7e61mr8692805a12.32.1720874256509;
        Sat, 13 Jul 2024 05:37:36 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:3c82:4e3d:25d1:b685])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b2504b8a2sm724185a12.30.2024.07.13.05.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 05:37:36 -0700 (PDT)
Date: Sat, 13 Jul 2024 14:37:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hironori KIKUCHI <kikuchan98@gmail.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Aleksandr Shubin <privatesub2@gmail.com>, Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 2/5] pwm: sun20i: Add support for Allwinner H616 PWM
Message-ID: <c7iwx6erdqv7uahd47ymlwcid67wbfizkblngv7r3dx7i2i735@ujams5zx6b5b>
References: <20240531141152.327592-1-kikuchan98@gmail.com>
 <20240531141152.327592-3-kikuchan98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rimaol34dtjgodgo"
Content-Disposition: inline
In-Reply-To: <20240531141152.327592-3-kikuchan98@gmail.com>


--rimaol34dtjgodgo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, May 31, 2024 at 11:11:34PM +0900, Hironori KIKUCHI wrote:
> @@ -20,8 +20,17 @@
>  #include <linux/pwm.h>
>  #include <linux/reset.h>
> =20
> +#define SUN20I_PWM_REG_OFFSET_PER_D1		(0x0080)
> +#define SUN20I_PWM_REG_OFFSET_PCR_D1		(0x0100 + 0x0000)
> +#define SUN20I_PWM_REG_OFFSET_PPR_D1		(0x0100 + 0x0004)
> +#define SUN20I_PWM_REG_OFFSET_PER_H616		(0x0040)
> +#define SUN20I_PWM_REG_OFFSET_PCR_H616		(0x0060 + 0x0000)
> +#define SUN20I_PWM_REG_OFFSET_PPR_H616		(0x0060 + 0x0004)

Instead of having a conditional for each register, it would be easier
to do:

	#define SUN20I_PWM_CHANBASE_D1		0x80
	#define SUN20I_PWM_CHANBASE_H616	0x40

(maybe with a more suitable name) and then do:

	#define SUN20I_PWM_PER(sun20i_chip)		((sun20i_chip)->chanbase + 0)
	#define SUN20I_PWM_PCR(sun20i_chip)		((sun20i_chip)->chanbase + 0x20)
	#define SUN20I_PWM_PPR(sun20i_chip)		((sun20i_chip)->chanbase + 0x24)

I would expect these definitions to appear in the order of register
addresses, that is below SUN20I_PWM_CLK_CFG. This reduces the size of
the private data struct, is easier to understnad to a human (I think)
and I claim this results in more compact code (without having it
verified).

Best regards
Uwe

--rimaol34dtjgodgo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaSdQoACgkQj4D7WH0S
/k6+QAf7BrtLVy5151/xN7lxLwW6Yq2j8mA3JiYPAFPnA54ZPTb1RUd0ybEyztdz
mwlX1ucMc0CbzENqiyRUw4u6cYqx2kx8pYLCk/A6fDrp4AktR0IqwAHVLXTh89t+
blf1YDbxgizYv6FrSeYFArjXcb1Tg8CaPRF8fJHNRJ9Aovw8D+n99gwj3OUluEtk
uqqSyAalJn17RjCWa+z4bdxuR9LBSxD7h9s9ojc/COfkKyYlGi71CUJqKEc/EBmF
cRERitwx/uRcWsQxHedROjLhuQw450WXZ0CVgcAQBgBRCOd4vaVg5Ld13p91RIvd
yL0kmYFaFR8bbDKLr6sjPDPDVDoj/w==
=vciA
-----END PGP SIGNATURE-----

--rimaol34dtjgodgo--
