Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77545F9D6
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Dec 2024 23:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735343953; cv=none; b=ftuoOKNWCAZroStg0KonbeEwOXH9OEFEt2e1x7KO/cFUeTDiwLTVldCUubtkW9fjNVishYa3OZZnfgerqw0Sxw2890XEULVwLeU3UAGIQ+4RLFfabmKxcQWADNgL0qRf9Sn2jrY3U0gbvvMB1bHi0iqDWouczMGWfZLhb/cr+uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735343953; c=relaxed/simple;
	bh=PcVbruQKCVpThCQhS9OVVZeAiUKW8DeB80FK/GmUYvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pph6kG2htBZh5RjG9NwFpqMFmMZF19DPXCU7t0OU+MdabpIvt7qFs09ZuUfjKdZbVjKlNnPc3Z1wv/OtZMYbx9XXmRRutDx/MKdLzSm/M45bD50FBMSnaqVdvKn6pzhzSVWXH2/HCeMOEKikPlO/woi8Vb4CdBQP17+6qeUCsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aBz0tPGp; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aBz0tPGp"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-29fad34bb62so3841986fac.1
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Dec 2024 15:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735343950; x=1735948750; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9GD6E8fp/FwvixoMNl/hFkENwUOIXNrn02wG9UqtG4=;
        b=aBz0tPGpx1HslGSuU8om7GpLYnyiCQewg9C7hjr6gO5ZmznCTZiYTXDztPHi6VtjhN
         Ybnba3//Ab2K3LcvOWDB9wq3RYZG7dq+Y9xGmY17r7+F3MlByhVnCgaeTbJ5AQyouWEA
         /Hn+QOVTroIpK+CfuJ5x0/igp22ZHQ8QKdtbyRqQ4Qiu14Oz01jliIGUo25u7A4K3y3I
         O9/f73tL6eqJh83rmuNa6EmHXBjIgvZuLtGMWvYqxv3xuAykdOaQ1feKtCaYn1H9fhoo
         8gQToW9ijpmKPfuYYbxhJh5ZK51hbZAH7zZkXYWVj/ucYdxS94KHHs7b3OmNSZGfmtag
         gMeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735343950; x=1735948750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9GD6E8fp/FwvixoMNl/hFkENwUOIXNrn02wG9UqtG4=;
        b=qNpWw4UrVftVhLRO9K3hGEZ28fqKHHtfac1E3qfEvPb++nXlc5n1PoBaxaalf/Nv4a
         riWdfgQjnoGrgmdGLaMV9iFCDzVMvu82bX6+dmJTl2zekzwF5izlNaRgmcpwljNvCnLc
         ndvpk3rOR38+q0HOS8llwdoDsNudo2NoEbKOXdgAPmAPhnAto65J0bVwHJyYd+1j2vwM
         1YJ7d8lKgUJqsTG2ux7Km3EqP7SG5IBDSjSbHgM1K3GZ6ZuSfSyXhGpDt5Ak1+ZfI2C6
         SwMYki503zDvkVmHAU5o9rdSWhBwJNIToA+xyPBwD/2chNEp1KGmbju9B0rH7InqxP3H
         HQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgtwKTqQdoHdxCl9XwVAQLMUJmhwQNhKDSu8ApfSrI93HdAOawu4rvKMmc9Ar2EfCDBQrcNbsHBIsExQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAeZr6ILDxb23EX7scJdOIPV1vje8rUQtKrWvJcCnOX1Id+vWS
	MsFWTGoi1rm3da3BZSHfAFvRnjeVpqTC+C0MrVL22eKYDajMaPl2HQfolJq6pWS2BZRP7ZqLec3
	N7gPgYCoA8C/AHBlEGbsB1xklBr4=
X-Gm-Gg: ASbGncs4f1suC+8Qn8liNGVonhVxhwDjo9X7miTp0Peb0+aRON9QM2/fShmdBcXkKXI
	b4vtnTweuhbiqltKdcb6VB0/ZC4IehwbfMoJoUGxjl7dZjw56UNPy
X-Google-Smtp-Source: AGHT+IHF+9y91xAzk0WeclG07YYaJBdE2gf7HVbMMZ/WpHgN7HlLp8WAPxiUjkeqzJKcsxPtIyGDxr+7m2I+WGbBIeI=
X-Received: by 2002:a05:6871:d114:b0:27c:a414:b907 with SMTP id
 586e51a60fabf-2a7fb4d0065mr13413322fac.33.1735343950458; Fri, 27 Dec 2024
 15:59:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240302140042.1990256-1-megi@xff.cz>
In-Reply-To: <20240302140042.1990256-1-megi@xff.cz>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 27 Dec 2024 15:58:44 -0800
Message-ID: <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for jack detection to codec present in
 A64 SoC
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnaud Ferraris <arnaud.ferraris@collabora.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 2, 2024 at 6:02=E2=80=AFAM Ond=C5=99ej Jirman <megi@xff.cz> wro=
te:
>
> From: Ondrej Jirman <megi@xff.cz>
>
> This series adds support for jack detection to this codec. I used
> and tested this on Pinephone. It works quite nicely. I tested it
> against Android headset mic button resistor specification.
>
> The patches are a rewritten and debugged version of the original
> ones from Arnaud Ferraris and Samuel Holland, improved to better
> handle headset button presses and with more robust plug-in/out
> event debouncing, and to use set_jack API instead of sniffing
> the sound card widget names, to detect the type of jack connector.
>
> Please take a look. :)
>
> v3:
> - removed all device-tree related code
>   (it's not necessary for core functionality, it only helps make the jack=
 detect
>   functionality of the codec be usable from simple-sound-card driver, and=
 I'll
>   send it spearately, because it will apparently need several more rounds
>   of review)

Hey Ondrej,

Has it ever materialized? As far as I can tell, this code has been
sitting dead due to missing dt-related code.

Regards,
Vasily

> v2:
> - use set_jack/get_jack_type
> - get rid of some custom poking inside card internals to figure
>   out what kind of jack port we should setup the codec for
> - read jack-type from OF as suggested here:
>   https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-component.=
c#L288
> - add DT bindings
>
> Thank you very much,
>         Ond=C5=99ej Jirman
>
> Arnaud Ferraris (2):
>   ASoC: sun50i-codec-analog: Enable jack detection on startup
>   ASoC: sun8i-codec: Implement jack and accessory detection
>
> Samuel Holland (2):
>   ASoC: sun50i-codec-analog: Move suspend/resume to set_bias_level
>   ASoC: sun8i-codec: Enable bus clock at STANDBY and higher bias
>
>  sound/soc/sunxi/sun50i-codec-analog.c |  73 +++++-
>  sound/soc/sunxi/sun8i-codec.c         | 346 +++++++++++++++++++++++++-
>  2 files changed, 399 insertions(+), 20 deletions(-)
>
> --
> 2.44.0
>
>
