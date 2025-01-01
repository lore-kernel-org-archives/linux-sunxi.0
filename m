Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E63C3B1A4
	for <linux-sunxi@lists.linux.dev>; Wed,  1 Jan 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735721780; cv=none; b=CXk0+sBCC7vNfxauZHTC4g8ZrTeWEUpqzG3wxEblkDVR+OPMZJRiZ6o5OzxZs2jSU4sHkKQU2ENY3XO6bKBuoUrBjLSV/cBhCqmMVORNTJbVOENZuEF+lK/2DAMs16klSNa5cJpeII6pSAYZd2IlLfp2pDmqjrkhfmaDM3ZJAyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735721780; c=relaxed/simple;
	bh=5r6/onrG9flAAFCz83ykg7NfsaUS5Z94YtICC1qwEps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMCKlf6VIdW7SqcFkPCIfHZKXZ1REmnwYBmqAzg01ouX5aJHE8JlNSt+Ylxz9gTRVjAenf7/mhYQtJW4oQhoJFQsZ7VzxqrIeU+GBk1NIeIy62HMjmx0HHnFlmP2AQuOW92hStT8nBzVJAZbOwzmiMDEHiXeuEJPHhyKq7yYT7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso9187241e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Jan 2025 00:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735721774; x=1736326574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIrh5/xF9foHE2ZtaHkAInkCtUR6yzl9To1EWrJQ0MA=;
        b=V6lywdJfjbV0pqwqXglStJumpWctwtYOaO1SPLaAv86SBhhUHmvPf0pIKsGe36TIet
         qT1upBjgYh6cffOSJpOg9uTh/+zmdmiSaIe8fr/NbAKrR+GjAdeL46n8zqiozijeN0yw
         YhxkNqpCocemydEfJvMiIel3mmPUNnJzfM4JFPj8kmIpCK0tOZeLyqud3Y6c+/cVudtw
         nQg8Fc6c9mw3pIWA9Q++571hlGG3W0DL21oiiXkXcqsZcF1RJxgQNZHxV90AvCOELVmU
         HYjT7BS8O+XOnGWp5Y3Ix/SxXrUiqoJ7rU+8KZnGOLrFV0nqNbStOPzIIVFjpZYZgEUk
         exJg==
X-Forwarded-Encrypted: i=1; AJvYcCW8K2OlfzHKZ6cDXWMZu/hcl50jDbat5Z2EMTAZQscYWQvm6SwY91wjRQR2nCUHs+Yuf7B9TmCo1BE+mg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGhJ+QAKnKIat6bati3vPrbelvJa/rJazO6hVN3ZwT+C0vdC9D
	N3xaLqbRlLS8H1mFzt+OBNGofo/7UHVuZaEhHmMZF1mqvufu8quA+O1bqisX
X-Gm-Gg: ASbGnctbnYhB+tQF9f/HmbD1CPoRWvH3BwiRchBLdxs4KZGOaNRdVw/hWT3ELK+26Pj
	+jr2lr5ET8Au49gAHUTTWhtLgZBr3ldPY1j38kVltGI8tZtTwd0k0feGFJTvPFhXYLNJNt2CeG1
	tC9P1yubV7vYIr/6+uvotelMmM3vjKVmaJkJW4OoCkdlNUNMceAb1Wg+AyILX0re1yDW5PS4ZpZ
	grfD3wBbNCVzE4zCzKm9Z6if9UY88qNQ3polYRhdUXkf5XPvcGEWNvaSUTHxO+cDz0/Y4Wdt3oy
	kc4pTlBdQ5PVFw==
X-Google-Smtp-Source: AGHT+IGF8uNJyOiuN/wnAcSfyYMlDJYfSULt39NXWHMpLFV6/F6IC+YewJ2MwTHQW8TJWAg20VThcw==
X-Received: by 2002:a05:6512:3b0b:b0:542:2930:4376 with SMTP id 2adb3069b0e04-54229533e06mr12589637e87.20.1735721773812;
        Wed, 01 Jan 2025 00:56:13 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238217f9sm3540412e87.211.2025.01.01.00.56.13
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2025 00:56:13 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30227ccf803so124475011fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 01 Jan 2025 00:56:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUvawaexj23E8qvCQeeOfQTcGuMaXQcgtOrIaNMGGFVCu4gFXXwulr4COgny1ifSPav7KaQB794aYK7kQ==@lists.linux.dev
X-Received: by 2002:a2e:a54a:0:b0:300:34b2:f8a3 with SMTP id
 38308e7fff4ca-304685482c3mr137981211fa.13.1735721773198; Wed, 01 Jan 2025
 00:56:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241221094122.27325-1-ryan@testtoast.com> <20241221094122.27325-3-ryan@testtoast.com>
 <CAGb2v64qf0jNv72uHUK+aSj0Xt-bf+DW0NCnsZmLf-6xHZF_ew@mail.gmail.com> <982a7d32-ab58-434e-a125-4f7143928caf@app.fastmail.com>
In-Reply-To: <982a7d32-ab58-434e-a125-4f7143928caf@app.fastmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 1 Jan 2025 16:56:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v661eZPh8+ScJNUTXwm_y_RtrL7yo7EE4i_zg-=LrBhBhg@mail.gmail.com>
Message-ID: <CAGb2v661eZPh8+ScJNUTXwm_y_RtrL7yo7EE4i_zg-=LrBhBhg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: sun4i-codec: support hp-det-gpios property
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2024 at 5:20=E2=80=AFAM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> Hi Chen-Yu,
>
> Thanks for the review!
>
> On Mon, 23 Dec 2024, at 6:15 AM, Chen-Yu Tsai wrote:
> > On Sat, Dec 21, 2024 at 5:41=E2=80=AFPM Ryan Walklin <ryan@testtoast.co=
m> wrote:
>
> >> @@ -1635,10 +1681,11 @@ static const struct snd_soc_component_driver s=
un50i_h616_codec_codec =3D {
> >>  };
> >>
> >>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D =
{
> >> -       SOC_DAPM_PIN_SWITCH("LINEOUT"),
> >> +       SOC_DAPM_PIN_SWITCH("Speaker"),
> >
> > Why?
>
> The speaker amp is controlled by a GPIO, this needs a specific card contr=
ol to toggle on and off, discrete from the line-out volume. Muting the outp=
ut entirely is not what is required, hence the separate control. I also und=
erstand (although it is IMO not well documented on the user-space side) tha=
t "Speaker" has a specific meaning to the user-space routing. Can add this =
to the merge message.

It should be documented, and probably a separate patch. This patch is
for the headphone. Also, "Speaker" is a DAPM widget name and that widget
is what toggles the GPIO. So it's actually the kernel side routing.

And also, you can't remove the "LINEOUT" pin because it is referenced from
existing device trees.


> >> @@ -1684,7 +1731,7 @@ static struct snd_soc_card *sun50i_h616_codec_cr=
eate_card(struct device *dev)
> >>
> >>         card->dev               =3D dev;
> >>         card->owner             =3D THIS_MODULE;
> >> -       card->name              =3D "H616 Audio Codec";
> >> +       card->name              =3D "h616-audio-codec";
> >
> > Why?
>
> As mentioned in the cover letter, ALSA UCM in user space uses the card na=
me to detect and apply the relevant configuration, by loading /usr/share/al=
sa/ucm2/conf.d/<driver_name>/<card_name>.conf. Spaces are therefore removed=
 in the card name to make this easier to manage. Happy to add this to the c=
ommit message too, and this could be changed to card->long_name if it is de=
sired to maintain a human-readable card->name.

This should also be a separate patch. And yes please add `long_name` to
keep the human friendly name.

ChenYu

> See https://github.com/alsa-project/alsa-ucm-conf/pull/491/files for the =
UCM patch.
>
> >> @@ -1940,6 +1987,14 @@ static int sun4i_codec_probe(struct platform_de=
vice *pdev)
> >>                 return ret;
> >>         }
> >>
> >> +       scodec->gpio_hp =3D devm_gpiod_get_optional(&pdev->dev, "allwi=
nner,hp-det",
> >> +                                                 GPIOD_IN);
> >
> > Just put it on the same line. Lines can go up to 100 characters.
>
> Thanks, will do.
>
> Regards,
>
> Ryan
>
